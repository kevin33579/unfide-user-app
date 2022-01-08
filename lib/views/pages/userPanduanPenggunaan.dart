part of 'pages.dart';

class PanduanPenggunaan extends StatefulWidget {
  static const String routeName = "/panduanpenggunaan";
  @override
  _PanduanPenggunaanState createState() => _PanduanPenggunaanState();
}

class _PanduanPenggunaanState extends State<PanduanPenggunaan> {
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
        title: Text("Panduan Penggunaan"),
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
