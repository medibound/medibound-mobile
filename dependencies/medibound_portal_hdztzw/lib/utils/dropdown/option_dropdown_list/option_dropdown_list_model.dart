import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart';
import '/utils/empty/empty_widget.dart';
import '/utils/loading/loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'option_dropdown_list_widget.dart' show OptionDropdownListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OptionDropdownListModel
    extends FlutterFlowModel<OptionDropdownListWidget> {
  ///  Local state fields for this component.

  List<CodedValueStruct> compOptionsList = [];
  void addToCompOptionsList(CodedValueStruct item) => compOptionsList.add(item);
  void removeFromCompOptionsList(CodedValueStruct item) =>
      compOptionsList.remove(item);
  void removeAtIndexFromCompOptionsList(int index) =>
      compOptionsList.removeAt(index);
  void insertAtIndexInCompOptionsList(int index, CodedValueStruct item) =>
      compOptionsList.insert(index, item);
  void updateCompOptionsListAtIndex(
          int index, Function(CodedValueStruct) updateFn) =>
      compOptionsList[index] = updateFn(compOptionsList[index]);

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Stores action output result for [Backend Call - API (Get UCUM Units)] action in Search widget.
  ApiCallResponse? listResultsCopy;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    loadingModel.dispose();
  }
}
