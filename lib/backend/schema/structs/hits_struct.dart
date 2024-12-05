// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HitsStruct extends FFFirebaseStruct {
  HitsStruct({
    DocumentStruct? document,
    HighlightStruct? highlight,
    List<HighlightsStruct>? highlights,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _document = document,
        _highlight = highlight,
        _highlights = highlights,
        super(firestoreUtilData);

  // "document" field.
  DocumentStruct? _document;
  DocumentStruct get document => _document ?? DocumentStruct();
  set document(DocumentStruct? val) => _document = val;

  void updateDocument(Function(DocumentStruct) updateFn) {
    updateFn(_document ??= DocumentStruct());
  }

  bool hasDocument() => _document != null;

  // "highlight" field.
  HighlightStruct? _highlight;
  HighlightStruct get highlight => _highlight ?? HighlightStruct();
  set highlight(HighlightStruct? val) => _highlight = val;

  void updateHighlight(Function(HighlightStruct) updateFn) {
    updateFn(_highlight ??= HighlightStruct());
  }

  bool hasHighlight() => _highlight != null;

  // "highlights" field.
  List<HighlightsStruct>? _highlights;
  List<HighlightsStruct> get highlights => _highlights ?? const [];
  set highlights(List<HighlightsStruct>? val) => _highlights = val;

  void updateHighlights(Function(List<HighlightsStruct>) updateFn) {
    updateFn(_highlights ??= []);
  }

  bool hasHighlights() => _highlights != null;

  static HitsStruct fromMap(Map<String, dynamic> data) => HitsStruct(
        document: DocumentStruct.maybeFromMap(data['document']),
        highlight: HighlightStruct.maybeFromMap(data['highlight']),
        highlights: getStructList(
          data['highlights'],
          HighlightsStruct.fromMap,
        ),
      );

  static HitsStruct? maybeFromMap(dynamic data) =>
      data is Map ? HitsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'document': _document?.toMap(),
        'highlight': _highlight?.toMap(),
        'highlights': _highlights?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'document': serializeParam(
          _document,
          ParamType.DataStruct,
        ),
        'highlight': serializeParam(
          _highlight,
          ParamType.DataStruct,
        ),
        'highlights': serializeParam(
          _highlights,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static HitsStruct fromSerializableMap(Map<String, dynamic> data) =>
      HitsStruct(
        document: deserializeStructParam(
          data['document'],
          ParamType.DataStruct,
          false,
          structBuilder: DocumentStruct.fromSerializableMap,
        ),
        highlight: deserializeStructParam(
          data['highlight'],
          ParamType.DataStruct,
          false,
          structBuilder: HighlightStruct.fromSerializableMap,
        ),
        highlights: deserializeStructParam<HighlightsStruct>(
          data['highlights'],
          ParamType.DataStruct,
          true,
          structBuilder: HighlightsStruct.fromSerializableMap,
        ),
      );

  static HitsStruct fromAlgoliaData(Map<String, dynamic> data) => HitsStruct(
        document: convertAlgoliaParam(
          data['document'],
          ParamType.DataStruct,
          false,
          structBuilder: DocumentStruct.fromAlgoliaData,
        ),
        highlight: convertAlgoliaParam(
          data['highlight'],
          ParamType.DataStruct,
          false,
          structBuilder: HighlightStruct.fromAlgoliaData,
        ),
        highlights: convertAlgoliaParam<HighlightsStruct>(
          data['highlights'],
          ParamType.DataStruct,
          true,
          structBuilder: HighlightsStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'HitsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HitsStruct &&
        document == other.document &&
        highlight == other.highlight &&
        listEquality.equals(highlights, other.highlights);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([document, highlight, highlights]);
}

HitsStruct createHitsStruct({
  DocumentStruct? document,
  HighlightStruct? highlight,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HitsStruct(
      document: document ?? (clearUnsetFields ? DocumentStruct() : null),
      highlight: highlight ?? (clearUnsetFields ? HighlightStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HitsStruct? updateHitsStruct(
  HitsStruct? hits, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    hits
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHitsStructData(
  Map<String, dynamic> firestoreData,
  HitsStruct? hits,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (hits == null) {
    return;
  }
  if (hits.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && hits.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final hitsData = getHitsFirestoreData(hits, forFieldValue);
  final nestedData = hitsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = hits.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHitsFirestoreData(
  HitsStruct? hits, [
  bool forFieldValue = false,
]) {
  if (hits == null) {
    return {};
  }
  final firestoreData = mapToFirestore(hits.toMap());

  // Handle nested data for "document" field.
  addDocumentStructData(
    firestoreData,
    hits.hasDocument() ? hits.document : null,
    'document',
    forFieldValue,
  );

  // Handle nested data for "highlight" field.
  addHighlightStructData(
    firestoreData,
    hits.hasHighlight() ? hits.highlight : null,
    'highlight',
    forFieldValue,
  );

  // Add any Firestore field values
  hits.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHitsListFirestoreData(
  List<HitsStruct>? hitss,
) =>
    hitss?.map((e) => getHitsFirestoreData(e, true)).toList() ?? [];
