import '/backend/schema/structs/index.dart';

class CatchMeCorsCloudFunctionCallResponse {
  CatchMeCorsCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
