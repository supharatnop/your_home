import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_demo/components/com_app_bar.dart';
import 'package:home_demo/components/com_button.dart';
import 'package:home_demo/components/com_color.dart';
import 'package:home_demo/components/com_font_style.dart';
import 'package:home_demo/components/com_text_formfield.dart';
import 'package:home_demo/components/com_validator.dart';
import 'package:image_picker/image_picker.dart';

class EditSaleScreen extends StatefulWidget {
  const EditSaleScreen({super.key});

  @override
  State<EditSaleScreen> createState() => EditSaleScreenState();
}

class EditSaleScreenState extends State<EditSaleScreen> {
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  List<XFile> listImageDetail = [];
  List<XFile> listPlanImage = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: comPrimaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ComAppbar(
                text: "แก้ไขข้อมูลการขาย",
                onPop: () => Navigator.pop(context),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            "ภาพรายละเอียด (สูงสุด 6 ภาพ)",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: (itemWidth / itemHeight),
                            ),
                            itemCount: listImageDetail.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Card(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        width: double.infinity,
                                        height: 100,
                                        child: Image.file(
                                          File(listImageDetail[index].path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          listImageDetail.removeAt(index);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: comSecondaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          ComButton(
                            textButton: "เพิ่มรูปภาพ",
                            onPressed: listImageDetail.length > 5
                                ? null
                                : () async {
                                    final List<XFile> photo =
                                        await _picker.pickMultiImage();
                                    if (photo.isNotEmpty) {
                                      setState(() {
                                        listImageDetail.addAll(photo);
                                      });
                                    }
                                  },
                          ),
                          const SizedBox(height: 26),
                          Text(
                            "ทำเลที่ตั้ง",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          ComTextFormField(
                            hintText: "บ้านเลขที่, ซอย, หมู่, ถนน",
                            validator:
                                ValidatorText.validator("Please enter text"),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "จังหวัด",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "อำเภอ",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ตำบล",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "รหัสไปรษณีย์",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 26),
                          Text(
                            "สถานที่ใกล้เคียงที่สำคัญ (สูงสุด 6 สถานที่)",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ชื่อสถานที่",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ระยะทาง (กม.)",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            children: [
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ชื่อสถานที่",
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ระยะทาง (กม.)",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            children: [
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ชื่อสถานที่",
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ระยะทาง (กม.)",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 26),
                          Text(
                            "ที่ตั้งตาม Google Map",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ละติจูด",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: ComTextFormField(
                                    hintText: "ลองจิจูด",
                                    validator: ValidatorText.validator(
                                        "Please enter text")),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 158,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: comPrimaryColor),
                                borderRadius: BorderRadius.circular(13)),
                            child: const Center(
                              child: Text("Map"),
                            ),
                          ),
                          const SizedBox(height: 26),
                          Text(
                            "ข้อมูลบ้าน",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ห้องนอน",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "ห้องน้ำ",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ComTextFormField(
                                  hintText: "จอดรถ(คัน)",
                                  validator: ValidatorText.validator(
                                      "Please enter text"),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          const SizedBox(height: 26),
                          Text(
                            "พื้นที่ใช้สอย",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                  child: ComTextFormField(
                                hintText: "ไร่",
                                validator: ValidatorText.validator(
                                    "Please enter text"),
                              )),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                  child: ComTextFormField(
                                hintText: "งาน",
                                validator: ValidatorText.validator(
                                    "Please enter text"),
                              )),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                  child: ComTextFormField(
                                hintText: "ตารางวา",
                                validator: ValidatorText.validator(
                                    "Please enter text"),
                              ))
                            ],
                          ),
                          const SizedBox(height: 26),
                          Text(
                            "พื้นที่ทั้งหมด",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                  child: ComTextFormField(
                                hintText: "ไร่",
                                validator: ValidatorText.validator(
                                    "Please enter text"),
                              )),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                  child: ComTextFormField(
                                hintText: "งาน",
                                validator: ValidatorText.validator(
                                    "Please enter text"),
                              )),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                  child: ComTextFormField(
                                hintText: "ตารางวา",
                                validator: ValidatorText.validator(
                                    "Please enter text"),
                              ))
                            ],
                          ),
                          const SizedBox(height: 26),
                          Text(
                            "แปลน (สูงสุด 6 ภาพ)",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: (itemWidth / itemHeight),
                            ),
                            itemCount: listPlanImage.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Card(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        width: double.infinity,
                                        height: 100,
                                        child: Image.file(
                                          File(listPlanImage[index].path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          listPlanImage.removeAt(index);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: comSecondaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          ComButton(
                            textButton: "เพิ่มแปลนบ้าน",
                            onPressed: listPlanImage.length > 5
                                ? null
                                : () async {
                                    final List<XFile> photo =
                                        await _picker.pickMultiImage();
                                    if (photo.isNotEmpty) {
                                      setState(() {
                                        listPlanImage.addAll(photo);
                                      });
                                    }
                                  },
                          ),
                          const SizedBox(height: 26),
                          Text(
                            "ราคา",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          ComTextFormField(
                            hintText: "ราคา (บาท)",
                            validator:
                                ValidatorText.validator("Please enter text"),
                          ),
                          const SizedBox(height: 26),
                          Text(
                            "รายละเอียดเพิ่มเติม",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          ComTextFormField(
                              maxLines: 3,
                              hintText: "รายละเอียดเพิ่มเติม",
                              validator:
                                  ValidatorText.validator("Please enter text")),
                          const SizedBox(height: 26),
                          Text(
                            "ข้อมูลติดต่อ",
                            style: ComFontStyle.medium16,
                          ),
                          const SizedBox(height: 24),
                          ComTextFormField(
                            hintText: "เบอร์โทร",
                            validator:
                                ValidatorText.validator("Please enter text"),
                          ),
                          const SizedBox(height: 12),
                          ComTextFormField(
                            hintText: "อีเมลล์",
                            validator:
                                ValidatorText.validator("Please enter text"),
                          ),
                          const SizedBox(height: 12),
                          ComTextFormField(
                            hintText: "LINE",
                            validator:
                                ValidatorText.validator("Please enter text"),
                          ),
                          const SizedBox(height: 12),
                          ComTextFormField(
                            hintText: "Facebook",
                            validator:
                                ValidatorText.validator("Please enter text"),
                          ),
                          const SizedBox(height: 26),
                          ComButton(
                            textButton: "บันทึก",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
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
