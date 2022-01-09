part of 'pages.dart';

class jadwalRabu extends StatefulWidget {
  static const String routeName = "/jadwalrabu";

  @override
  _jadwalRabuState createState() =>
      _jadwalRabuState();
}

class _jadwalRabuState extends State<jadwalRabu> {
  CollectionReference jadwalRabuCollection =
  FirebaseFirestore.instance.collection("rabu");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: jadwalRabuCollection.snapshots(),
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
                Rabu rabu = new Rabu(
                  doc['rabuUid'],
                  doc['rabuNamaPsikolog'],
                  doc['rabuJam'],
                );
                return rabuCard(rabu: rabu);
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
        title: Text("Rabu"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}
