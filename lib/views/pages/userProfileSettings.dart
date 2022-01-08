part of 'pages.dart';

class ProfileSetting extends StatefulWidget {
  static const String routeName = "/profilesetting";

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  bool isloading = false;

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
        title: Text("Pengaturan"),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, PanduanPenggunaan.routeName);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Panduan Penggunaan',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      onSurface: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, SyaratDanKetentuan.routeName);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Syarat dan Ketentuan',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      onSurface: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, PusatBantuan.routeName);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pusat Bantuan',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      onSurface: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton.icon(
              onPressed: () async {
                setState(() {
                  isloading = true;
                });
                await AuthServices.SignOut().then((value) {
                  if (value == true) {
                    setState(() {
                      isloading = false;
                    });
                    ActivityServices.showToast("Logout success", Colors.green);
                    Navigator.pushReplacementNamed(context, Login.routeName);
                  } else {
                    setState(() {
                      isloading = false;
                    });
                    ActivityServices.showToast("Logout failed", Colors.red);
                  }
                });

                //Navigator.pushReplacementNamed(context, MainMenu.routeName);
              },
              icon: Icon(Icons.logout),
              label: Text("Logout"),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffd09484),
                onPrimary: Colors.white,
                elevation: 0,
              ),
            ),
          ),
          isloading == true ? ActivityServices.loadings() : Container()
        ],
      ),
    );
  }
}
