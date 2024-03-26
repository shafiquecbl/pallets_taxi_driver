import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

showLoading() => SmartDialog.showLoading();

dismiss() => SmartDialog.dismiss();

showToast(String text, {bool success = false, String? title}) =>
    SmartDialog.showToast(text);
