// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NavbarStruct extends FFFirebaseStruct {
  NavbarStruct({
    bool? home,
    bool? order,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _home = home,
        _order = order,
        super(firestoreUtilData);

  // "home" field.
  bool? _home;
  bool get home => _home ?? false;
  set home(bool? val) => _home = val;

  bool hasHome() => _home != null;

  // "order" field.
  bool? _order;
  bool get order => _order ?? false;
  set order(bool? val) => _order = val;

  bool hasOrder() => _order != null;

  static NavbarStruct fromMap(Map<String, dynamic> data) => NavbarStruct(
        home: data['home'] as bool?,
        order: data['order'] as bool?,
      );

  static NavbarStruct? maybeFromMap(dynamic data) =>
      data is Map ? NavbarStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'home': _home,
        'order': _order,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'home': serializeParam(
          _home,
          ParamType.bool,
        ),
        'order': serializeParam(
          _order,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NavbarStruct fromSerializableMap(Map<String, dynamic> data) =>
      NavbarStruct(
        home: deserializeParam(
          data['home'],
          ParamType.bool,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.bool,
          false,
        ),
      );

  static NavbarStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NavbarStruct(
        home: convertAlgoliaParam(
          data['home'],
          ParamType.bool,
          false,
        ),
        order: convertAlgoliaParam(
          data['order'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NavbarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NavbarStruct && home == other.home && order == other.order;
  }

  @override
  int get hashCode => const ListEquality().hash([home, order]);
}

NavbarStruct createNavbarStruct({
  bool? home,
  bool? order,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NavbarStruct(
      home: home,
      order: order,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NavbarStruct? updateNavbarStruct(
  NavbarStruct? navbar, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    navbar
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNavbarStructData(
  Map<String, dynamic> firestoreData,
  NavbarStruct? navbar,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (navbar == null) {
    return;
  }
  if (navbar.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && navbar.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final navbarData = getNavbarFirestoreData(navbar, forFieldValue);
  final nestedData = navbarData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = navbar.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNavbarFirestoreData(
  NavbarStruct? navbar, [
  bool forFieldValue = false,
]) {
  if (navbar == null) {
    return {};
  }
  final firestoreData = mapToFirestore(navbar.toMap());

  // Add any Firestore field values
  navbar.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNavbarListFirestoreData(
  List<NavbarStruct>? navbars,
) =>
    navbars?.map((e) => getNavbarFirestoreData(e, true)).toList() ?? [];
