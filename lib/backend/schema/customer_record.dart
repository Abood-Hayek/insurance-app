import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerRecord extends FirestoreRecord {
  CustomerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CustomerID" field.
  int? _customerID;
  int get customerID => _customerID ?? 0;
  bool hasCustomerID() => _customerID != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  bool hasPhone() => _phone != null;

  // "userID" field.
  int? _userID;
  int get userID => _userID ?? 0;
  bool hasUserID() => _userID != null;

  // "is_customer" field.
  bool? _isCustomer;
  bool get isCustomer => _isCustomer ?? false;
  bool hasIsCustomer() => _isCustomer != null;

  void _initializeFields() {
    _customerID = castToType<int>(snapshotData['CustomerID']);
    _name = snapshotData['Name'] as String?;
    _phone = castToType<int>(snapshotData['Phone']);
    _userID = castToType<int>(snapshotData['userID']);
    _isCustomer = snapshotData['is_customer'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer');

  static Stream<CustomerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerRecord.fromSnapshot(s));

  static Future<CustomerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerRecord.fromSnapshot(s));

  static CustomerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerRecordData({
  int? customerID,
  String? name,
  int? phone,
  int? userID,
  bool? isCustomer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CustomerID': customerID,
      'Name': name,
      'Phone': phone,
      'userID': userID,
      'is_customer': isCustomer,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerRecordDocumentEquality implements Equality<CustomerRecord> {
  const CustomerRecordDocumentEquality();

  @override
  bool equals(CustomerRecord? e1, CustomerRecord? e2) {
    return e1?.customerID == e2?.customerID &&
        e1?.name == e2?.name &&
        e1?.phone == e2?.phone &&
        e1?.userID == e2?.userID &&
        e1?.isCustomer == e2?.isCustomer;
  }

  @override
  int hash(CustomerRecord? e) => const ListEquality()
      .hash([e?.customerID, e?.name, e?.phone, e?.userID, e?.isCustomer]);

  @override
  bool isValidKey(Object? o) => o is CustomerRecord;
}
