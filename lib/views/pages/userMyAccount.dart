part of 'pages.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  CollectionReference pendidikanCollection =
      FirebaseFirestore.instance.collection("pendidikan");
  CollectionReference hororCollection =
      FirebaseFirestore.instance.collection("horor");
  CollectionReference kesehatanCollection =
      FirebaseFirestore.instance.collection("kesehatan");
  CollectionReference cdlCollection =
      FirebaseFirestore.instance.collection("cdl");

  Widget buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
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
          ),
          StreamBuilder<QuerySnapshot>(
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
                    doc['hororUid'],
                    doc['hororData'],
                    doc['createdAt'],
                    doc['updatedAt'],
                    doc['likes'],
                  );
                  return HororCard(horor: horor);
                }).toList(),
              );
            },
          ),
          StreamBuilder<QuerySnapshot>(
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
          ),
          StreamBuilder<QuerySnapshot>(
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
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffd09484),
          title: Text("P R O F I L E"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ProfileSetting.routeName);
                  },
                  child: Icon(
                    Icons.settings,
                  ),
                )),
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 115,
            width: 115,
            child: CircleAvatar(
              backgroundColor: Colors.cyan,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, UserEditProfile.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xffd09484),
                onPrimary: Colors.white,
              ),
              child: Text('Edit Profile')),
          Expanded(
            child: ListView(
              children: [
                buildBody(),
              ],
            ),
          ),
        ]));
  }
}
