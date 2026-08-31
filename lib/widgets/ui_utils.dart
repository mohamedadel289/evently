import 'package:evently/app_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils {
  static void showSuccessMessage(String message) =>Fluttertoast.showToast(
        msg: message,
        toastLength: .LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: AppTheme.green,
        textColor: AppTheme.white,);
        static void showErrorMessage(String? message) =>Fluttertoast.showToast(
        msg: message?? "Something went wrong",
        toastLength: .LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: AppTheme.red,
        textColor: AppTheme.white,);
}