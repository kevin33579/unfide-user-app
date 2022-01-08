part of 'pages.dart';

class ListCeritaKesehatan extends StatefulWidget {
  static const String routeName = "/listceritakesehatan";

  @override
  _ListCeritaKesehatanState createState() => _ListCeritaKesehatanState();
}

class _ListCeritaKesehatanState extends State<ListCeritaKesehatan> {
  CollectionReference kesehatanCollection =
  FirebaseFirestore.instance.collection("kesehatan");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: kesehatanCollection.snapshots(),
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
                Kesehatan kesehatan = new Kesehatan(
                  doc['KesehatanUid'],
                  doc['KesehatanData'],
                  doc['createdAt'],
                  doc['updatedAt'],
                  doc['likes'],
                );
                return KesehatanCard(kesehatan: kesehatan);
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
        title: Text("Kesehatan"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, TambahCeritaKesehatan.routeName);
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
