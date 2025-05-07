const functions = require('firebase-functions');
const admin = require('firebase-admin');

exports.sendPatientInviteEmail = functions.region('us-central1').
	runWith({
		memory: '128MB'
  }).https.onCall(
  async (data, context) => {
    if (!context.auth?.uid) {
      throw new functions.https.HttpsError("unauthenticated", "User must be authenticated.");
    }

    const { orgName, orgId, patientId, email } = data;

    if (!orgName || !orgId || !patientId || !email) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Missing one or more required fields."
      );
    }

    const SENDGRID_API_KEY = "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";
    const TEMPLATE_ID = "d-847d9542b8604512aea42ff8dbbf1729";

    const payload = {
      from: { email: "support@medibound.com" },
      personalizations: [
        {
          to: [{ email }],
          dynamic_template_data: {
            orgName,
            url: `https://connect.medibound.com/invite?patientId=${encodeURIComponent(patientId)}&orgId=${encodeURIComponent(orgId)}`
          }
        }
      ],
      template_id: TEMPLATE_ID,
    };

    console.log("Sending SendGrid payload:", JSON.stringify(payload, null, 2)); // ✅ Debugging

    try {
      const response = await fetch("https://api.sendgrid.com/v3/mail/send", {
        method: "POST",
        headers: {
          Authorization: `Bearer ${SENDGRID_API_KEY}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify(payload),
      });

      if (!response.ok) {
        const error = await response.text();
        console.error("SendGrid error:", error);
        throw new functions.https.HttpsError("internal", `SendGrid API error: ${response.statusText}`);
      }

      return { success: true }; // ✅ REQUIRED
    } catch (err) {
      console.error("Function error:", err);
      throw new functions.https.HttpsError("internal", err.message || "Email failed to send.");
    }
  }
);