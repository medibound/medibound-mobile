import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  medibound_portal_hdztzw_data_schema.RouteStruct _currentRoute =
      medibound_portal_hdztzw_data_schema.RouteStruct();
  medibound_portal_hdztzw_data_schema.RouteStruct get currentRoute =>
      _currentRoute;
  set currentRoute(medibound_portal_hdztzw_data_schema.RouteStruct value) {
    _currentRoute = value;
  }

  void updateCurrentRouteStruct(
      Function(medibound_portal_hdztzw_data_schema.RouteStruct) updateFn) {
    updateFn(_currentRoute);
  }

  final _homePageRecordManager = StreamRequestManager<
      List<medibound_portal_hdztzw_backend.RecordsRecord>>();
  Stream<List<medibound_portal_hdztzw_backend.RecordsRecord>> homePageRecord({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<medibound_portal_hdztzw_backend.RecordsRecord>>
            Function()
        requestFn,
  }) =>
      _homePageRecordManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHomePageRecordCache() => _homePageRecordManager.clear();
  void clearHomePageRecordCacheKey(String? uniqueKey) =>
      _homePageRecordManager.clearRequest(uniqueKey);
}
