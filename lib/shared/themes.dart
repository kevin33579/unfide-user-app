part of 'shared.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.cyan,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.cyan,
      accentColor: Colors.cyan,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.lato().fontFamily,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: Colors.cyan,
      backgroundColor: Colors.black38,
      scaffoldBackgroundColor: Colors.black38,
      primaryColor: Colors.cyan,
      accentColor: Colors.cyan,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.lato().fontFamily,
    );
  }
}
