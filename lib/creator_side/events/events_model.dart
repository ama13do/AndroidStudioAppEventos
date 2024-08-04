import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'events_widget.dart' show EventsWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class EventsModel extends FlutterFlowModel<EventsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 100000000;
  int timerMilliseconds = 100000000;
  String timerValue = StopWatchTimer.getDisplayTime(100000000);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
  }
}
