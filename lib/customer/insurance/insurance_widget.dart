import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'insurance_model.dart';
export 'insurance_model.dart';

class InsuranceWidget extends StatefulWidget {
  const InsuranceWidget({Key? key}) : super(key: key);

  @override
  _InsuranceWidgetState createState() => _InsuranceWidgetState();
}

class _InsuranceWidgetState extends State<InsuranceWidget> {
  late InsuranceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final selectedFiles = await selectFiles(
              allowedExtensions: ['pdf'],
              multiFile: false,
            );
            if (selectedFiles != null) {
              setState(() => _model.isDataUploading = true);
              var selectedUploadedFiles = <FFUploadedFile>[];

              var downloadUrls = <String>[];
              try {
                showUploadMessage(
                  context,
                  'Uploading file...',
                  showLoading: true,
                );
                selectedUploadedFiles = selectedFiles
                    .map((m) => FFUploadedFile(
                          name: m.storagePath.split('/').last,
                          bytes: m.bytes,
                        ))
                    .toList();

                downloadUrls = (await Future.wait(
                  selectedFiles.map(
                    (f) async => await uploadData(f.storagePath, f.bytes),
                  ),
                ))
                    .where((u) => u != null)
                    .map((u) => u!)
                    .toList();
              } finally {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                _model.isDataUploading = false;
              }
              if (selectedUploadedFiles.length == selectedFiles.length &&
                  downloadUrls.length == selectedFiles.length) {
                setState(() {
                  _model.uploadedLocalFile = selectedUploadedFiles.first;
                  _model.uploadedFileUrl = downloadUrls.first;
                });
                showUploadMessage(
                  context,
                  'Success!',
                );
              } else {
                setState(() {});
                showUploadMessage(
                  context,
                  'Failed to upload file',
                );
                return;
              }
            }

            await PolicyRecord.collection.doc().set(createPolicyRecordData(
                  policyID: FFAppState().PolicyID,
                  userID: currentUserUid,
                  pdfLink: _model.uploadedFileUrl,
                ));
            setState(() {
              FFAppState().PolicyID = FFAppState().PolicyID + 1;
            });
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Insurance Policy',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 20.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 609.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PagedListView<DocumentSnapshot<Object?>?,
                              PolicyRecord>(
                            pagingController: _model.setListViewController(
                              PolicyRecord.collection
                                  .where('User_ID', isEqualTo: currentUserUid),
                            ),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<PolicyRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
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
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) => Center(
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

                              itemBuilder: (context, _, listViewIndex) {
                                final listViewPolicyRecord = _model
                                    .listViewPagingController!
                                    .itemList![listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 18.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    child: Container(
                                      width: 340.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          18.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Policy',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFAppState()
                                                        .PolicyID
                                                        .toString(),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 18.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context
                                                      .pushNamed('pdfviewer');
                                                },
                                                child: Text(
                                                  'View',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
