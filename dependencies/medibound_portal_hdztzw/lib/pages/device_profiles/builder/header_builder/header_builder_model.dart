import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/components/component/component_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'header_builder_widget.dart' show HeaderBuilderWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderBuilderModel extends FlutterFlowModel<HeaderBuilderWidget> {
  ///  Local state fields for this component.

  List<BlockComponentStruct> header = [];
  void addToHeader(BlockComponentStruct item) => header.add(item);
  void removeFromHeader(BlockComponentStruct item) => header.remove(item);
  void removeAtIndexFromHeader(int index) => header.removeAt(index);
  void insertAtIndexInHeader(int index, BlockComponentStruct item) =>
      header.insert(index, item);
  void updateHeaderAtIndex(
          int index, Function(BlockComponentStruct) updateFn) =>
      header[index] = updateFn(header[index]);

  bool onHover = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
