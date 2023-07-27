import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ListCustomerModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ConsultantRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();

    listViewPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ConsultantRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ConsultantRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, ConsultantRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryConsultantRecordPage(
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }
}
