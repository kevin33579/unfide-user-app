part of 'pages.dart';

class JenisCerita extends StatefulWidget {
  const JenisCerita({Key? key}) : super(key: key);

  @override
  _JenisCeritaState createState() => _JenisCeritaState();
}

class _JenisCeritaState extends State<JenisCerita> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd09484),
        title: Text("U N F I D E"),
      ),
        body: ListView(children: [
          Card(
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Text(
                'Pendidikan',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'berbagi cerita tentang pendidikan',
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                child: Text('Pilih'),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ListCeritaPendidikan.routeName);
                },
              ),
            ]),
          ),
          Card(
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Text(
                'cinta dan logika',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'berbagi cerita tentang cinta dan logika',
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                child: Text('Pilih'),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ListCeritaCintaDanLogika.routeName);
                },
              ),
            ]),
          ),
          Card(
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Text(
                'kesehatan',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'berbagi cerita tentang kesehatan',
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                child: Text('Pilih'),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ListCeritaKesehatan.routeName);
                },
              ),
            ]),
          ),
          Card(
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Text(
                'Horor',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'berbagi cerita tentang Horor',
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                child: Text('Pilih'),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ListCeritaHoror.routeName);
                },
              ),
            ]),
          ),
        ]),
    );
  }
}
