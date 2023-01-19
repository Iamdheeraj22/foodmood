import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmood/app/data/network/api_msg_strings.dart';


class NetworkUtil {
  NetworkUtil._();

//show ProgressDialog
/*  static void showProgressDialog() {
    Widget _drawerWidget = Container(
      child: const SafeArea(
        child: SizedBox.expand(
          child: ProgressWidget(),
        ),
      ),
      color: Colors.transparent,
    );

    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 50),
      context: NavigationService.navigatorKey.currentContext!,
      pageBuilder: (_, __, ___) {
        return _drawerWidget;
      },
    );
  }*/
}

//ProgressDialog
//This class is used for custom progress widget for ios
class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120.0,
        width: 150.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CupertinoActivityIndicator(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                ApiMsgStrings.txtPleaseWait,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.0,
                    decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
