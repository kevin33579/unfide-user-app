part of 'pages.dart';

class jadwalKamis extends StatefulWidget {
  static const String routeName = "/jadwalkamis";

  @override
  _jadwalKamisState createState() =>
      _jadwalKamisState();
}

class _jadwalKamisState extends State<jadwalKamis> {
  CollectionReference jadwalKamisCollection =
  FirebaseFirestore.instance.collection("kamis");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: jadwalKamisCollection.snapshots(),
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
                Kamis kamis = new Kamis(
                  doc['kamisUid'],
                  doc['kamisNamaPsikolog'],
                  doc['kamisJam'],
                );
                return kamisCard(kamis: kamis);
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
        title: Text("Kamis"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}
