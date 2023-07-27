import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsultantRecord extends FirestoreRecord {
  ConsultantRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "consultantID" field.
  int? _consultantID;
  int get consultantID => _consultantID ?? 0;
  bool hasConsultantID() => _consultantID != null;

  // "AgencyCode" field.
  String? _agencyCode;
  String get agencyCode => _agencyCode ?? '';
  bool hasAgencyCode() => _agencyCode != null;

  // "Agency" field.
  String? _agency;
  String get agency => _agency ?? '';
  bool hasAgency() => _agency != null;

  // "userID" field.
  int? _userID;
  int get userID => _userID ?? 0;
  bool hasUserID() => _userID != null;

  // "customerID" field.
  int? _customerID;
  int get customerID => _customerID ?? 0;
  bool hasCustomerID() => _customerID != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "is_consultant" field.
  bool? _isConsultant;
  bool get isConsultant => _isConsultant ?? false;
  bool hasIsConsultant() => _isConsultant != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _consultantID = castToType<int>(snapshotData['consultantID']);
    _agencyCode = snapshotData['AgencyCode'] as String?;
    _agency = snapshotData['Agency'] as String?;
    _userID = castToType<int>(snapshotData['userID']);
    _customerID = castToType<int>(snapshotData['customerID']);
    _name = snapshotData['Name'] as String?;
    _isConsultant = snapshotData['is_consultant'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _image = snapshotData['image'] as String?;
    _email = snapshotData['Email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('consultant');

  static Stream<ConsultantRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConsultantRecord.fromSnapshot(s));

  static Future<ConsultantRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConsultantRecord.fromSnapshot(s));

  static ConsultantRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConsultantRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConsultantRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConsultantRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConsultantRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConsultantRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConsultantRecordData({
  int? consultantID,
  String? agencyCode,
  String? agency,
  int? userID,
  int? customerID,
  String? name,
  bool? isConsultant,
  String? phoneNumber,
  String? image,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'consultantID': consultantID,
      'AgencyCode': agencyCode,
      'Agency': agency,
      'userID': userID,
      'customerID': customerID,
      'Name': name,
      'is_consultant': isConsultant,
      'phone_number': phoneNumber,
      'image': image,
      'Email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConsultantRecordDocumentEquality implements Equality<ConsultantRecord> {
  const ConsultantRecordDocumentEquality();

  @override
  bool equals(ConsultantRecord? e1, ConsultantRecord? e2) {
    return e1?.consultantID == e2?.consultantID &&
        e1?.agencyCode == e2?.agencyCode &&
        e1?.agency == e2?.agency &&
        e1?.userID == e2?.userID &&
        e1?.customerID == e2?.customerID &&
        e1?.name == e2?.name &&
        e1?.isConsultant == e2?.isConsultant &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.image == e2?.image &&
        e1?.email == e2?.email;
  }

  @override
  int hash(ConsultantRecord? e) => const ListEquality().hash([
        e?.consultantID,
        e?.agencyCode,
        e?.agency,
        e?.userID,
        e?.customerID,
        e?.name,
        e?.isConsultant,
        e?.phoneNumber,
        e?.image,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is ConsultantRecord;
}
