part of 'services.dart';

class ActivityServices {
  static String dateNow() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
    String hasil = formatter.format(now);
    return hasil;
  }

  static void showToast(String text, Color mycolor) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: mycolor,
        textColor: Colors.white,
        fontSize: 14);
  }

  static Container loadings() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.white12,
      child: SpinKitFadingCircle(
        size: 50,
        color: Colors.cyan,
      ),
    );
  }
}
