import '/flutter_flow/flutter_flow_util.dart';
import 'calendar_sync_widget.dart' show CalendarSyncWidget;
import 'package:flutter/material.dart';

class CalendarSyncModel extends FlutterFlowModel<CalendarSyncWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
