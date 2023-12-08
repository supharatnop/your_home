import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_demo/components/com_button.dart';
import 'package:home_demo/components/com_color.dart';
import 'package:home_demo/components/com_font_style.dart';
import 'package:home_demo/components/com_text_formfield.dart';
import 'package:home_demo/features/authentication/signup_screen.dart';
import 'package:home_demo/features/home/home_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: comPrimaryColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    color: comSecondaryColor, shape: BoxShape.circle),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const ComTextFormField(
                      hintText: "username",
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        size: 24,
                        color: comPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const ComTextFormField(
                      hintText: "password",
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: 24,
                        color: comPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ComButton(
                      textButton: const Text("เข้าสู้ระบบ"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'คุณได้เป็นสมาชิกหรือไม่ ?',
                style: ComFontStyle.regular16.copyWith(
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: ' สมัครสมาชิก',
                    style: ComFontStyle.regular16.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()),
                        );
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
