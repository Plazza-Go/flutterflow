import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicineDatabaseRecord extends FirestoreRecord {
  MedicineDatabaseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicine_database');

  static Stream<MedicineDatabaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicineDatabaseRecord.fromSnapshot(s));

  static Future<MedicineDatabaseRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MedicineDatabaseRecord.fromSnapshot(s));

  static MedicineDatabaseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicineDatabaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicineDatabaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicineDatabaseRecord._(reference, mapFromFirestore(data));

  static MedicineDatabaseRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      MedicineDatabaseRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
        },
        MedicineDatabaseRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MedicineDatabaseRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'medicine_database',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'MedicineDatabaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicineDatabaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicineDatabaseRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicineDatabaseRecordDocumentEquality
    implements Equality<MedicineDatabaseRecord> {
  const MedicineDatabaseRecordDocumentEquality();

  @override
  bool equals(MedicineDatabaseRecord? e1, MedicineDatabaseRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(MedicineDatabaseRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is MedicineDatabaseRecord;
}
