import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'livetrackinglinks_model.dart';
export 'livetrackinglinks_model.dart';

class LivetrackinglinksWidget extends StatefulWidget {
  const LivetrackinglinksWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<LivetrackinglinksWidget> createState() =>
      _LivetrackinglinksWidgetState();
}

class _LivetrackinglinksWidgetState extends State<LivetrackinglinksWidget> {
  late LivetrackinglinksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LivetrackinglinksModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().itemsPrice = 0.0;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
        child: Container(
          height: 600.0,
          constraints: BoxConstraints(
            maxWidth: isWeb
                ? () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return FFAppState().width.small.toDouble();
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return FFAppState().width.medium.toDouble();
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return FFAppState().width.large.toDouble();
                    } else {
                      return FFAppState().width.small.toDouble();
                    }
                  }()
                : FFAppState().width.small.toDouble(),
            maxHeight: 600.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 25.0,
                color: Color(0x19000000),
                offset: Offset(
                  0.0,
                  4.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 59.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent2,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                FlutterFlowWebView(
                  content: widget!.url!,
                  bypass: false,
                  height: 536.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
