import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_demo/components/com_app_bar.dart';
import 'package:home_demo/components/com_button.dart';
import 'package:home_demo/components/com_color.dart';
import 'package:home_demo/components/com_dialog.dart';
import 'package:home_demo/components/com_font_style.dart';
import 'package:home_demo/components/com_text_formfield.dart';
import 'package:home_demo/components/com_validator.dart';
import 'package:home_demo/features/authentication/new_password_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final formKeyEmail = GlobalKey<FormState>();
  TextEditingController? emailController = TextEditingController();
  static const maxScond = 60;
  int seconds = maxScond;
  Timer? tiemr;

  @override
  void initState() {
    super.initState();
    // countdown();
  }

  void countdown() {
    tiemr = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: comPrimaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ComAppbar(
                text: "ยืนยัน OTP",
                onPop: () => Navigator.pop(context),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, bottom: 32, top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "OTP จะถูกส่งไปยัง",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: comPrimaryColor),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "arita_a@mail.com",
                            style: ComFontStyle.medium18,
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                              color: comTertiaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                comDialog(
                                  context: context,
                                  title: "เปลี่ยนอีเมลล์",
                                  body: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: Form(
                                      key: formKeyEmail,
                                      child: Column(
                                        children: [
                                          ComTextFormField(
                                            controller: emailController,
                                            lable:
                                                "เปลี่ยนที่อยู่อีเมลล์เพื่อส่ง OTP",
                                            hintText: "e-mail",
                                            validator: ValidatorText.validator(
                                                "Please enter email"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  textCancelBtn: "ยกเลิก",
                                  onPressedCancelBtn: () =>
                                      Navigator.pop(context),
                                  textOKBtn: "เปลี่ยน",
                                  onPressedOKBtn: () => Navigator.pop(context),
                                );
                              },
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: comPrimaryColor,
                                size: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 21),
                      Text(
                        "กรุณากรอก OTP ที่ได้จากอีเมลล์เพื่อทำการตั้งรหัสผ่านใหม่",
                        style: ComFontStyle.light14,
                      ),
                      const SizedBox(height: 15),
                      Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 70,
                              child: ComTextFormField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                onSaved: (pin1) {},
                                onChanged: (p0) {
                                  if (p0.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 70,
                              child: ComTextFormField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                onSaved: (pin2) {},
                                onChanged: (p0) {
                                  if (p0.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 70,
                              child: ComTextFormField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                onSaved: (pin3) {},
                                onChanged: (p0) {
                                  if (p0.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 70,
                              child: ComTextFormField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                onSaved: (pin4) {},
                                onChanged: (p0) {
                                  if (p0.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 70,
                              child: ComTextFormField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                onSaved: (pin5) {},
                                onChanged: (p0) {
                                  if (p0.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 70,
                              child: ComTextFormField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                onSaved: (pin6) {},
                                onChanged: (p0) {
                                  if (p0 == "") {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 27),
                      ComButton(
                        textButton: "ตกลง",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewPasswordScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 41),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            // Text(
                            //   "OTP จะหมดอายุใน $seconds วินาที",
                            //   style: ComFontStyle.light16,
                            // ),
                            // const SizedBox(height: 6),
                            Text(
                              "ยังไม่ได้รับ OTP ?",
                              style: ComFontStyle.light14,
                            ),
                            TextButton(
                              onPressed: () {
                                // countdown();
                              },
                              child: Text(
                                "ส่งใหม่",
                                style: ComFontStyle.medium14.copyWith(
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
