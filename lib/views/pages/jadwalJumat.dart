part of 'pages.dart';

class jadwalJumat extends StatefulWidget {
  static const String routeName = "/jadwaljumat";

  @override
  _jadwalJumatState createState() =>
      _jadwalJumatState();
}

class _jadwalJumatState extends State<jadwalJumat> {
  CollectionReference jadwalJumatCollection =
  FirebaseFirestore.instance.collection("jumat");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: jadwalJumatCollection.snapshots(),
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
                Jumat jumat = new Jumat(
                  doc['jumatUid'],
                  doc['jumatNamaPsikolog'],
                  doc['jumatJam'],
                );
                return jumatCard(jumat: jumat);
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
        title: Text("Jumat"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}
