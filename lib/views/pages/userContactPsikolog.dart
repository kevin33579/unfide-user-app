part of 'pages.dart';

class contactPsikolog extends StatefulWidget {

  @override
  _contactPsikologState createState() => _contactPsikologState();
}

class _contactPsikologState extends State<contactPsikolog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd09484),
        title: Text("SESI KONSULTASI"),
      ),
      body:Container(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xffd09484),
                onPrimary: Colors.white,
              ),
              child: Text('Pilih Psikolog')),
        ),
      ),

    );
  }
}
