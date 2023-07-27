import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerTermsRecord extends FirestoreRecord {
  CustomerTermsRecord._(
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
      FirebaseFirestore.instance.collection('customerTerms');

  static Stream<CustomerTermsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerTermsRecord.fromSnapshot(s));

  static Future<CustomerTermsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerTermsRecord.fromSnapshot(s));

  static CustomerTermsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerTermsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerTermsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerTermsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerTermsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerTermsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerTermsRecordData({
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

class CustomerTermsRecordDocumentEquality
    implements Equality<CustomerTermsRecord> {
  const CustomerTermsRecordDocumentEquality();

  @override
  bool equals(CustomerTermsRecord? e1, CustomerTermsRecord? e2) {
    return e1?.description == e2?.description && e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(CustomerTermsRecord? e) =>
      const ListEquality().hash([e?.description, e?.updatedAt]);

  @override
  bool isValidKey(Object? o) => o is CustomerTermsRecord;
}
