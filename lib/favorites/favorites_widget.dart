import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/navbar2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../post_review/post_review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({Key key}) : super(key: key);

  @override
  _FavoritesWidgetState createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
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
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.22,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
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
                        List<DailyPostsRecord> circleImageDailyPostsRecordList =
                            snapshot.data;
                        return Container(
                          width: 160,
                          height: 160,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/finalbetteryoulogo.png',
                          ),
                        );
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: BoxDecoration(
                            color: Color(0xFF47ADEF),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: Text(
                              'Favorites',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      color: Color(0xFF789095),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.15, 0),
                      child: AuthUserStreamWidget(
                        child: Builder(
                          builder: (context) {
                            final collection = currentUserDocument?.favorites2
                                    ?.toList()
                                    ?.toList() ??
                                [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: collection.length,
                              itemBuilder: (context, collectionIndex) {
                                final collectionItem =
                                    collection[collectionIndex];
                                return Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF789095),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          currentUserReference),
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
                                        final cardUsersRecord = snapshot.data;
                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFF789095),
                                          elevation: 4,
                                          child: InkWell(
                                            onTap: () async {
                                              setState(() => FFAppState()
                                                  .RecTitle = collectionItem);
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
                                                color: Color(0xFFF1F4F8),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  width: 2,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    collectionItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF47ADEF),
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
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
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
