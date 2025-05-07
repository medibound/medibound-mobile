import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coded_value_dropdown_model.dart';
export 'coded_value_dropdown_model.dart';

class CodedValueDropdownWidget extends StatefulWidget {
  const CodedValueDropdownWidget({
    super.key,
    this.optionsList,
    this.initialOption,
    bool? disabled,
  }) : this.disabled = disabled ?? false;

  final List<CodedValueStruct>? optionsList;
  final CodedValueStruct? initialOption;
  final bool disabled;

  @override
  State<CodedValueDropdownWidget> createState() =>
      _CodedValueDropdownWidgetState();
}

class _CodedValueDropdownWidgetState extends State<CodedValueDropdownWidget> {
  late CodedValueDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodedValueDropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return custom_widgets.Dropdown(
      width: 300.0,
      height: 100.0,
      hintText: 'testing..',
      items: widget!.optionsList!,
      initialItem: widget!.initialOption,
      onChanged: (item) async {
        _model.item = item;
        _model.updatePage(() {});
      },
    );
  }
}
