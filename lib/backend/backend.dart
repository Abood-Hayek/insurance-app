import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/purchase_history_record.dart';
import 'schema/payment_record.dart';
import 'schema/consultant_record.dart';
import 'schema/customer_record.dart';
import 'schema/policy_record.dart';
import 'schema/reward_record.dart';
import 'schema/user_record.dart';
import 'schema/consultant_terms_record.dart';
import 'schema/customer_terms_record.dart';
import 'schema/banner_record.dart';
import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/purchase_history_record.dart';
export 'schema/payment_record.dart';
export 'schema/consultant_record.dart';
export 'schema/customer_record.dart';
export 'schema/policy_record.dart';
export 'schema/reward_record.dart';
export 'schema/user_record.dart';
export 'schema/consultant_terms_record.dart';
export 'schema/customer_terms_record.dart';
export 'schema/banner_record.dart';

/// Functions to query PurchaseHistoryRecords (as a Stream and as a Future).
Future<int> queryPurchaseHistoryRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PurchaseHistoryRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PurchaseHistoryRecord>> queryPurchaseHistoryRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PurchaseHistoryRecord.collection,
      PurchaseHistoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PurchaseHistoryRecord>> queryPurchaseHistoryRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PurchaseHistoryRecord.collection,
      PurchaseHistoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PurchaseHistoryRecord>> queryPurchaseHistoryRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PurchaseHistoryRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      PurchaseHistoryRecord.collection,
      PurchaseHistoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<PurchaseHistoryRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PaymentRecords (as a Stream and as a Future).
Future<int> queryPaymentRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PaymentRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PaymentRecord>> queryPaymentRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PaymentRecord.collection,
      PaymentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PaymentRecord>> queryPaymentRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PaymentRecord.collection,
      PaymentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PaymentRecord>> queryPaymentRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PaymentRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      PaymentRecord.collection,
      PaymentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<PaymentRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ConsultantRecords (as a Stream and as a Future).
Future<int> queryConsultantRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ConsultantRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ConsultantRecord>> queryConsultantRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ConsultantRecord.collection,
      ConsultantRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ConsultantRecord>> queryConsultantRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ConsultantRecord.collection,
      ConsultantRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ConsultantRecord>> queryConsultantRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ConsultantRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ConsultantRecord.collection,
      ConsultantRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ConsultantRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CustomerRecords (as a Stream and as a Future).
Future<int> queryCustomerRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CustomerRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CustomerRecord>> queryCustomerRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CustomerRecord.collection,
      CustomerRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CustomerRecord>> queryCustomerRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CustomerRecord.collection,
      CustomerRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CustomerRecord>> queryCustomerRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CustomerRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CustomerRecord.collection,
      CustomerRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CustomerRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PolicyRecords (as a Stream and as a Future).
Future<int> queryPolicyRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PolicyRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PolicyRecord>> queryPolicyRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PolicyRecord.collection,
      PolicyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PolicyRecord>> queryPolicyRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PolicyRecord.collection,
      PolicyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PolicyRecord>> queryPolicyRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PolicyRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      PolicyRecord.collection,
      PolicyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<PolicyRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query RewardRecords (as a Stream and as a Future).
Future<int> queryRewardRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RewardRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RewardRecord>> queryRewardRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RewardRecord.collection,
      RewardRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RewardRecord>> queryRewardRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RewardRecord.collection,
      RewardRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<RewardRecord>> queryRewardRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, RewardRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      RewardRecord.collection,
      RewardRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<RewardRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query UserRecords (as a Stream and as a Future).
Future<int> queryUserRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserRecord>> queryUserRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserRecord.collection,
      UserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserRecord>> queryUserRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserRecord.collection,
      UserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UserRecord>> queryUserRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UserRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UserRecord.collection,
      UserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UserRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ConsultantTermsRecords (as a Stream and as a Future).
Future<int> queryConsultantTermsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ConsultantTermsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ConsultantTermsRecord>> queryConsultantTermsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ConsultantTermsRecord.collection,
      ConsultantTermsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ConsultantTermsRecord>> queryConsultantTermsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ConsultantTermsRecord.collection,
      ConsultantTermsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ConsultantTermsRecord>> queryConsultantTermsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ConsultantTermsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ConsultantTermsRecord.collection,
      ConsultantTermsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ConsultantTermsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CustomerTermsRecords (as a Stream and as a Future).
Future<int> queryCustomerTermsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CustomerTermsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CustomerTermsRecord>> queryCustomerTermsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CustomerTermsRecord.collection,
      CustomerTermsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CustomerTermsRecord>> queryCustomerTermsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CustomerTermsRecord.collection,
      CustomerTermsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CustomerTermsRecord>> queryCustomerTermsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CustomerTermsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CustomerTermsRecord.collection,
      CustomerTermsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CustomerTermsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query BannerRecords (as a Stream and as a Future).
Future<int> queryBannerRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BannerRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BannerRecord>> queryBannerRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BannerRecord.collection,
      BannerRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BannerRecord>> queryBannerRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BannerRecord.collection,
      BannerRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<BannerRecord>> queryBannerRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, BannerRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      BannerRecord.collection,
      BannerRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<BannerRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UserRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UserRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUserRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UserRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUserRecordData(email: email));
}
