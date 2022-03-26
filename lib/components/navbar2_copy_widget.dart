import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar2CopyWidget extends StatefulWidget {
  const Navbar2CopyWidget({Key key}) : super(key: key);

  @override
  _Navbar2CopyWidgetState createState() => _Navbar2CopyWidgetState();
}

class _Navbar2CopyWidgetState extends State<Navbar2CopyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.99,
            height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryColor,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.05, 0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPageWidget(),
                    ),
                  );
                },
                child: Text(
                  'Click to Login',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Playfair Display',
                        color: Color(0xFFF1F4F8),
                        fontSize: 30,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
