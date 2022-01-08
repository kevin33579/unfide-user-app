part of 'pages.dart';

class ListCeritaHoror extends StatefulWidget {
  static const String routeName = "/listceritahoror";

  @override
  _ListCeritaHororState createState() => _ListCeritaHororState();
}

class _ListCeritaHororState extends State<ListCeritaHoror> {
  CollectionReference hororCollection =
  FirebaseFirestore.instance.collection("horor");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: hororCollection.snapshots(),
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
                Horor horor = new Horor(
                  doc['HororUid'],
                  doc['HororData'],
                  doc['createdAt'],
                  doc['updatedAt'],
                  doc['likes'],
                );
                return HororCard(horor: horor);
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
        title: Text("Horor"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, TambahCeritaHoror.routeName);
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
