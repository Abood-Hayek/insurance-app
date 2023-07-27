import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'display_rewards_model.dart';
export 'display_rewards_model.dart';

class DisplayRewardsWidget extends StatefulWidget {
  const DisplayRewardsWidget({Key? key}) : super(key: key);

  @override
  _DisplayRewardsWidgetState createState() => _DisplayRewardsWidgetState();
}

class _DisplayRewardsWidgetState extends State<DisplayRewardsWidget> {
  late DisplayRewardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayRewardsModel());
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
        appBar: AppBar(
          backgroundColor: Color(0xFFE88282),
          automaticallyImplyLeading: false,
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'rewardPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                        ),
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          title: Text(
            'List of Rewards',
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
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
                child: Container(
                  width: 395.0,
                  height: 747.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFB7BBC3),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: StreamBuilder<List<RewardRecord>>(
                    stream: queryRewardRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<RewardRecord> listViewRewardRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewRewardRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewRewardRecord =
                              listViewRewardRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Expired date: ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF470F11),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          'd/M/y',
                                          listViewRewardRecord.expireDate,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        'null',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Name: ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF470F11),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      listViewRewardRecord.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          200.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await listViewRewardRecord.reference
                                              .delete();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Data is deleted !',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0x57FF5963),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Color(0xFFC50000),
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Reward ID: ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF470F11),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      listViewRewardRecord.rewardID.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '-------------------------------------------------------------------',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF470F11),
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
