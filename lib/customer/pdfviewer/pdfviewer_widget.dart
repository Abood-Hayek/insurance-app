import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pdfviewer_model.dart';
export 'pdfviewer_model.dart';

class PdfviewerWidget extends StatefulWidget {
  const PdfviewerWidget({Key? key}) : super(key: key);

  @override
  _PdfviewerWidgetState createState() => _PdfviewerWidgetState();
}

class _PdfviewerWidgetState extends State<PdfviewerWidget> {
  late PdfviewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfviewerModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<PolicyRecord>>(
      stream: queryPolicyRecord(
        queryBuilder: (policyRecord) => policyRecord
            .where('User_ID', isEqualTo: currentUserUid)
            .orderBy('policyID'),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<PolicyRecord> pdfviewerPolicyRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final pdfviewerPolicyRecord = pdfviewerPolicyRecordList.isNotEmpty
            ? pdfviewerPolicyRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Policy Preview',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FlutterFlowPdfViewer(
                    networkPath: pdfviewerPolicyRecord!.pdfLink,
                    height: 501.0,
                    horizontalScroll: false,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
