part of 'pages.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Register'),
        centerTitle: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
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
                          Image.asset("assets/images/fix_logo.png"),
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
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.mail_outline_rounded),
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email!";
                              } else {
                                if (!EmailValidator.validate(value)) {
                                  return "Email not valid!";
                                } else {
                                  return null;
                                }
                                return null;
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                Users users = new Users(
                                    "",
                                    ctrlName.text,
                                    ctrlPhone.text,
                                    ctrlEmail.text,
                                    ctrlPassword.text,
                                    "",
                                    "",
                                    "psikolog");
                                await AuthServices.SignUp(users).then((value) {
                                  if (value == "success") {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ActivityServices.showToast(
                                        "Register success", Colors.green);
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
                            label: Text("Register"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan,
                              elevation: 0,
                            ),
                          ),
                          SizedBox(height: 24),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, Login.routeName);
                            },
                            child: Text(
                              "Already registered? Login.",
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
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }
}
