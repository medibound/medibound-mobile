import '/flutter_flow/flutter_flow_util.dart';
import '/pages/records/record_list_item/record_list_item_widget.dart';
import 'records_list_page_widget.dart' show RecordsListPageWidget;
import 'package:flutter/material.dart';

class RecordsListPageModel extends FlutterFlowModel<RecordsListPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for RecordListItem dynamic component.
  late FlutterFlowDynamicModels<RecordListItemModel> recordListItemModels;

  @override
  void initState(BuildContext context) {
    recordListItemModels =
        FlutterFlowDynamicModels(() => RecordListItemModel());
  }

  @override
  void dispose() {
    recordListItemModels.dispose();
  }
}
