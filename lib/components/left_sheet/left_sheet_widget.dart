import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'left_sheet_model.dart';
export 'left_sheet_model.dart';

class LeftSheetWidget extends StatefulWidget {
  const LeftSheetWidget({super.key});

  @override
  State<LeftSheetWidget> createState() => _LeftSheetWidgetState();
}

class _LeftSheetWidgetState extends State<LeftSheetWidget> {
  late LeftSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeftSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 250.0,
        maxHeight: 350.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('create Event');
                },
                text: FFLocalizations.of(context).getText(
                  'roqsy5ke' /* Crear Evento */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF1DB954),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 29.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('events');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.link,
                            color: Colors.black,
                            size: 20.0,
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'dhr4ivhv' /* Eventos */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Nunito',
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60.0,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('scheduledEvents');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                          size: 24.0,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '1h6gj04f' /* Eventos Programados */,
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Nunito',
                              color: Colors.black,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
