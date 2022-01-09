part of 'pages.dart';

class jadwalSabtu extends StatefulWidget {
  static const String routeName = "/jadwalsabtu";

  @override
  _jadwalSabtuState createState() =>
      _jadwalSabtuState();
}

class _jadwalSabtuState extends State<jadwalSabtu> {
  CollectionReference jadwalSabtuCollection =
  FirebaseFirestore.instance.collection("sabtu");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: jadwalSabtuCollection.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Failed to load data");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return ActivityServices.loadings();
            }
            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                Sabtu sabtu = new Sabtu(
                  doc['sabtuUid'],
                  doc['sabtuNamaPsikolog'],
                  doc['sabtuJam'],
                );
                return sabtuCard(sabtu: sabtu);
              }).toList(),
            );
          },
        ));
  }

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
        title: Text("Sabtu"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}
