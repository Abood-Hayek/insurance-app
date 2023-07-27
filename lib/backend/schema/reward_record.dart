import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RewardRecord extends FirestoreRecord {
  RewardRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "RewardID" field.
  int? _rewardID;
  int get rewardID => _rewardID ?? 0;
  bool hasRewardID() => _rewardID != null;

  // "rewardStatus" field.
  String? _rewardStatus;
  String get rewardStatus => _rewardStatus ?? '';
  bool hasRewardStatus() => _rewardStatus != null;

  // "ExpireDate" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  bool hasExpireDate() => _expireDate != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _rewardID = castToType<int>(snapshotData['RewardID']);
    _rewardStatus = snapshotData['rewardStatus'] as String?;
    _expireDate = snapshotData['ExpireDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reward');

  static Stream<RewardRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RewardRecord.fromSnapshot(s));

  static Future<RewardRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RewardRecord.fromSnapshot(s));

  static RewardRecord fromSnapshot(DocumentSnapshot snapshot) => RewardRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RewardRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RewardRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RewardRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RewardRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRewardRecordData({
  String? name,
  int? rewardID,
  String? rewardStatus,
  DateTime? expireDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'RewardID': rewardID,
      'rewardStatus': rewardStatus,
      'ExpireDate': expireDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class RewardRecordDocumentEquality implements Equality<RewardRecord> {
  const RewardRecordDocumentEquality();

  @override
  bool equals(RewardRecord? e1, RewardRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.rewardID == e2?.rewardID &&
        e1?.rewardStatus == e2?.rewardStatus &&
        e1?.expireDate == e2?.expireDate;
  }

  @override
  int hash(RewardRecord? e) => const ListEquality()
      .hash([e?.name, e?.rewardID, e?.rewardStatus, e?.expireDate]);

  @override
  bool isValidKey(Object? o) => o is RewardRecord;
}
