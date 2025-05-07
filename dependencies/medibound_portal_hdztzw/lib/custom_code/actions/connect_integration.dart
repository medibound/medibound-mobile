// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:medibound_integration/medibound_integration.dart';
import 'dart:convert';

Future<IntegrationStruct?> connectIntegration(
  IntegrationsRecord integration,
  IntegrationProvidersRecord integrationProvider,
  String redirectUri,
) async {
  String scope =
      "launch/patient patient/Patient.read patient/Medication.read patient/MedicationRequest.read patient/Condition.read fhirUser";

  OAuth2Client client = OAuth2Client(
    authorizeUrl: integration.authUri,
    tokenUrl: integration.tokenUri,
    redirectUri: redirectUri ?? 'medibound://',
    customUriScheme: 'medibound',
  );

  OAuth2Helper _oauth2Helper = OAuth2Helper(
      enablePKCE: false,
      enableState: false,
      client,
      clientId: integrationProvider.clientId,
      scopes: scope.split(' '),
      authCodeParams: {
        'response_type': 'code',
        'aud': integration.fhirEndpoint,
      },
      accessTokenParams: {
        'grant_type': 'authorization_code',
      },
      accessTokenHeaders: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('${integrationProvider.clientId}:${integrationProvider.clientSecret}'))}',
      });

  try {
    final tokens = await _oauth2Helper.getToken();

    print('=== OAuth Response for ${integrationProvider.info.display} ===');
    print('Access Token: ${tokens!.accessToken}');
    print('Refresh Token: ${tokens!.refreshToken}');
    print('Expires In: ${tokens!.expiresIn}');
    print('Token Type: ${tokens!.tokenType}');
    print('Scope: ${tokens!.scope}');
    print('============================');

    // Convert expires_in (in seconds) to DateTime
    final expirationTime = DateTime.now().add(
      Duration(seconds: int.tryParse(tokens.expiresIn.toString()) ?? 3600),
    );

    final integrationData = IntegrationStruct(
      id: integration.reference.id,
      accessToken: tokens.accessToken ?? '',
      refreshToken: tokens.refreshToken ?? '',
      patientId: tokens.respMap['patient'] ?? '',
      expirationTime: expirationTime,
    );

    return integrationData;
  } catch (e) {
    print('Error during EHR connection: $e');
    return null;
  }
}
