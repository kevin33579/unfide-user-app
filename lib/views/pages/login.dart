part of 'pages.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xfffff4f4),
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              alignment: Alignment.bottomRight,
            )),
        padding: EdgeInsets.all(24),
        child: Stack(
          children: [
            ListView(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 24),
                        Image.asset(
                          "assets/images/fix_logo.png",
                          height: 200,
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: ctrlEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.mail_outline_rounded),
                            border: OutlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your email!";
                            } else {
                              if (!EmailValidator.validate(value)) {
                                return "Email not valid!";
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          controller: ctrlPassword,
                          obscureText: isVisible,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.vpn_key),
                            border: OutlineInputBorder(),
                            suffixIcon: new GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value!.length < 6
                                ? "password must have at least 6 characters!"
                                : null;
                          },
                        ),
                        SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await AuthServices.SignIn(
                                      ctrlEmail.text, ctrlPassword.text)
                                  .then((value) {
                                if (value == "success") {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ActivityServices.showToast(
                                      "Login success", Colors.green);
                                  Navigator.pushReplacementNamed(
                                      context, MainMenu.routeName);
                                  // final User user = auth.currentUser!;
                                  // final docs = firestore.collection('users').doc(user.uid);
                                  // if(docs.collection('role') == 'user'){
                                  //   Navigator.pushReplacementNamed(context, MainMenu.routeName);
                                  // }else if(docs.collection('role') == 'psikolog'){
                                  //   Navigator.pushReplacementNamed(context, PsikologMainMenu.routeName);
                                  // }

                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ActivityServices.showToast(value, Colors.red);
                                }
                              });

                              //Navigator.pushReplacementNamed(context, MainMenu.routeName);
                            } else {
                              Fluttertoast.showToast(
                                msg: "Please check the fields",
                              );
                            }
                          },
                          icon: Icon(Icons.login_rounded),
                          label: Text("Login"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan,
                            elevation: 0,
                          ),
                        ),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Register.routeName);
                          },
                          child: Text(
                            "Not registered yet? Join now!",
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }
}
