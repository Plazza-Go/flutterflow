import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderNotificationsRecord extends FirestoreRecord {
  OrderNotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "contact_recordId" field.
  String? _contactRecordId;
  String get contactRecordId => _contactRecordId ?? '';
  bool hasContactRecordId() => _contactRecordId != null;

  // "registered_phone_number" field.
  String? _registeredPhoneNumber;
  String get registeredPhoneNumber => _registeredPhoneNumber ?? '';
  bool hasRegisteredPhoneNumber() => _registeredPhoneNumber != null;

  // "Order_notification_description" field.
  String? _orderNotificationDescription;
  String get orderNotificationDescription =>
      _orderNotificationDescription ?? '';
  bool hasOrderNotificationDescription() =>
      _orderNotificationDescription != null;

  // "Order_notification_image" field.
  String? _orderNotificationImage;
  String get orderNotificationImage => _orderNotificationImage ?? '';
  bool hasOrderNotificationImage() => _orderNotificationImage != null;

  // "Order_notification_title" field.
  String? _orderNotificationTitle;
  String get orderNotificationTitle => _orderNotificationTitle ?? '';
  bool hasOrderNotificationTitle() => _orderNotificationTitle != null;

  // "user_firebase" field.
  DocumentReference? _userFirebase;
  DocumentReference? get userFirebase => _userFirebase;
  bool hasUserFirebase() => _userFirebase != null;

  // "display" field.
  String? _display;
  String get display => _display ?? '';
  bool hasDisplay() => _display != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "ticketID" field.
  int? _ticketID;
  int get ticketID => _ticketID ?? 0;
  bool hasTicketID() => _ticketID != null;

  void _initializeFields() {
    _contactRecordId = snapshotData['contact_recordId'] as String?;
    _registeredPhoneNumber = snapshotData['registered_phone_number'] as String?;
    _orderNotificationDescription =
        snapshotData['Order_notification_description'] as String?;
    _orderNotificationImage =
        snapshotData['Order_notification_image'] as String?;
    _orderNotificationTitle =
        snapshotData['Order_notification_title'] as String?;
    _userFirebase = snapshotData['user_firebase'] as DocumentReference?;
    _display = snapshotData['display'] as String?;
    _status = snapshotData['status'] as String?;
    _ticketID = castToType<int>(snapshotData['ticketID']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_notifications');

  static Stream<OrderNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderNotificationsRecord.fromSnapshot(s));

  static Future<OrderNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OrderNotificationsRecord.fromSnapshot(s));

  static OrderNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderNotificationsRecordData({
  String? contactRecordId,
  String? registeredPhoneNumber,
  String? orderNotificationDescription,
  String? orderNotificationImage,
  String? orderNotificationTitle,
  DocumentReference? userFirebase,
  String? display,
  String? status,
  int? ticketID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'contact_recordId': contactRecordId,
      'registered_phone_number': registeredPhoneNumber,
      'Order_notification_description': orderNotificationDescription,
      'Order_notification_image': orderNotificationImage,
      'Order_notification_title': orderNotificationTitle,
      'user_firebase': userFirebase,
      'display': display,
      'status': status,
      'ticketID': ticketID,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderNotificationsRecordDocumentEquality
    implements Equality<OrderNotificationsRecord> {
  const OrderNotificationsRecordDocumentEquality();

  @override
  bool equals(OrderNotificationsRecord? e1, OrderNotificationsRecord? e2) {
    return e1?.contactRecordId == e2?.contactRecordId &&
        e1?.registeredPhoneNumber == e2?.registeredPhoneNumber &&
        e1?.orderNotificationDescription == e2?.orderNotificationDescription &&
        e1?.orderNotificationImage == e2?.orderNotificationImage &&
        e1?.orderNotificationTitle == e2?.orderNotificationTitle &&
        e1?.userFirebase == e2?.userFirebase &&
        e1?.display == e2?.display &&
        e1?.status == e2?.status &&
        e1?.ticketID == e2?.ticketID;
  }

  @override
  int hash(OrderNotificationsRecord? e) => const ListEquality().hash([
        e?.contactRecordId,
        e?.registeredPhoneNumber,
        e?.orderNotificationDescription,
        e?.orderNotificationImage,
        e?.orderNotificationTitle,
        e?.userFirebase,
        e?.display,
        e?.status,
        e?.ticketID
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderNotificationsRecord;
}
