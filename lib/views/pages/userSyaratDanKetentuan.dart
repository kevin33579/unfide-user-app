part of 'pages.dart';

class SyaratDanKetentuan extends StatefulWidget {
  static const String routeName = "/syaratdanketentuan";
  @override
  _SyaratDanKetentuanState createState() => _SyaratDanKetentuanState();
}

class _SyaratDanKetentuanState extends State<SyaratDanKetentuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd09484),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.popAndPushNamed(context, MainMenu.routeName);
          },
        ),
        title: Text("Syarat dan Ketentuan"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffff4f4),
        ),
        child: Text(''),
      ),
    );
  }
}
