import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shimmer_history_model.dart';
export 'shimmer_history_model.dart';

class ShimmerHistoryWidget extends StatefulWidget {
  const ShimmerHistoryWidget({super.key});

  @override
  State<ShimmerHistoryWidget> createState() => _ShimmerHistoryWidgetState();
}

class _ShimmerHistoryWidgetState extends State<ShimmerHistoryWidget>
    with TickerProviderStateMixin {
  late ShimmerHistoryModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerHistoryModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80D1D1D1),
            angle: 0.785,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80D1D1D1),
            angle: 0.785,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80D1D1D1),
            angle: 0.785,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80D1D1D1),
            angle: 0.785,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80D1D1D1),
            angle: 0.785,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80D1D1D1),
            angle: 0.785,
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

    return Container(
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
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFEDEEEF),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation1']!),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFEDEEEF),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation2']!),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFEDEEEF),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation3']!),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFEDEEEF),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation4']!),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFEDEEEF),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation5']!),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFEDEEEF),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation6']!),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
