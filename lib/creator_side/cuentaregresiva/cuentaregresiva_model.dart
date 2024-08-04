import '/flutter_flow/flutter_flow_util.dart';
import 'cuentaregresiva_widget.dart' show CuentaregresivaWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuentaregresivaModel extends FlutterFlowModel<CuentaregresivaWidget> {
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
  DateTime? datePicked;

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
