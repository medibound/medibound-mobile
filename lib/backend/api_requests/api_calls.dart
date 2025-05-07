import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Medibound Group Code

class MediboundGroup {
  static String getBaseUrl() => 'https://api.medibound.com';
  static Map<String, String> headers = {};
  static GetIntegrationsCall getIntegrationsCall = GetIntegrationsCall();
}

class GetIntegrationsCall {
  Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    final baseUrl = MediboundGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getIntegrations',
      apiUrl: '${baseUrl}/fhir/getIntegrations',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? integrations(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

/// End Medibound Group Code

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
