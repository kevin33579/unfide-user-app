part of 'pages.dart';

class jadwalMinggu extends StatefulWidget {
  static const String routeName = "/jadwalminggu";

  @override
  _jadwalMingguState createState() =>
      _jadwalMingguState();
}

class _jadwalMingguState extends State<jadwalMinggu> {
  CollectionReference jadwalMingguCollection =
  FirebaseFirestore.instance.collection("minggu");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: jadwalMingguCollection.snapshots(),
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
                Minggu minggu = new Minggu(
                  doc['mingguUid'],
                  doc['mingguNamaPsikolog'],
                  doc['mingguJam'],
                );
                return mingguCard(minggu: minggu);
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
        title: Text("Minggu"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}
