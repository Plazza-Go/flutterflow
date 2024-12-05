// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HighlightStruct extends FFFirebaseStruct {
  HighlightStruct({
    DescriptionStruct? description,
    NameStruct? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _name = name,
        super(firestoreUtilData);

  // "description" field.
  DescriptionStruct? _description;
  DescriptionStruct get description => _description ?? DescriptionStruct();
  set description(DescriptionStruct? val) => _description = val;

  void updateDescription(Function(DescriptionStruct) updateFn) {
    updateFn(_description ??= DescriptionStruct());
  }

  bool hasDescription() => _description != null;

  // "name" field.
  NameStruct? _name;
  NameStruct get name => _name ?? NameStruct();
  set name(NameStruct? val) => _name = val;

  void updateName(Function(NameStruct) updateFn) {
    updateFn(_name ??= NameStruct());
  }

  bool hasName() => _name != null;

  static HighlightStruct fromMap(Map<String, dynamic> data) => HighlightStruct(
        description: DescriptionStruct.maybeFromMap(data['description']),
        name: NameStruct.maybeFromMap(data['name']),
      );

  static HighlightStruct? maybeFromMap(dynamic data) => data is Map
      ? HighlightStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'description': _description?.toMap(),
        'name': _name?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'description': serializeParam(
          _description,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static HighlightStruct fromSerializableMap(Map<String, dynamic> data) =>
      HighlightStruct(
        description: deserializeStructParam(
          data['description'],
          ParamType.DataStruct,
          false,
          structBuilder: DescriptionStruct.fromSerializableMap,
        ),
        name: deserializeStructParam(
          data['name'],
          ParamType.DataStruct,
          false,
          structBuilder: NameStruct.fromSerializableMap,
        ),
      );

  static HighlightStruct fromAlgoliaData(Map<String, dynamic> data) =>
      HighlightStruct(
        description: convertAlgoliaParam(
          data['description'],
          ParamType.DataStruct,
          false,
          structBuilder: DescriptionStruct.fromAlgoliaData,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.DataStruct,
          false,
          structBuilder: NameStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'HighlightStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HighlightStruct &&
        description == other.description &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([description, name]);
}

HighlightStruct createHighlightStruct({
  DescriptionStruct? description,
  NameStruct? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HighlightStruct(
      description:
          description ?? (clearUnsetFields ? DescriptionStruct() : null),
      name: name ?? (clearUnsetFields ? NameStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HighlightStruct? updateHighlightStruct(
  HighlightStruct? highlight, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    highlight
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHighlightStructData(
  Map<String, dynamic> firestoreData,
  HighlightStruct? highlight,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (highlight == null) {
    return;
  }
  if (highlight.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && highlight.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final highlightData = getHighlightFirestoreData(highlight, forFieldValue);
  final nestedData = highlightData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = highlight.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHighlightFirestoreData(
  HighlightStruct? highlight, [
  bool forFieldValue = false,
]) {
  if (highlight == null) {
    return {};
  }
  final firestoreData = mapToFirestore(highlight.toMap());

  // Handle nested data for "description" field.
  addDescriptionStructData(
    firestoreData,
    highlight.hasDescription() ? highlight.description : null,
    'description',
    forFieldValue,
  );

  // Handle nested data for "name" field.
  addNameStructData(
    firestoreData,
    highlight.hasName() ? highlight.name : null,
    'name',
    forFieldValue,
  );

  // Add any Firestore field values
  highlight.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHighlightListFirestoreData(
  List<HighlightStruct>? highlights,
) =>
    highlights?.map((e) => getHighlightFirestoreData(e, true)).toList() ?? [];
