// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HighlightsStruct extends FFFirebaseStruct {
  HighlightsStruct({
    String? field,
    List<String>? matchedTokens,
    String? snippet,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _field = field,
        _matchedTokens = matchedTokens,
        _snippet = snippet,
        super(firestoreUtilData);

  // "field" field.
  String? _field;
  String get field => _field ?? '';
  set field(String? val) => _field = val;

  bool hasField() => _field != null;

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

  static HighlightsStruct fromMap(Map<String, dynamic> data) =>
      HighlightsStruct(
        field: data['field'] as String?,
        matchedTokens: getDataList(data['matched_tokens']),
        snippet: data['snippet'] as String?,
      );

  static HighlightsStruct? maybeFromMap(dynamic data) => data is Map
      ? HighlightsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'field': _field,
        'matched_tokens': _matchedTokens,
        'snippet': _snippet,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'field': serializeParam(
          _field,
          ParamType.String,
        ),
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

  static HighlightsStruct fromSerializableMap(Map<String, dynamic> data) =>
      HighlightsStruct(
        field: deserializeParam(
          data['field'],
          ParamType.String,
          false,
        ),
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

  static HighlightsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      HighlightsStruct(
        field: convertAlgoliaParam(
          data['field'],
          ParamType.String,
          false,
        ),
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
  String toString() => 'HighlightsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HighlightsStruct &&
        field == other.field &&
        listEquality.equals(matchedTokens, other.matchedTokens) &&
        snippet == other.snippet;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([field, matchedTokens, snippet]);
}

HighlightsStruct createHighlightsStruct({
  String? field,
  String? snippet,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HighlightsStruct(
      field: field,
      snippet: snippet,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HighlightsStruct? updateHighlightsStruct(
  HighlightsStruct? highlights, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    highlights
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHighlightsStructData(
  Map<String, dynamic> firestoreData,
  HighlightsStruct? highlights,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (highlights == null) {
    return;
  }
  if (highlights.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && highlights.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final highlightsData = getHighlightsFirestoreData(highlights, forFieldValue);
  final nestedData = highlightsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = highlights.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHighlightsFirestoreData(
  HighlightsStruct? highlights, [
  bool forFieldValue = false,
]) {
  if (highlights == null) {
    return {};
  }
  final firestoreData = mapToFirestore(highlights.toMap());

  // Add any Firestore field values
  highlights.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHighlightsListFirestoreData(
  List<HighlightsStruct>? highlightss,
) =>
    highlightss?.map((e) => getHighlightsFirestoreData(e, true)).toList() ?? [];
