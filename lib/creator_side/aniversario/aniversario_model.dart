import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aniversario_widget.dart' show AniversarioWidget;
import 'package:flutter/material.dart';

class AniversarioModel extends FlutterFlowModel<AniversarioWidget> {
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
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nombreFFocusNode?.dispose();
    nombreFTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
