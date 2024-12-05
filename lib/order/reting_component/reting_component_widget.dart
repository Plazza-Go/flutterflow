import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reting_component_model.dart';
export 'reting_component_model.dart';

class RetingComponentWidget extends StatefulWidget {
  const RetingComponentWidget({
    super.key,
    this.ratings,
  });

  final int? ratings;

  @override
  State<RetingComponentWidget> createState() => _RetingComponentWidgetState();
}

class _RetingComponentWidgetState extends State<RetingComponentWidget> {
  late RetingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RetingComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget!.ratings! >= 1,
      child: RatingBarIndicator(
        itemBuilder: (context, index) => Icon(
          Icons.star_rounded,
          color: FlutterFlowTheme.of(context).primary,
        ),
        direction: Axis.horizontal,
        rating: widget!.ratings!.toDouble(),
        unratedColor: FlutterFlowTheme.of(context).accent1,
        itemCount: 5,
        itemSize: 25.0,
      ),
    );
  }
}
