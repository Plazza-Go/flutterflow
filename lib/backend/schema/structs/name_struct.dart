// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NameStruct extends FFFirebaseStruct {
  NameStruct({
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

  static NameStruct fromMap(Map<String, dynamic> data) => NameStruct(
        matchedTokens: getDataList(data['matched_tokens']),
        snippet: data['snippet'] as String?,
      );

  static NameStruct? maybeFromMap(dynamic data) =>
      data is Map ? NameStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static NameStruct fromSerializableMap(Map<String, dynamic> data) =>
      NameStruct(
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

  static NameStruct fromAlgoliaData(Map<String, dynamic> data) => NameStruct(
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
  String toString() => 'NameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NameStruct &&
        listEquality.equals(matchedTokens, other.matchedTokens) &&
        snippet == other.snippet;
  }

  @override
  int get hashCode => const ListEquality().hash([matchedTokens, snippet]);
}

NameStruct createNameStruct({
  String? snippet,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NameStruct(
      snippet: snippet,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NameStruct? updateNameStruct(
  NameStruct? name, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    name
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNameStructData(
  Map<String, dynamic> firestoreData,
  NameStruct? name,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (name == null) {
    return;
  }
  if (name.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && name.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nameData = getNameFirestoreData(name, forFieldValue);
  final nestedData = nameData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = name.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNameFirestoreData(
  NameStruct? name, [
  bool forFieldValue = false,
]) {
  if (name == null) {
    return {};
  }
  final firestoreData = mapToFirestore(name.toMap());

  // Add any Firestore field values
  name.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNameListFirestoreData(
  List<NameStruct>? names,
) =>
    names?.map((e) => getNameFirestoreData(e, true)).toList() ?? [];
