import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shimmer_address_model.dart';
export 'shimmer_address_model.dart';

class ShimmerAddressWidget extends StatefulWidget {
  const ShimmerAddressWidget({super.key});

  @override
  State<ShimmerAddressWidget> createState() => _ShimmerAddressWidgetState();
}

class _ShimmerAddressWidgetState extends State<ShimmerAddressWidget>
    with TickerProviderStateMixin {
  late ShimmerAddressModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerAddressModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Color(0xFFEDEEEF),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
