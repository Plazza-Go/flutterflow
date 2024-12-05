import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_viewer_model.dart';
export 'image_viewer_model.dart';

class ImageViewerWidget extends StatefulWidget {
  const ImageViewerWidget({
    super.key,
    required this.imagePath,
  });

  final String? imagePath;

  @override
  State<ImageViewerWidget> createState() => _ImageViewerWidgetState();
}

class _ImageViewerWidgetState extends State<ImageViewerWidget> {
  late ImageViewerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageViewerModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 59.0,
                          height: 6.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent2,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_sharp,
                    color: FlutterFlowTheme.of(context).textColor,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Image View',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              valueOrDefault<String>(
                widget!.imagePath,
                'https://t3.ftcdn.net/jpg/04/60/01/36/240_F_460013622_6xF8uN6ubMvLx0tAJECBHfKPoNOR5cRa.jpg',
              ),
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 400.0,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/error_image.png',
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 400.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
