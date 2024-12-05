// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchedSubstringsStruct extends FFFirebaseStruct {
  MatchedSubstringsStruct({
    int? length,
    int? offset,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _length = length,
        _offset = offset,
        super(firestoreUtilData);

  // "length" field.
  int? _length;
  int get length => _length ?? 0;
  set length(int? val) => _length = val;

  void incrementLength(int amount) => length = length + amount;

  bool hasLength() => _length != null;

  // "offset" field.
  int? _offset;
  int get offset => _offset ?? 0;
  set offset(int? val) => _offset = val;

  void incrementOffset(int amount) => offset = offset + amount;

  bool hasOffset() => _offset != null;

  static MatchedSubstringsStruct fromMap(Map<String, dynamic> data) =>
      MatchedSubstringsStruct(
        length: castToType<int>(data['length']),
        offset: castToType<int>(data['offset']),
      );

  static MatchedSubstringsStruct? maybeFromMap(dynamic data) => data is Map
      ? MatchedSubstringsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'length': _length,
        'offset': _offset,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'length': serializeParam(
          _length,
          ParamType.int,
        ),
        'offset': serializeParam(
          _offset,
          ParamType.int,
        ),
      }.withoutNulls;

  static MatchedSubstringsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MatchedSubstringsStruct(
        length: deserializeParam(
          data['length'],
          ParamType.int,
          false,
        ),
        offset: deserializeParam(
          data['offset'],
          ParamType.int,
          false,
        ),
      );

  static MatchedSubstringsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MatchedSubstringsStruct(
        length: convertAlgoliaParam(
          data['length'],
          ParamType.int,
          false,
        ),
        offset: convertAlgoliaParam(
          data['offset'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MatchedSubstringsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MatchedSubstringsStruct &&
        length == other.length &&
        offset == other.offset;
  }

  @override
  int get hashCode => const ListEquality().hash([length, offset]);
}

MatchedSubstringsStruct createMatchedSubstringsStruct({
  int? length,
  int? offset,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchedSubstringsStruct(
      length: length,
      offset: offset,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MatchedSubstringsStruct? updateMatchedSubstringsStruct(
  MatchedSubstringsStruct? matchedSubstrings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    matchedSubstrings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMatchedSubstringsStructData(
  Map<String, dynamic> firestoreData,
  MatchedSubstringsStruct? matchedSubstrings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (matchedSubstrings == null) {
    return;
  }
  if (matchedSubstrings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && matchedSubstrings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchedSubstringsData =
      getMatchedSubstringsFirestoreData(matchedSubstrings, forFieldValue);
  final nestedData =
      matchedSubstringsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = matchedSubstrings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMatchedSubstringsFirestoreData(
  MatchedSubstringsStruct? matchedSubstrings, [
  bool forFieldValue = false,
]) {
  if (matchedSubstrings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(matchedSubstrings.toMap());

  // Add any Firestore field values
  matchedSubstrings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchedSubstringsListFirestoreData(
  List<MatchedSubstringsStruct>? matchedSubstringss,
) =>
    matchedSubstringss
        ?.map((e) => getMatchedSubstringsFirestoreData(e, true))
        .toList() ??
    [];
