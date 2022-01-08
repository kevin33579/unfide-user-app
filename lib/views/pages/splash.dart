part of 'pages.dart';

class Splash extends StatefulWidget {
  static const String routeName = "/splash";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _loadSplash();
  }

  _loadSplash() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, checkAuth);
  }

  void checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Navigator.pushReplacementNamed(context, MainMenu.routeName);
      ActivityServices.showToast(
          "Welcome back ", Colors.cyan);
    } else {
      Navigator.pushReplacementNamed(context, Login.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xfffff4f4),
        child: Image.asset("assets/images/fix_logo.png", height: 200));
  }
}
