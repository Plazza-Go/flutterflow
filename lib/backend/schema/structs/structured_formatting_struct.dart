// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StructuredFormattingStruct extends FFFirebaseStruct {
  StructuredFormattingStruct({
    String? secondaryText,
    String? mainText,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _secondaryText = secondaryText,
        _mainText = mainText,
        super(firestoreUtilData);

  // "secondary_text" field.
  String? _secondaryText;
  String get secondaryText => _secondaryText ?? '';
  set secondaryText(String? val) => _secondaryText = val;

  bool hasSecondaryText() => _secondaryText != null;

  // "main_text" field.
  String? _mainText;
  String get mainText => _mainText ?? '';
  set mainText(String? val) => _mainText = val;

  bool hasMainText() => _mainText != null;

  static StructuredFormattingStruct fromMap(Map<String, dynamic> data) =>
      StructuredFormattingStruct(
        secondaryText: data['secondary_text'] as String?,
        mainText: data['main_text'] as String?,
      );

  static StructuredFormattingStruct? maybeFromMap(dynamic data) => data is Map
      ? StructuredFormattingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'secondary_text': _secondaryText,
        'main_text': _mainText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'secondary_text': serializeParam(
          _secondaryText,
          ParamType.String,
        ),
        'main_text': serializeParam(
          _mainText,
          ParamType.String,
        ),
      }.withoutNulls;

  static StructuredFormattingStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StructuredFormattingStruct(
        secondaryText: deserializeParam(
          data['secondary_text'],
          ParamType.String,
          false,
        ),
        mainText: deserializeParam(
          data['main_text'],
          ParamType.String,
          false,
        ),
      );

  static StructuredFormattingStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      StructuredFormattingStruct(
        secondaryText: convertAlgoliaParam(
          data['secondary_text'],
          ParamType.String,
          false,
        ),
        mainText: convertAlgoliaParam(
          data['main_text'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StructuredFormattingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StructuredFormattingStruct &&
        secondaryText == other.secondaryText &&
        mainText == other.mainText;
  }

  @override
  int get hashCode => const ListEquality().hash([secondaryText, mainText]);
}

StructuredFormattingStruct createStructuredFormattingStruct({
  String? secondaryText,
  String? mainText,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StructuredFormattingStruct(
      secondaryText: secondaryText,
      mainText: mainText,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StructuredFormattingStruct? updateStructuredFormattingStruct(
  StructuredFormattingStruct? structuredFormatting, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    structuredFormatting
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStructuredFormattingStructData(
  Map<String, dynamic> firestoreData,
  StructuredFormattingStruct? structuredFormatting,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (structuredFormatting == null) {
    return;
  }
  if (structuredFormatting.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && structuredFormatting.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final structuredFormattingData =
      getStructuredFormattingFirestoreData(structuredFormatting, forFieldValue);
  final nestedData =
      structuredFormattingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      structuredFormatting.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStructuredFormattingFirestoreData(
  StructuredFormattingStruct? structuredFormatting, [
  bool forFieldValue = false,
]) {
  if (structuredFormatting == null) {
    return {};
  }
  final firestoreData = mapToFirestore(structuredFormatting.toMap());

  // Add any Firestore field values
  structuredFormatting.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStructuredFormattingListFirestoreData(
  List<StructuredFormattingStruct>? structuredFormattings,
) =>
    structuredFormattings
        ?.map((e) => getStructuredFormattingFirestoreData(e, true))
        .toList() ??
    [];
