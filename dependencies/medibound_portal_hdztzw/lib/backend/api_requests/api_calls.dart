import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'invitePatient';

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
        'df': "name",
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

  String? display(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[1][0]''',
      ));
  String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[1][0]''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[3][:1][0]''',
      ));
}

/// End API for UCUM Group Code

/// Start Medibound Group Code

class MediboundGroup {
  static String getBaseUrl() => 'https://api.medibound.com/';
  static Map<String, String> headers = {};
  static GetOrganizationsCall getOrganizationsCall = GetOrganizationsCall();
  static RefreshApiKeyCall refreshApiKeyCall = RefreshApiKeyCall();
  static GetSecretKeyCall getSecretKeyCall = GetSecretKeyCall();
  static GetPlansCall getPlansCall = GetPlansCall();
  static GetBomSuggestionsCall getBomSuggestionsCall = GetBomSuggestionsCall();
  static GetComponentSuggestionCall getComponentSuggestionCall =
      GetComponentSuggestionCall();
}

class GetOrganizationsCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = MediboundGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getOrganizations',
      apiUrl: '${baseUrl}organizations/getOrganizations',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': jwt,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<ProfileStruct>? profiles(dynamic response) => (getJsonField(
        response,
        r'''$.organizations''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ProfileStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  List<ProfileStruct>? invites(dynamic response) => (getJsonField(
        response,
        r'''$.invites''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ProfileStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class RefreshApiKeyCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
    String? organizationId = '',
  }) async {
    final baseUrl = MediboundGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'refreshApiKey',
      apiUrl: '${baseUrl}organizations/refreshApiKey',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': jwt,
        'organizationId': organizationId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? key(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key''',
      ));
}

class GetSecretKeyCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
    String? deviceProfileId = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MediboundGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getSecretKey',
      apiUrl: '${baseUrl}device/getSecretKey',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': jwt,
        'deviceProfileId': deviceProfileId,
        'deviceId': deviceId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? key(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key''',
      ));
}

class GetPlansCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = MediboundGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getPlans',
      apiUrl: '${baseUrl}/payment/getPlans',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? maxTeamMembers(dynamic response) => (getJsonField(
        response,
        r'''$[:].metadata.max_team_members''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? maxDevices(dynamic response) => (getJsonField(
        response,
        r'''$[:].metadata.max_devices''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? planId(dynamic response) => (getJsonField(
        response,
        r'''$[:].metadata.plan_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? monthly(dynamic response) => getJsonField(
        response,
        r'''$[:].pricing.monthly''',
        true,
      ) as List?;
  List? annually(dynamic response) => getJsonField(
        response,
        r'''$[:].pricing.annually''',
        true,
      ) as List?;
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetBomSuggestionsCall {
  Future<ApiCallResponse> call({
    String? deviceProfileId = '',
  }) async {
    final baseUrl = MediboundGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getBomSuggestions',
      apiUrl: '${baseUrl}agent/getBomSuggestions',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'deviceProfileId': deviceProfileId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetComponentSuggestionCall {
  Future<ApiCallResponse> call({
    dynamic? dataJson,
    String? token = '',
  }) async {
    final baseUrl = MediboundGroup.getBaseUrl();

    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'getComponentSuggestion',
      apiUrl: '${baseUrl}agent/getComponentSuggestion',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'data': data,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? blockCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.blockCode''',
      ));
  String? timewindowCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timewindowCode''',
      ));
  String? tickerCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tickerCode''',
      ));
  String? colorCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.colorCode''',
      ));
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
