import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/navbar2_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsofUseWidget extends StatefulWidget {
  const TermsofUseWidget({
    Key key,
    this.dateparam,
  }) : super(key: key);

  final DateTime dateparam;

  @override
  _TermsofUseWidgetState createState() => _TermsofUseWidgetState();
}

class _TermsofUseWidgetState extends State<TermsofUseWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Container(
                                width: 150,
                                height: 150,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/finalbetteryoulogo.png',
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 80, 20, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0, 0.05),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 62, 0, 0),
                                          child: StreamBuilder<
                                              List<DailyPostsRecord>>(
                                            stream: queryDailyPostsRecord(
                                              queryBuilder: (dailyPostsRecord) =>
                                                  dailyPostsRecord.where(
                                                      'EDate',
                                                      isGreaterThan:
                                                          getCurrentTimestamp),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitChasingDots(
                                                      color: Color(0xFF47ADEF),
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<DailyPostsRecord>
                                                  containerDailyPostsRecordList =
                                                  snapshot.data;
                                              // Return an empty Container when the document does not exist.
                                              if (snapshot.data.isEmpty) {
                                                return Container();
                                              }
                                              final containerDailyPostsRecord =
                                                  containerDailyPostsRecordList
                                                          .isNotEmpty
                                                      ? containerDailyPostsRecordList
                                                          .first
                                                      : null;
                                              return Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 0, 15, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                    'MMMEd',
                                                                    containerDailyPostsRecord
                                                                        .date),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<DailyPostsRecord>>(
                      stream: queryDailyPostsRecord(
                        queryBuilder: (dailyPostsRecord) => dailyPostsRecord
                            .where('EDate', isGreaterThan: getCurrentTimestamp),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitChasingDots(
                                color: Color(0xFF47ADEF),
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<DailyPostsRecord> containerDailyPostsRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final containerDailyPostsRecord =
                            containerDailyPostsRecordList.isNotEmpty
                                ? containerDailyPostsRecordList.first
                                : null;
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-0.1, -0.1),
                            child: StreamBuilder<UsersRecord>(
                              stream:
                                  UsersRecord.getDocument(currentUserReference),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitChasingDots(
                                        color: Color(0xFF47ADEF),
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                final rowUsersRecord = snapshot.data;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        height: 85,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.1, 0.15),
                                          child: FlutterFlowIconButton(
                                            borderColor: Color(0xFF47ADEF),
                                            borderRadius: 0,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            icon: Icon(
                                              Icons.backspace,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 25,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -0.25, -0.05),
                                            child: StreamBuilder<
                                                List<DailyPostsRecord>>(
                                              stream: queryDailyPostsRecord(
                                                queryBuilder:
                                                    (dailyPostsRecord) =>
                                                        dailyPostsRecord.where(
                                                            'SDate',
                                                            isEqualTo:
                                                                FFAppState()
                                                                    .Date),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: SpinKitChasingDots(
                                                        color:
                                                            Color(0xFF47ADEF),
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<DailyPostsRecord>
                                                    textDailyPostsRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final textDailyPostsRecord =
                                                    textDailyPostsRecordList
                                                            .isNotEmpty
                                                        ? textDailyPostsRecordList
                                                            .first
                                                        : null;
                                                return Text(
                                                  'Terms of Use',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Wrap(
                  spacing: 0,
                  runSpacing: 0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StreamBuilder<List<DailyPostsRecord>>(
                            stream: queryDailyPostsRecord(
                              queryBuilder: (dailyPostsRecord) =>
                                  dailyPostsRecord.where('EDate',
                                      isGreaterThan: getCurrentTimestamp),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitChasingDots(
                                      color: Color(0xFF47ADEF),
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<DailyPostsRecord>
                                  containerDailyPostsRecordList = snapshot.data;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data.isEmpty) {
                                return Container();
                              }
                              final containerDailyPostsRecord =
                                  containerDailyPostsRecordList.isNotEmpty
                                      ? containerDailyPostsRecordList.first
                                      : null;
                              return Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowWebView(
                                        url:
                                            'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
                                        bypass: false,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        verticalScroll: false,
                                        horizontalScroll: false,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF47ADEF),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, -0.05),
                      child: Navbar2Widget(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
