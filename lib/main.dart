import 'package:flutter/material.dart';
import 'package:home_demo/components/com_color.dart';
import 'package:home_demo/components/com_font_style.dart';
import 'package:home_demo/features/authentication/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Kanit',
        textTheme: TextTheme(labelLarge: ComFontStyle.medium16),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: comPrimaryColor,
        ),
      ),
      home: const SigninScreen(),
    );
  }
}
