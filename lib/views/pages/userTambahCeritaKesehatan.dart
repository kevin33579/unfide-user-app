part of 'pages.dart';

class TambahCeritaKesehatan extends StatefulWidget {
  static const String routeName = "/tambahceritakesehatan";

  @override
  _TambahCeritaKesehatanState createState() => _TambahCeritaKesehatanState();
}

class _TambahCeritaKesehatanState extends State<TambahCeritaKesehatan> {
  final _formKey = GlobalKey<FormState>();
  final textKesehatan = TextEditingController();
  final FirebaseAuth auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child:Scaffold(
          backgroundColor: Color(0xfffff4f4),
          appBar: AppBar(
            // You can add title here
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: new IconButton(
              icon: new Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.popAndPushNamed(context, ListCeritaKesehatan.routeName);
              },
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, TambahCeritaKesehatan.routeName);
                    },
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffd09484),
                        padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: Text('Post'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final uid = AuthServices.auth.currentUser!.uid;
                          final dataKesehatan = textKesehatan.text;
                          final int likes = 0;
                          KesehatanServices.addData(Kesehatan(uid,dataKesehatan,'','',likes));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.pushReplacementNamed(
                              context, ListCeritaKesehatan.routeName);
                        }

                      },
                    ),
                  )),
            ],
          ),
          body: Container(
            child: TextFormField(
              controller: textKesehatan,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration:
              const InputDecoration(labelText: 'Ceritakan apa yang terjadi?'),
              maxLines: 100,
              minLines: 3,
            ),
          ),
        )
    );
  }
}
