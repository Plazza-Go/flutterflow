import '/flutter_flow/flutter_flow_util.dart';
import 'upload_prescriptions_widget.dart' show UploadPrescriptionsWidget;
import 'package:flutter/material.dart';

class UploadPrescriptionsModel
    extends FlutterFlowModel<UploadPrescriptionsWidget> {
  ///  Local state fields for this component.

  bool hide = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
