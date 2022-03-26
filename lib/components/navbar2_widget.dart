import '../about_us/about_us_widget.dart';
import '../components/premium_widget.dart';
import '../favorites/favorites_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../landing/landing_widget.dart';
import '../library/library_widget.dart';
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar2Widget extends StatefulWidget {
  const Navbar2Widget({Key key}) : super(key: key);

  @override
  _Navbar2WidgetState createState() => _Navbar2WidgetState();
}

class _Navbar2WidgetState extends State<Navbar2Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LandingWidget(),
                ),
              );
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF789095),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x3314181B),
                    offset: Offset(0, 2),
                  )
                ],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF000104),
                ),
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Icon(
                Icons.home_sharp,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final isEntitled = await revenue_cat.isEntitled('Premium');
              if (isEntitled == null) {
                return;
              } else if (!isEntitled) {
                await revenue_cat.loadOfferings();
              }

              if (isEntitled) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesWidget(),
                  ),
                );
              } else {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: PremiumWidget(),
                    );
                  },
                );
              }
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF789095),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x3314181B),
                    offset: Offset(0, 2),
                  )
                ],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF000104),
                ),
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Icon(
                Icons.favorite_sharp,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final isEntitled = await revenue_cat.isEntitled('Premium');
              if (isEntitled == null) {
                return;
              } else if (!isEntitled) {
                await revenue_cat.loadOfferings();
              }

              if (isEntitled) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LibraryWidget(),
                  ),
                );
              } else {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: PremiumWidget(),
                    );
                  },
                );
              }
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF789095),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x3314181B),
                    offset: Offset(0, 2),
                  )
                ],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF000104),
                ),
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Icon(
                Icons.menu_book_outlined,
                color: Color(0xFFF1F4F8),
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUsWidget(),
                ),
              );
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF789095),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x3314181B),
                    offset: Offset(0, 2),
                  )
                ],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF000104),
                ),
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Icon(
                Icons.info_outline,
                color: Color(0xFFF1F4F8),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
