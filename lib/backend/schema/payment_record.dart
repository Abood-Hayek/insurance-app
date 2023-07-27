import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentRecord extends FirestoreRecord {
  PaymentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PaymentID" field.
  int? _paymentID;
  int get paymentID => _paymentID ?? 0;
  bool hasPaymentID() => _paymentID != null;

  // "Amount" field.
  String? _amount;
  String get amount => _amount ?? '';
  bool hasAmount() => _amount != null;

  // "PolicyID" field.
  int? _policyID;
  int get policyID => _policyID ?? 0;
  bool hasPolicyID() => _policyID != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _paymentID = castToType<int>(snapshotData['PaymentID']);
    _amount = snapshotData['Amount'] as String?;
    _policyID = castToType<int>(snapshotData['PolicyID']);
    _status = snapshotData['Status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Payment');

  static Stream<PaymentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentRecord.fromSnapshot(s));

  static Future<PaymentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentRecord.fromSnapshot(s));

  static PaymentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentRecordData({
  int? paymentID,
  String? amount,
  int? policyID,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PaymentID': paymentID,
      'Amount': amount,
      'PolicyID': policyID,
      'Status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentRecordDocumentEquality implements Equality<PaymentRecord> {
  const PaymentRecordDocumentEquality();

  @override
  bool equals(PaymentRecord? e1, PaymentRecord? e2) {
    return e1?.paymentID == e2?.paymentID &&
        e1?.amount == e2?.amount &&
        e1?.policyID == e2?.policyID &&
        e1?.status == e2?.status;
  }

  @override
  int hash(PaymentRecord? e) => const ListEquality()
      .hash([e?.paymentID, e?.amount, e?.policyID, e?.status]);

  @override
  bool isValidKey(Object? o) => o is PaymentRecord;
}
