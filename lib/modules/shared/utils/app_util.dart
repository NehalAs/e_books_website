import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'app_ui.dart';

class AppUtil {
  static double responsiveHeight(context) => MediaQuery.of(context).size.height;

  static double responsiveWidth(context) => MediaQuery.of(context).size.width;

  static mainNavigator(context, screen) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screen));

  static removeUntilNavigator(context, screen) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen), (route) => false);

  static replacementNavigator(context, screen) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => screen));


  static dialog2(context, title, List<Widget> dialogBody,
      {barrierDismissible = true}) async {
    return await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: Center(
              child: Text(
                title,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: dialogBody,
              ),
            ),
          );
        });
  }

  static dialog({
    required context,
    required title,
    List<Widget>? dialogBody,
    String? sheikhName,
    barrierDismissible = true,
    content,
    contentPadding,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          contentPadding: contentPadding ?? const EdgeInsets.all(26),
          backgroundColor: AppUI.orange_20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: title == ''
              ? null
              : Text(
                  '${title} ${sheikhName ?? ''}',
                  style: const TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          content: content ??
              Row(
                mainAxisSize: MainAxisSize.min,
                children: dialogBody!,
              ),
        );
      },
    );
  }

  static bottomDialog(context, title, List<Widget> dialogBody,
      {barrierDismissible = true, alignment, color}) async {
    return await showGeneralDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierLabel: "",
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AlertDialog(
            alignment: alignment ?? Alignment.center,
            backgroundColor: color ?? AppUI.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            title: Text(
              title,
            ),
            insetPadding: EdgeInsets.zero,
            titlePadding: const EdgeInsets.all(5),
            contentPadding: EdgeInsets.zero,
            content: Builder(builder: (context) {
              return SingleChildScrollView(
                child: ListBody(
                  children: dialogBody,
                ),
              );
            }),
          );
        });
  }

  static bottomSheet({
    required context,
    required Widget view,
  }) async {
    Scaffold.of(context).showBottomSheet(
      enableDrag: false,
      (context) {
        return view;
      },
    );
  }

  static customCircularProgressIndicator({bool isCenter = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(isCenter)
        Center(
          child: CircularProgressIndicator(
            color: AppUI.orange_30.withOpacity(0.5),
            strokeWidth: 3,
          ),
        ),
        if(!isCenter)
          CircularProgressIndicator(
            color: AppUI.orange_30.withOpacity(0.5),
            strokeWidth: 3,
          ),

      ],
    );
  }

  static void showToast({
    required String message,
    backgroundColor,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0,
      );

}
