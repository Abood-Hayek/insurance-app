import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "is_consultant" field.
  bool? _isConsultant;
  bool get isConsultant => _isConsultant ?? false;
  bool hasIsConsultant() => _isConsultant != null;

  // "is_premium" field.
  bool? _isPremium;
  bool get isPremium => _isPremium ?? false;
  bool hasIsPremium() => _isPremium != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "remember_me" field.
  String? _rememberMe;
  String get rememberMe => _rememberMe ?? '';
  bool hasRememberMe() => _rememberMe != null;

  // "consultants" field.
  List<DocumentReference>? _consultants;
  List<DocumentReference> get consultants => _consultants ?? const [];
  bool hasConsultants() => _consultants != null;

  // "policies" field.
  List<DocumentReference>? _policies;
  List<DocumentReference> get policies => _policies ?? const [];
  bool hasPolicies() => _policies != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "is_admin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "is_customer" field.
  bool? _isCustomer;
  bool get isCustomer => _isCustomer ?? false;
  bool hasIsCustomer() => _isCustomer != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _password = snapshotData['password'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isConsultant = snapshotData['is_consultant'] as bool?;
    _isPremium = snapshotData['is_premium'] as bool?;
    _points = castToType<int>(snapshotData['points']);
    _rememberMe = snapshotData['remember_me'] as String?;
    _consultants = getDataList(snapshotData['consultants']);
    _policies = getDataList(snapshotData['policies']);
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isAdmin = snapshotData['is_admin'] as bool?;
    _isCustomer = snapshotData['is_customer'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? password,
  String? phoneNumber,
  bool? isConsultant,
  bool? isPremium,
  int? points,
  String? rememberMe,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  bool? isAdmin,
  bool? isCustomer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
      'is_consultant': isConsultant,
      'is_premium': isPremium,
      'points': points,
      'remember_me': rememberMe,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'is_admin': isAdmin,
      'is_customer': isCustomer,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.password == e2?.password &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isConsultant == e2?.isConsultant &&
        e1?.isPremium == e2?.isPremium &&
        e1?.points == e2?.points &&
        e1?.rememberMe == e2?.rememberMe &&
        listEquality.equals(e1?.consultants, e2?.consultants) &&
        listEquality.equals(e1?.policies, e2?.policies) &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isCustomer == e2?.isCustomer;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.password,
        e?.phoneNumber,
        e?.isConsultant,
        e?.isPremium,
        e?.points,
        e?.rememberMe,
        e?.consultants,
        e?.policies,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.isAdmin,
        e?.isCustomer
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
