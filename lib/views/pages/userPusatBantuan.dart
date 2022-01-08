part of 'pages.dart';

class PusatBantuan extends StatefulWidget {
  static const String routeName = "/pusatbantuan";

  @override
  _PusatBantuanState createState() => _PusatBantuanState();
}

class _PusatBantuanState extends State<PusatBantuan> {
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
        title: Text("Pusat Bantuan"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffff4f4),
        ),
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Text('Team UnFide akan dengan senang hati membantu anda!'),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/whatsapp-icon-logo-BDC0A8063B-seeklogo.png',
                        height: 100,
                        width: 100,
                      )),
                  Text('Hubungi Via WhatsApp'),
                  Text('+62 81338211835')
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Text('Kerjasama, Kolaborasi, dan Bisnis'),
                      Text('Hubungi Kami Via Email'),
                      Text(
                        'unfide@gmail.com',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
