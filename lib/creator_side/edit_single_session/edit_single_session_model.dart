import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_single_session_widget.dart' show EditSingleSessionWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditSingleSessionModel extends FlutterFlowModel<EditSingleSessionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for NombreF widget.
  FocusNode? nombreFFocusNode;
  TextEditingController? nombreFTextController;
  String? Function(BuildContext, String?)? nombreFTextControllerValidator;
  // State field(s) for Descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nombreFFocusNode?.dispose();
    nombreFTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
