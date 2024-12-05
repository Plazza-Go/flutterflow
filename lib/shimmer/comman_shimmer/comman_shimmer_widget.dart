import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comman_shimmer_model.dart';
export 'comman_shimmer_model.dart';

class CommanShimmerWidget extends StatefulWidget {
  const CommanShimmerWidget({
    super.key,
    required this.hieght,
    required this.width,
    required this.radiusTL,
    required this.radiusTR,
    required this.radiusBL,
    required this.radiusBR,
  });

  final int? hieght;
  final int? width;
  final int? radiusTL;
  final int? radiusTR;
  final int? radiusBL;
  final int? radiusBR;

  @override
  State<CommanShimmerWidget> createState() => _CommanShimmerWidgetState();
}

class _CommanShimmerWidgetState extends State<CommanShimmerWidget>
    with TickerProviderStateMixin {
  late CommanShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommanShimmerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    return Container(
      width: widget!.width?.toDouble(),
      height: widget!.hieght?.toDouble(),
      decoration: BoxDecoration(
        color: Color(0xFFEDF1F3),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(valueOrDefault<double>(
            widget!.radiusBL?.toDouble(),
            0.0,
          )),
          bottomRight: Radius.circular(valueOrDefault<double>(
            widget!.radiusBR?.toDouble(),
            0.0,
          )),
          topLeft: Radius.circular(valueOrDefault<double>(
            widget!.radiusTL?.toDouble(),
            0.0,
          )),
          topRight: Radius.circular(valueOrDefault<double>(
            widget!.radiusTR?.toDouble(),
            0.0,
          )),
        ),
        shape: BoxShape.rectangle,
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
