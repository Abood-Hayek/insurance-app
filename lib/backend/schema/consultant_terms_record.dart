import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsultantTermsRecord extends FirestoreRecord {
  ConsultantTermsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('consultantTerms');

  static Stream<ConsultantTermsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConsultantTermsRecord.fromSnapshot(s));

  static Future<ConsultantTermsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConsultantTermsRecord.fromSnapshot(s));

  static ConsultantTermsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConsultantTermsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConsultantTermsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConsultantTermsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConsultantTermsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConsultantTermsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConsultantTermsRecordData({
  String? description,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConsultantTermsRecordDocumentEquality
    implements Equality<ConsultantTermsRecord> {
  const ConsultantTermsRecordDocumentEquality();

  @override
  bool equals(ConsultantTermsRecord? e1, ConsultantTermsRecord? e2) {
    return e1?.description == e2?.description && e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(ConsultantTermsRecord? e) =>
      const ListEquality().hash([e?.description, e?.updatedAt]);

  @override
  bool isValidKey(Object? o) => o is ConsultantTermsRecord;
}
