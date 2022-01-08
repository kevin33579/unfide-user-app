part of 'pages.dart';

class ListCeritaCintaDanLogika extends StatefulWidget {
  static const String routeName = "/listceritacintadanlogika";

  @override
  _ListCeritaCintaDanLogikaState createState() => _ListCeritaCintaDanLogikaState();
}

class _ListCeritaCintaDanLogikaState extends State<ListCeritaCintaDanLogika> {
  CollectionReference cintadanlogikaCollection =
  FirebaseFirestore.instance.collection("cintadanlogika");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: cintadanlogikaCollection.snapshots(),
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
                CintaDanLogika cintadanlogika = new CintaDanLogika(
                  doc['CdlUid'],
                  doc['CdlData'],
                  doc['createdAt'],
                  doc['updatedAt'],
                  doc['likes'],
                );
                return CintaDanLogikaCard(cintaDanLogika: cintadanlogika);
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
        title: Text("Cinta dan Logika"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, TambahCeritaCintaDanLogika.routeName);
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
