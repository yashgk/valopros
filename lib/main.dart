import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/screens/homepage.dart';

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
      title: 'Valo-PROS',
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
      builder: (context, test) {
        SizeConfig.init(context);
        return test!;
      },
      home: const HomePage(),
    );
  }
}
