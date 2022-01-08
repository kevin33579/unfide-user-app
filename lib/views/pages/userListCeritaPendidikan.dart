part of 'pages.dart';

class ListCeritaPendidikan extends StatefulWidget {
  static const String routeName = "/listceritapendidikan";

  @override
  _ListCeritaPendidikanState createState() => _ListCeritaPendidikanState();
}

class _ListCeritaPendidikanState extends State<ListCeritaPendidikan> {
  CollectionReference pendidikanCollection =
  FirebaseFirestore.instance.collection("pendidikan");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: pendidikanCollection.snapshots(),
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
                Pendidikan pendidikan = new Pendidikan(
                  doc['pendidikanUid'],
                  doc['PendidikanData'],
                  doc['createdAt'],
                  doc['updatedAt'],
                  doc['likes'],
                );
                return pendidikanCard(pendidikan: pendidikan);
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
          onPressed: (){
            Navigator.popAndPushNamed(context,MainMenu.routeName);
          },
        ),
        title: Text("Pendidikan"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, TambahCeritaPendidikan.routeName);
                },
                child: Icon(
                    Icons.add,
                ),
              )
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}
