import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_shimmer_model.dart';
export 'home_shimmer_model.dart';

class HomeShimmerWidget extends StatefulWidget {
  const HomeShimmerWidget({super.key});

  @override
  State<HomeShimmerWidget> createState() => _HomeShimmerWidgetState();
}

class _HomeShimmerWidgetState extends State<HomeShimmerWidget>
    with TickerProviderStateMixin {
  late HomeShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeShimmerModel());

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
      'containerOnPageLoadAnimation5': AnimationInfo(
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
      'containerOnPageLoadAnimation6': AnimationInfo(
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
      'containerOnPageLoadAnimation7': AnimationInfo(
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
      'containerOnPageLoadAnimation8': AnimationInfo(
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
      'containerOnPageLoadAnimation9': AnimationInfo(
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
      'containerOnPageLoadAnimation10': AnimationInfo(
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
      'containerOnPageLoadAnimation11': AnimationInfo(
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
      'containerOnPageLoadAnimation12': AnimationInfo(
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
      'containerOnPageLoadAnimation13': AnimationInfo(
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
      'containerOnPageLoadAnimation14': AnimationInfo(
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
      'containerOnPageLoadAnimation15': AnimationInfo(
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
      'containerOnPageLoadAnimation16': AnimationInfo(
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
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDF1F3),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDF1F3),
                        shape: BoxShape.circle,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF1F3),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(0.0),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation3']!),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.15,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF1F3),
                          borderRadius: BorderRadius.circular(8.0),
                          shape: BoxShape.rectangle,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation4']!),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.75,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF1F3),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation5']!),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF1F3),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation6']!),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.75,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF1F3),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation7']!),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEDF1F3),
                                shape: BoxShape.circle,
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation8']!),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEDF1F3),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation9']!),
                                Container(
                                  width: 80.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEDF1F3),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation10']!),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEDF1F3),
                                shape: BoxShape.circle,
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation11']!),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEDF1F3),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation12']!),
                                Container(
                                  width: 80.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEDF1F3),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation13']!),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0xFFEDF1F3),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation14']!),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF1F3),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation15']!),
                      Container(
                        width: 160.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF1F3),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation16']!),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 25.0)),
          ),
        ),
      ),
    );
  }
}
