// Default toast ------------------------------------------------------------------------
import 'package:fluttertoast/fluttertoast.dart';

import '../../config/colors.dart';

Future<bool?> defaultToastWidget(
  String msg,
) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: AppColors.black_color.withOpacity(0.6),
    textColor: AppColors.white_color,
    fontSize: 12.0,
  );
}

// Error toast ---------------------------------------------------------------------------
Future<bool?> errorToastWidget(
  String msg,
) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: AppColors.red_color.withOpacity(0.6),
    textColor: AppColors.white_color,
    fontSize: 12.0,
  );
}
