part of 'pages.dart';

class TambahCeritaCintaDanLogika extends StatefulWidget {
  static const String routeName = "/tambahceritacintadanlogika";

  @override
  _TambahCeritaCintaDanLogikaState createState() => _TambahCeritaCintaDanLogikaState();
}

class _TambahCeritaCintaDanLogikaState extends State<TambahCeritaCintaDanLogika> {
  final _formKey = GlobalKey<FormState>();
  final textCdl = TextEditingController();
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
                Navigator.popAndPushNamed(context, ListCeritaCintaDanLogika.routeName);
              },
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, TambahCeritaCintaDanLogika.routeName);
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
                          final dataCDL = textCdl.text;
                          final int likes = 0;
                          CintaDanLogikaServices.addData(CintaDanLogika(uid,dataCDL,'','',likes));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.pushReplacementNamed(
                              context, ListCeritaCintaDanLogika.routeName);
                        }

                      },
                    ),
                  )),
            ],
          ),
          body: Container(
            child: TextFormField(
              controller: textCdl,
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
