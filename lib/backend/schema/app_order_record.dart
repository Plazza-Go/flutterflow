import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppOrderRecord extends FirestoreRecord {
  AppOrderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ticket_id" field.
  int? _ticketId;
  int get ticketId => _ticketId ?? 0;
  bool hasTicketId() => _ticketId != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "item_total_amount" field.
  double? _itemTotalAmount;
  double get itemTotalAmount => _itemTotalAmount ?? 0.0;
  bool hasItemTotalAmount() => _itemTotalAmount != null;

  // "bill_total_amount" field.
  double? _billTotalAmount;
  double get billTotalAmount => _billTotalAmount ?? 0.0;
  bool hasBillTotalAmount() => _billTotalAmount != null;

  // "Rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "Address_tag" field.
  String? _addressTag;
  String get addressTag => _addressTag ?? '';
  bool hasAddressTag() => _addressTag != null;

  // "contact_id" field.
  String? _contactId;
  String get contactId => _contactId ?? '';
  bool hasContactId() => _contactId != null;

  // "delivery_agent_tracking_url" field.
  String? _deliveryAgentTrackingUrl;
  String get deliveryAgentTrackingUrl => _deliveryAgentTrackingUrl ?? '';
  bool hasDeliveryAgentTrackingUrl() => _deliveryAgentTrackingUrl != null;

  // "delivery_agent_phonenumber" field.
  String? _deliveryAgentPhonenumber;
  String get deliveryAgentPhonenumber => _deliveryAgentPhonenumber ?? '';
  bool hasDeliveryAgentPhonenumber() => _deliveryAgentPhonenumber != null;

  // "delivery_agent_name" field.
  String? _deliveryAgentName;
  String get deliveryAgentName => _deliveryAgentName ?? '';
  bool hasDeliveryAgentName() => _deliveryAgentName != null;

  // "order_source" field.
  String? _orderSource;
  String get orderSource => _orderSource ?? '';
  bool hasOrderSource() => _orderSource != null;

  // "packaging_charges" field.
  double? _packagingCharges;
  double get packagingCharges => _packagingCharges ?? 0.0;
  bool hasPackagingCharges() => _packagingCharges != null;

  // "convenience_fee" field.
  double? _convenienceFee;
  double get convenienceFee => _convenienceFee ?? 0.0;
  bool hasConvenienceFee() => _convenienceFee != null;

  // "delivery_charges" field.
  double? _deliveryCharges;
  double get deliveryCharges => _deliveryCharges ?? 0.0;
  bool hasDeliveryCharges() => _deliveryCharges != null;

  // "platform_fee" field.
  double? _platformFee;
  double get platformFee => _platformFee ?? 0.0;
  bool hasPlatformFee() => _platformFee != null;

  void _initializeFields() {
    _ticketId = castToType<int>(snapshotData['ticket_id']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _itemTotalAmount = castToType<double>(snapshotData['item_total_amount']);
    _billTotalAmount = castToType<double>(snapshotData['bill_total_amount']);
    _rating = castToType<int>(snapshotData['Rating']);
    _address = snapshotData['Address'] as String?;
    _addressTag = snapshotData['Address_tag'] as String?;
    _contactId = snapshotData['contact_id'] as String?;
    _deliveryAgentTrackingUrl =
        snapshotData['delivery_agent_tracking_url'] as String?;
    _deliveryAgentPhonenumber =
        snapshotData['delivery_agent_phonenumber'] as String?;
    _deliveryAgentName = snapshotData['delivery_agent_name'] as String?;
    _orderSource = snapshotData['order_source'] as String?;
    _packagingCharges = castToType<double>(snapshotData['packaging_charges']);
    _convenienceFee = castToType<double>(snapshotData['convenience_fee']);
    _deliveryCharges = castToType<double>(snapshotData['delivery_charges']);
    _platformFee = castToType<double>(snapshotData['platform_fee']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_order');

  static Stream<AppOrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppOrderRecord.fromSnapshot(s));

  static Future<AppOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppOrderRecord.fromSnapshot(s));

  static AppOrderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppOrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppOrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppOrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppOrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppOrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppOrderRecordData({
  int? ticketId,
  DateTime? createdTime,
  String? status,
  double? itemTotalAmount,
  double? billTotalAmount,
  int? rating,
  String? address,
  String? addressTag,
  String? contactId,
  String? deliveryAgentTrackingUrl,
  String? deliveryAgentPhonenumber,
  String? deliveryAgentName,
  String? orderSource,
  double? packagingCharges,
  double? convenienceFee,
  double? deliveryCharges,
  double? platformFee,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticket_id': ticketId,
      'created_time': createdTime,
      'status': status,
      'item_total_amount': itemTotalAmount,
      'bill_total_amount': billTotalAmount,
      'Rating': rating,
      'Address': address,
      'Address_tag': addressTag,
      'contact_id': contactId,
      'delivery_agent_tracking_url': deliveryAgentTrackingUrl,
      'delivery_agent_phonenumber': deliveryAgentPhonenumber,
      'delivery_agent_name': deliveryAgentName,
      'order_source': orderSource,
      'packaging_charges': packagingCharges,
      'convenience_fee': convenienceFee,
      'delivery_charges': deliveryCharges,
      'platform_fee': platformFee,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppOrderRecordDocumentEquality implements Equality<AppOrderRecord> {
  const AppOrderRecordDocumentEquality();

  @override
  bool equals(AppOrderRecord? e1, AppOrderRecord? e2) {
    return e1?.ticketId == e2?.ticketId &&
        e1?.createdTime == e2?.createdTime &&
        e1?.status == e2?.status &&
        e1?.itemTotalAmount == e2?.itemTotalAmount &&
        e1?.billTotalAmount == e2?.billTotalAmount &&
        e1?.rating == e2?.rating &&
        e1?.address == e2?.address &&
        e1?.addressTag == e2?.addressTag &&
        e1?.contactId == e2?.contactId &&
        e1?.deliveryAgentTrackingUrl == e2?.deliveryAgentTrackingUrl &&
        e1?.deliveryAgentPhonenumber == e2?.deliveryAgentPhonenumber &&
        e1?.deliveryAgentName == e2?.deliveryAgentName &&
        e1?.orderSource == e2?.orderSource &&
        e1?.packagingCharges == e2?.packagingCharges &&
        e1?.convenienceFee == e2?.convenienceFee &&
        e1?.deliveryCharges == e2?.deliveryCharges &&
        e1?.platformFee == e2?.platformFee;
  }

  @override
  int hash(AppOrderRecord? e) => const ListEquality().hash([
        e?.ticketId,
        e?.createdTime,
        e?.status,
        e?.itemTotalAmount,
        e?.billTotalAmount,
        e?.rating,
        e?.address,
        e?.addressTag,
        e?.contactId,
        e?.deliveryAgentTrackingUrl,
        e?.deliveryAgentPhonenumber,
        e?.deliveryAgentName,
        e?.orderSource,
        e?.packagingCharges,
        e?.convenienceFee,
        e?.deliveryCharges,
        e?.platformFee
      ]);

  @override
  bool isValidKey(Object? o) => o is AppOrderRecord;
}
