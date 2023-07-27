import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PolicyRecord extends FirestoreRecord {
  PolicyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PolicyType" field.
  String? _policyType;
  String get policyType => _policyType ?? '';
  bool hasPolicyType() => _policyType != null;

  // "policyDescription" field.
  String? _policyDescription;
  String get policyDescription => _policyDescription ?? '';
  bool hasPolicyDescription() => _policyDescription != null;

  // "policyID" field.
  int? _policyID;
  int get policyID => _policyID ?? 0;
  bool hasPolicyID() => _policyID != null;

  // "User_ID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "isStatus" field.
  bool? _isStatus;
  bool get isStatus => _isStatus ?? false;
  bool hasIsStatus() => _isStatus != null;

  // "pdfLink" field.
  String? _pdfLink;
  String get pdfLink => _pdfLink ?? '';
  bool hasPdfLink() => _pdfLink != null;

  void _initializeFields() {
    _policyType = snapshotData['PolicyType'] as String?;
    _policyDescription = snapshotData['policyDescription'] as String?;
    _policyID = castToType<int>(snapshotData['policyID']);
    _userID = snapshotData['User_ID'] as String?;
    _isStatus = snapshotData['isStatus'] as bool?;
    _pdfLink = snapshotData['pdfLink'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('policy');

  static Stream<PolicyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PolicyRecord.fromSnapshot(s));

  static Future<PolicyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PolicyRecord.fromSnapshot(s));

  static PolicyRecord fromSnapshot(DocumentSnapshot snapshot) => PolicyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PolicyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PolicyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PolicyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PolicyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPolicyRecordData({
  String? policyType,
  String? policyDescription,
  int? policyID,
  String? userID,
  bool? isStatus,
  String? pdfLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PolicyType': policyType,
      'policyDescription': policyDescription,
      'policyID': policyID,
      'User_ID': userID,
      'isStatus': isStatus,
      'pdfLink': pdfLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class PolicyRecordDocumentEquality implements Equality<PolicyRecord> {
  const PolicyRecordDocumentEquality();

  @override
  bool equals(PolicyRecord? e1, PolicyRecord? e2) {
    return e1?.policyType == e2?.policyType &&
        e1?.policyDescription == e2?.policyDescription &&
        e1?.policyID == e2?.policyID &&
        e1?.userID == e2?.userID &&
        e1?.isStatus == e2?.isStatus &&
        e1?.pdfLink == e2?.pdfLink;
  }

  @override
  int hash(PolicyRecord? e) => const ListEquality().hash([
        e?.policyType,
        e?.policyDescription,
        e?.policyID,
        e?.userID,
        e?.isStatus,
        e?.pdfLink
      ]);

  @override
  bool isValidKey(Object? o) => o is PolicyRecord;
}
