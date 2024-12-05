// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DescriptionStruct extends FFFirebaseStruct {
  DescriptionStruct({
    List<String>? matchedTokens,
    String? snippet,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _matchedTokens = matchedTokens,
        _snippet = snippet,
        super(firestoreUtilData);

  // "matched_tokens" field.
  List<String>? _matchedTokens;
  List<String> get matchedTokens => _matchedTokens ?? const [];
  set matchedTokens(List<String>? val) => _matchedTokens = val;

  void updateMatchedTokens(Function(List<String>) updateFn) {
    updateFn(_matchedTokens ??= []);
  }

  bool hasMatchedTokens() => _matchedTokens != null;

  // "snippet" field.
  String? _snippet;
  String get snippet => _snippet ?? '';
  set snippet(String? val) => _snippet = val;

  bool hasSnippet() => _snippet != null;

  static DescriptionStruct fromMap(Map<String, dynamic> data) =>
      DescriptionStruct(
        matchedTokens: getDataList(data['matched_tokens']),
        snippet: data['snippet'] as String?,
      );

  static DescriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? DescriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'matched_tokens': _matchedTokens,
        'snippet': _snippet,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'matched_tokens': serializeParam(
          _matchedTokens,
          ParamType.String,
          isList: true,
        ),
        'snippet': serializeParam(
          _snippet,
          ParamType.String,
        ),
      }.withoutNulls;

  static DescriptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      DescriptionStruct(
        matchedTokens: deserializeParam<String>(
          data['matched_tokens'],
          ParamType.String,
          true,
        ),
        snippet: deserializeParam(
          data['snippet'],
          ParamType.String,
          false,
        ),
      );

  static DescriptionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DescriptionStruct(
        matchedTokens: convertAlgoliaParam<String>(
          data['matched_tokens'],
          ParamType.String,
          true,
        ),
        snippet: convertAlgoliaParam(
          data['snippet'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DescriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DescriptionStruct &&
        listEquality.equals(matchedTokens, other.matchedTokens) &&
        snippet == other.snippet;
  }

  @override
  int get hashCode => const ListEquality().hash([matchedTokens, snippet]);
}

DescriptionStruct createDescriptionStruct({
  String? snippet,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DescriptionStruct(
      snippet: snippet,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DescriptionStruct? updateDescriptionStruct(
  DescriptionStruct? description, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    description
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDescriptionStructData(
  Map<String, dynamic> firestoreData,
  DescriptionStruct? description,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (description == null) {
    return;
  }
  if (description.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && description.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final descriptionData =
      getDescriptionFirestoreData(description, forFieldValue);
  final nestedData =
      descriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = description.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDescriptionFirestoreData(
  DescriptionStruct? description, [
  bool forFieldValue = false,
]) {
  if (description == null) {
    return {};
  }
  final firestoreData = mapToFirestore(description.toMap());

  // Add any Firestore field values
  description.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDescriptionListFirestoreData(
  List<DescriptionStruct>? descriptions,
) =>
    descriptions?.map((e) => getDescriptionFirestoreData(e, true)).toList() ??
    [];
