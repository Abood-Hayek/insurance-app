import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'policies_model.dart';
export 'policies_model.dart';

class PoliciesWidget extends StatefulWidget {
  const PoliciesWidget({Key? key}) : super(key: key);

  @override
  _PoliciesWidgetState createState() => _PoliciesWidgetState();
}

class _PoliciesWidgetState extends State<PoliciesWidget> {
  late PoliciesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PoliciesModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0x953999EF),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('homeMenu');
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                Align(
                  alignment: Alignment(-1.0, 0),
                  child: FlutterFlowButtonTabBar(
                    useToggleButtonStyle: false,
                    isScrollable: true,
                    labelStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF14181B),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                    unselectedLabelStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF14181B),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                    labelColor: Color(0xFF14181B),
                    unselectedLabelColor: Color(0xFF57636C),
                    backgroundColor: Color(0x4C4B39EF),
                    unselectedBackgroundColor: Colors.white,
                    borderColor: Color(0xFF4B39EF),
                    unselectedBorderColor: Color(0xFFE0E3E7),
                    borderWidth: 2.0,
                    borderRadius: 12.0,
                    elevation: 0.0,
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    buttonMargin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                    tabs: [
                      Tab(
                        text: 'new policy',
                      ),
                      Tab(
                        text: 'old policy',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      KeepAliveWidgetWrapper(
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 10.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      indent: 0.0,
                                      endIndent: 0.0,
                                      color: Color(0xFFE0E3E7),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 12.0, 0.0, 12.0),
                                      child: Text(
                                        'Quickly find policies',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      indent: 0.0,
                                      endIndent: 0.0,
                                      color: Color(0xFFE0E3E7),
                                    ),
                                    PagedListView<DocumentSnapshot<Object?>?,
                                        PolicyRecord>(
                                      pagingController:
                                          _model.setListViewController1(
                                        PolicyRecord.collection,
                                      ),
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              PolicyRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),

                                        itemBuilder:
                                            (context, _, listViewIndex) {
                                          final listViewPolicyRecord = _model
                                              .listViewPagingController1!
                                              .itemList![listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('Details');
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 110.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 0.0,
                                                      color: Color(0xFFE0E3E7),
                                                      offset: Offset(0.0, 1.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    16.0,
                                                                    8.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/f-f-admin-panel-k7zoev/assets/mh4367b9q133/Stream_1.2_homeDark@2x.png',
                                                            width: 50.0,
                                                            height: 100.0,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          listViewPolicyRecord
                                                              .policyDescription,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: Color(
                                                                    0xFF14181B),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          listViewPolicyRecord
                                                              .policyType,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            height: 28.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4D39D2C0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewPolicyRecord
                                                                    .isStatus
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      color: Color(
                                                                          0xFF39D2C0),
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
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
                          ],
                        ),
                      ),
                      KeepAliveWidgetWrapper(
                        builder: (context) => SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                indent: 0.0,
                                endIndent: 0.0,
                                color: Color(0xFFE0E3E7),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 12.0, 0.0, 12.0),
                                child: Text(
                                  'Find your components',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              PagedListView<DocumentSnapshot<Object?>?,
                                  PolicyRecord>(
                                pagingController: _model.setListViewController2(
                                  PolicyRecord.collection,
                                ),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<PolicyRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewPolicyRecord = _model
                                        .listViewPagingController2!
                                        .itemList![listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 110.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0.0,
                                                color: Color(0xFFE0E3E7),
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 16.0, 8.0),
                                                  child: Container(
                                                    width: 70.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Image.network(
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/f-f-admin-panel-k7zoev/assets/mh4367b9q133/Stream_1.2_homeDark@2x.png',
                                                      width: 50.0,
                                                      height: 100.0,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    listViewPolicyRecord
                                                        .policyDescription,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    'cateogry',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      height: 28.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x4D39D2C0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          listViewPolicyRecord
                                                              .isStatus
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: Color(
                                                                    0xFF39D2C0),
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    scaffoldKey.currentState!.openEndDrawer();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0.0,
                                          color: Color(0xFFE0E3E7),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
