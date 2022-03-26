import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/navbar2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../landing2/landing2_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({
    Key key,
    this.dateparam,
  }) : super(key: key);

  final DateTime dateparam;

  @override
  _AboutUsWidgetState createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
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
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
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
                                EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0.05),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 65, 0, 0),
                                    child:
                                        StreamBuilder<List<DailyPostsRecord>>(
                                      stream: queryDailyPostsRecord(
                                        queryBuilder: (dailyPostsRecord) =>
                                            dailyPostsRecord.where('EDate',
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
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF47ADEF),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 280,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          'A Little Bit About Us',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.9, -1),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await signOut();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Landing2Widget(),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Logout',
                            options: FFButtonOptions(
                              width: 100,
                              height: 30,
                              color: Color(0xFF47ADEF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFCB1919),
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.53,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Html(
                                data:
                                    '<p style=\"font-weight: 400;\">&nbsp; &nbsp; &nbsp;Our mission is to help create a culture of growth and exploration within the leadership ranks of today&rsquo;s rapidly changing business. With a shortage of experienced leaders available in the recruiting pool we must look to our top frontline performers to step into these roles.</p>\n<p style=\"font-weight: 400;\">&nbsp; &nbsp; &nbsp;Although our best people deserve these elevated roles, many are not prepared with the skills to engage as leaders. The best salesperson, order picker or retail clerk is typically driven to be successful on their own, using competition to drive them. Getting them to understand how to engage direct reports who may not have the drive they did can be tough.</p>\n<p style=\"font-weight: 400;\">&nbsp; &nbsp; &nbsp;Better You Better Leader, is dedicated to bringing you quick 5 minutes lessons that help you look at leadership topics in new way. The idea is that we need to think differently about how we develop ourselves as leaders and more importantly how we develop tomorrow&rsquo;s talent. The good news is, in most cases the hard work is done. The industry specific knowledge is there. Let us help continue to develop yourself and your team with a fresh approach to learning.</p>\n<p style=\"font-weight: 400;\">&nbsp;</p>\n<p style=\"font-weight: 400;\"><em><strong><span style=\"color: #47adef;\">&ldquo;That is what learning is. You suddenly understand something you&rsquo;ve understood all your life, but in a new way.&rdquo;</span></strong></em></p>\n<p style=\"font-weight: 400;\"><strong><span style=\"color: #999999;\">- Doris Lessing (Nobel Prize Winner for Literature)</span></strong></p>\n<p style=\"font-weight: 400;\">&nbsp;</p>',
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
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Container(
                width: double.infinity,
                height: 125,
                decoration: BoxDecoration(
                  color: Color(0xFF47ADEF),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
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
