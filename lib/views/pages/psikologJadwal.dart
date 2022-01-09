part of 'pages.dart';

class PsikologJadwal extends StatefulWidget {
  static const String routeName = "/psikologjadwal";

  @override
  _PsikologJadwalState createState() => _PsikologJadwalState();
}

class _PsikologJadwalState extends State<PsikologJadwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd09484),
        title: Text("H A R I"),
      ),
      body: ListView(children: [
        Card(
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Text(
              'SENIN',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              child: Text('Pilih'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, jadwalSenin.routeName);
              },
            ),
          ]),
        ),
        Card(
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Text(
              'SELASA',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              child: Text('Pilih'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, jadwalSelasa.routeName);
              },
            ),
          ]),
        ),
        Card(
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Text(
              'RABU',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              child: Text('Pilih'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, jadwalRabu.routeName);
              },
            ),
          ]),
        ),
        Card(
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Text(
              'KAMIS',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              child: Text('Pilih'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, jadwalKamis.routeName);
              },
            ),
          ]),
        ),
        Card(
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Text(
              'JUMAT',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              child: Text('Pilih'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, jadwalJumat.routeName);
              },
            ),
          ]),
        ),
        Card(
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Text(
              'SABTU',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              child: Text('Pilih'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, jadwalSabtu.routeName);
              },
            ),
          ]),
        ),
        Card(
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Text(
              'MINGGU',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              child: Text('Pilih'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, jadwalMinggu.routeName);
              },
            ),
          ]),
        ),
      ]),
    );
  }
}
