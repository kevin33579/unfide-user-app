part of 'pages.dart';

class UserEditProfile extends StatefulWidget {
  static const String routeName = "/usereditprofile";

  @override
  _UserEditProfileState createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd09484),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.popAndPushNamed(context, MainMenu.routeName);
          },
        ),
        title: Text("Edit Profile"),
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
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(24),
              child: ListView(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 24),
                          Image.asset("name"),
                          SizedBox(height: 40),
                          TextFormField(
                            controller: ctrlName,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Name",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please fill the field!!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlPhone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "Phone",
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please fill the field!!";
                              } else {
                                if (value.length < 7 || value.length > 14) {
                                  return "Phone number isn't valid!";
                                } else {
                                  return null;
                                }
                              }
                            },
                          ),
                          SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                await AuthServices.UpdateUserList(ctrlName.text,ctrlPhone.text).then((value) {
                                  if (value == "success") {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ActivityServices.showToast(
                                        "success", Colors.green);
                                    Navigator.pushReplacementNamed(
                                        context, Login.routeName);
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ActivityServices.showToast(
                                        value, Colors.red);
                                  }
                                });

                                //Navigator.pushReplacementNamed(context, MainMenu.routeName);
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Please check the fields",
                                );
                              }
                            },
                            icon: Icon(Icons.save),
                            label: Text("Save"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan,
                              elevation: 0,
                            ),
                          ),

                        ],
                      ))
                ],
              ),
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }
}
