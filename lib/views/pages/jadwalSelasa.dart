part of 'pages.dart';

class jadwalSelasa extends StatefulWidget {
  static const String routeName = "/jadwalselasa";

  @override
  _jadwalSelasaState createState() =>
      _jadwalSelasaState();
}

class _jadwalSelasaState extends State<jadwalSelasa> {
  CollectionReference jadwalSelasaCollection =
  FirebaseFirestore.instance.collection("selasa");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: jadwalSelasaCollection.snapshots(),
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
                Selasa selasa = new Selasa(
                  doc['selasaUid'],
                  doc['selasaNamaPsikolog'],
                  doc['selasaJam'],
                );
                return selasaCard(selasa: selasa);
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
        title: Text("Selasa"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}
