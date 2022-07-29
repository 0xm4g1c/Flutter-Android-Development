import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Setup/Pages/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 200, 194, 193),
        appBarTheme:  const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),

        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(
              fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: GoogleFonts.poppins(
              fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3:
              GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.w400),
          headline4: GoogleFonts.poppins(
              fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5:
              GoogleFonts.rajdhani(fontSize: 24, fontWeight: FontWeight.w500),
          headline6: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1),
          bodyText1: GoogleFonts.rajdhani(
              fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5),
          bodyText2: GoogleFonts.rajdhani(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: GoogleFonts.rajdhani(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.00),
          caption: GoogleFonts.rajdhani(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: GoogleFonts.rajdhani(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: Color(0xff232122)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const LoginPage(),
    );
  }
}
