import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unfide_apps/shared/shared.dart';
import 'package:unfide_apps/views/pages/pages.dart';

void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async {
  enablePlatformOverrideForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meeting Notes Project",
      theme: Themes.lightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        Splash.routeName: (context) => Splash(),
        Login.routeName: (context) => Login(),
        MainMenu.routeName: (context) => MainMenu(),
        Register.routeName: (context) => Register(),
        ListCeritaPendidikan.routeName: (context) => ListCeritaPendidikan(),
        ListCeritaHoror.routeName: (context) => ListCeritaHoror(),
        ListCeritaCintaDanLogika.routeName: (context) =>
            ListCeritaCintaDanLogika(),
        ListCeritaKesehatan.routeName: (context) => ListCeritaKesehatan(),
        TambahCeritaPendidikan.routeName: (context) => TambahCeritaPendidikan(),
        TambahCeritaHoror.routeName: (context) => TambahCeritaHoror(),
        TambahCeritaCintaDanLogika.routeName: (context) =>
            TambahCeritaCintaDanLogika(),
        TambahCeritaKesehatan.routeName: (context) => TambahCeritaKesehatan(),
        ProfileSetting.routeName: (context) => ProfileSetting(),
        PanduanPenggunaan.routeName: (context) => PanduanPenggunaan(),
        PusatBantuan.routeName: (context) => PusatBantuan(),
        SyaratDanKetentuan.routeName: (context) => SyaratDanKetentuan(),
        UserEditProfile.routeName: (context) => UserEditProfile(),
      },
    );
  }
}
