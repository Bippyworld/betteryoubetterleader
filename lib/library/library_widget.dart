import '../backend/backend.dart';
import '../components/navbar2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../post_review/post_review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryWidget extends StatefulWidget {
  const LibraryWidget({Key key}) : super(key: key);

  @override
  _LibraryWidgetState createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {
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
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.22,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                        color: Color(0xFF47ADEF),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Full Library',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.52,
              decoration: BoxDecoration(
                color: Color(0xFF789095),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.15, 0),
                child: StreamBuilder<List<DailyPostsRecord>>(
                  stream: queryDailyPostsRecord(),
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
                    List<DailyPostsRecord> listViewDailyPostsRecordList =
                        snapshot.data;
                    if (listViewDailyPostsRecordList.isEmpty) {
                      return Center(
                        child: Image.network(
                          '',
                          width: MediaQuery.of(context).size.width * 0.86,
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewDailyPostsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewDailyPostsRecord =
                            listViewDailyPostsRecordList[listViewIndex];
                        return Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            constraints: BoxConstraints(
                              maxWidth: double.infinity,
                              maxHeight: double.infinity,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF789095),
                            ),
                            child: StreamBuilder<DailyPostsRecord>(
                              stream: DailyPostsRecord.getDocument(
                                  listViewDailyPostsRecord.reference),
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
                                final cardDailyPostsRecord = snapshot.data;
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFF789095),
                                  elevation: 4,
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() => FFAppState().RecTitle =
                                          cardDailyPostsRecord.title);
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PostReviewWidget(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xFF000104),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-0.15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.05, 0.05),
                                              child: Text(
                                                listViewDailyPostsRecord.title,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF47ADEF),
                                                        ),
                                              ),
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
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF47ADEF),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, -0.1),
                  child: Navbar2Widget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
