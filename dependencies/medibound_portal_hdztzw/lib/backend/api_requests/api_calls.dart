import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start API for UCUM Group Code

class APIForUCUMGroup {
  static String getBaseUrl({
    String? terms = '',
  }) =>
      'https://clinicaltables.nlm.nih.gov/api/ucum/v3';
  static Map<String, String> headers = {};
  static GetUCUMUnitsCall getUCUMUnitsCall = GetUCUMUnitsCall();
  static GetUCUMSingleUnitCall getUCUMSingleUnitCall = GetUCUMSingleUnitCall();
}

class GetUCUMUnitsCall {
  Future<ApiCallResponse> call({
    String? terms = '',
  }) async {
    final baseUrl = APIForUCUMGroup.getBaseUrl(
      terms: terms,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get UCUM Units',
      apiUrl: '${baseUrl}/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'df': "name,guidance,cs_code",
        'terms': terms,
        'count': 5,
        'sf': "name",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? displays(dynamic response) => (getJsonField(
        response,
        r'''$[3][0:][0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? descriptions(dynamic response) => (getJsonField(
        response,
        r'''$[3][0:][1]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? codes(dynamic response) => (getJsonField(
        response,
        r'''$[3][0:][2]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetUCUMSingleUnitCall {
  Future<ApiCallResponse> call({
    String? terms = '',
  }) async {
    final baseUrl = APIForUCUMGroup.getBaseUrl(
      terms: terms,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get UCUM Single Unit',
      apiUrl: '${baseUrl}/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'df': "name,guidance,cs_code",
        'terms': terms,
        'count': 1,
        'sf': "cs_code",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? displays(dynamic response) => (getJsonField(
        response,
        r'''$[3][0:][0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? descriptions(dynamic response) => (getJsonField(
        response,
        r'''$[3][0:][1]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? codes(dynamic response) => (getJsonField(
        response,
        r'''$[3][0:][2]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End API for UCUM Group Code

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
