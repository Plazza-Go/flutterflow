import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medicineinformationshimmer_model.dart';
export 'medicineinformationshimmer_model.dart';

class MedicineinformationshimmerWidget extends StatefulWidget {
  const MedicineinformationshimmerWidget({super.key});

  @override
  State<MedicineinformationshimmerWidget> createState() =>
      _MedicineinformationshimmerWidgetState();
}

class _MedicineinformationshimmerWidgetState
    extends State<MedicineinformationshimmerWidget>
    with TickerProviderStateMixin {
  late MedicineinformationshimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicineinformationshimmerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0xFFC3C1C1),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0xFFC3C1C1),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0xFFC3C1C1),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0xFFC3C1C1),
            angle: 0.524,
          ),
        ],
      ),
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
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
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
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDF1F3),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xFFEDF1F3),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDF1F3),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation3']!),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDF1F3),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation4']!),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 25.0)),
          ),
        ),
      ),
    );
  }
}
