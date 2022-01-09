part of 'pages.dart';

class jadwalSenin extends StatefulWidget {
  static const String routeName = "/jadwalsenin";

  @override
  _jadwalSeninState createState() =>
      _jadwalSeninState();
}

class _jadwalSeninState extends State<jadwalSenin> {
  CollectionReference jadwalSeninCollection =
  FirebaseFirestore.instance.collection("senin");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: jadwalSeninCollection.snapshots(),
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
                Senin senin = new Senin(
                  doc['seninUid'],
                  doc['seninNamaPsikolog'],
                  doc['seninJam'],
                );
                return seninCard(senin: senin);
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
        title: Text("Senin"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}
