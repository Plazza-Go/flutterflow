import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppTransactionsRecord extends FirestoreRecord {
  AppTransactionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "amount" field.
  String? _amount;
  String get amount => _amount ?? '';
  bool hasAmount() => _amount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "payment_url" field.
  String? _paymentUrl;
  String get paymentUrl => _paymentUrl ?? '';
  bool hasPaymentUrl() => _paymentUrl != null;

  // "ticket_id" field.
  String? _ticketId;
  String get ticketId => _ticketId ?? '';
  bool hasTicketId() => _ticketId != null;

  // "transaction_notes" field.
  String? _transactionNotes;
  String get transactionNotes => _transactionNotes ?? '';
  bool hasTransactionNotes() => _transactionNotes != null;

  // "transaction_status" field.
  String? _transactionStatus;
  String get transactionStatus => _transactionStatus ?? '';
  bool hasTransactionStatus() => _transactionStatus != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_phone" field.
  String? _userPhone;
  String get userPhone => _userPhone ?? '';
  bool hasUserPhone() => _userPhone != null;

  // "app_transaction_id" field.
  String? _appTransactionId;
  String get appTransactionId => _appTransactionId ?? '';
  bool hasAppTransactionId() => _appTransactionId != null;

  // "razorpay_transaction_id" field.
  String? _razorpayTransactionId;
  String get razorpayTransactionId => _razorpayTransactionId ?? '';
  bool hasRazorpayTransactionId() => _razorpayTransactionId != null;

  void _initializeFields() {
    _amount = snapshotData['amount'] as String?;
    _currency = snapshotData['currency'] as String?;
    _paymentUrl = snapshotData['payment_url'] as String?;
    _ticketId = snapshotData['ticket_id'] as String?;
    _transactionNotes = snapshotData['transaction_notes'] as String?;
    _transactionStatus = snapshotData['transaction_status'] as String?;
    _userEmail = snapshotData['user_email'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _userPhone = snapshotData['user_phone'] as String?;
    _appTransactionId = snapshotData['app_transaction_id'] as String?;
    _razorpayTransactionId = snapshotData['razorpay_transaction_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_transactions');

  static Stream<AppTransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppTransactionsRecord.fromSnapshot(s));

  static Future<AppTransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppTransactionsRecord.fromSnapshot(s));

  static AppTransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppTransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppTransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppTransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppTransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppTransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppTransactionsRecordData({
  String? amount,
  String? currency,
  String? paymentUrl,
  String? ticketId,
  String? transactionNotes,
  String? transactionStatus,
  String? userEmail,
  String? userName,
  String? userPhone,
  String? appTransactionId,
  String? razorpayTransactionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'currency': currency,
      'payment_url': paymentUrl,
      'ticket_id': ticketId,
      'transaction_notes': transactionNotes,
      'transaction_status': transactionStatus,
      'user_email': userEmail,
      'user_name': userName,
      'user_phone': userPhone,
      'app_transaction_id': appTransactionId,
      'razorpay_transaction_id': razorpayTransactionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppTransactionsRecordDocumentEquality
    implements Equality<AppTransactionsRecord> {
  const AppTransactionsRecordDocumentEquality();

  @override
  bool equals(AppTransactionsRecord? e1, AppTransactionsRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.currency == e2?.currency &&
        e1?.paymentUrl == e2?.paymentUrl &&
        e1?.ticketId == e2?.ticketId &&
        e1?.transactionNotes == e2?.transactionNotes &&
        e1?.transactionStatus == e2?.transactionStatus &&
        e1?.userEmail == e2?.userEmail &&
        e1?.userName == e2?.userName &&
        e1?.userPhone == e2?.userPhone &&
        e1?.appTransactionId == e2?.appTransactionId &&
        e1?.razorpayTransactionId == e2?.razorpayTransactionId;
  }

  @override
  int hash(AppTransactionsRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.currency,
        e?.paymentUrl,
        e?.ticketId,
        e?.transactionNotes,
        e?.transactionStatus,
        e?.userEmail,
        e?.userName,
        e?.userPhone,
        e?.appTransactionId,
        e?.razorpayTransactionId
      ]);

  @override
  bool isValidKey(Object? o) => o is AppTransactionsRecord;
}
