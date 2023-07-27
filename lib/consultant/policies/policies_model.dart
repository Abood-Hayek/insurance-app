import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class PoliciesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, PolicyRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, PolicyRecord>? listViewPagingController2;
  Query? listViewPagingQuery2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();

    listViewPagingController1?.dispose();

    listViewPagingController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, PolicyRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, PolicyRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PolicyRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPolicyRecordPage(
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }

  PagingController<DocumentSnapshot?, PolicyRecord> setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, PolicyRecord> _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PolicyRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPolicyRecordPage(
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }
}
