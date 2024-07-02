import 'package:fluttertoast/fluttertoast.dart';

class DreamToast {
  static void open(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
