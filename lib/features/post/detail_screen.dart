import 'package:flutter/material.dart';
import 'package:home_demo/components/com_app_bar.dart';
import 'package:home_demo/components/com_carousel_image.dart';
import 'package:home_demo/components/com_color.dart';
import 'package:home_demo/components/com_font_style.dart';
import 'package:home_demo/components/com_shape_circle.dart';
import 'package:home_demo/components/com_shape_circle_location.dart';
import 'package:home_demo/features/sale/edit_sale_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  String textDetail =
      "ทาวน์เฮ้าส์ชั้นเดียว หมู่บ้านพฤกษา 3 ซอยวัดลาดปลาดุก แปลงมุมแต่งใหม่ สวยพร้อมอยู่ทำเลดี ซอย 22/2 ราคาประเมินสูงกู้ได้ 100% \n* หลังมุม พื้นที่ 34 ตร.ว. ฟังก์ชัน 3 นอน 2 น้ำ 2 ที่จอดรถ ต่อเติมครบ มีเทอเรซด้านข้าง \n* โครงการอยู่ในซอยวัดลาดปลาดุกใกล้เซเว่น, โลตัส. ธนาคาร, ตลาดสด เซ็นทรัลเวสท์เกตและสถานีรถไฟฟ้าสายสีม่วง สถานี (ตลาดบางใหญ่) \n* มีรถตู้ รถเมล์ไปตลาดบางใหญ่และตลาดบางบัวทอง";

  List<String> imagePaths = [
    "assets/images/homes/home_1.jpg",
    "assets/images/homes/home_2.jpg",
    "assets/images/homes/home_3.jpg",
  ];

  List<String> plan = [
    "assets/images/homes/plan_1.jpeg",
    "assets/images/homes/plan_2.jpeg"
  ];

  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: comPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: comPrimaryColor,
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: comPrimaryColor),
            borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditSaleScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.edit,
          size: 24,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ComAppbar(
                onPop: () => Navigator.pop(context),
                text: "รายละเอียด",
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Text(
                          textDetail,
                          style: ComFontStyle.regular14,
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "ข้อมูลบ้าน",
                          style: ComFontStyle.medium16,
                        ),
                        const SizedBox(height: 24),
                        const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ComShapeCircle(
                                  text: "2 ห้องนอน",
                                  icon: Icon(
                                    Icons.bed_outlined,
                                    size: 24,
                                    color: comPrimaryColor,
                                  ),
                                ),
                                ComShapeCircle(
                                  text: "3 ห้องน้ำ",
                                  icon: Icon(
                                    Icons.shower_outlined,
                                    size: 24,
                                    color: comPrimaryColor,
                                  ),
                                ),
                                ComShapeCircle(
                                  text: "2 คัน",
                                  icon: Icon(
                                    Icons.garage_outlined,
                                    size: 24,
                                    color: comPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 21),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ComShapeCircle(
                                  text: "32 ตารางวา",
                                  icon: Icon(
                                    Icons.crop_square_outlined,
                                    size: 24,
                                    color: comPrimaryColor,
                                  ),
                                ),
                                ComShapeCircle(
                                  text: "1 ไร่ 1 งาน 0 ตารางวา",
                                  icon: Icon(
                                    Icons.fence_outlined,
                                    size: 24,
                                    color: comPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "แปลนบ้าน",
                          style: ComFontStyle.medium16,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Column(
                            children: [
                              Expanded(
                                  child: ComCarouselImage(
                                      pageController: pageController,
                                      imagePaths: plan)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "รูปภาพ",
                          style: ComFontStyle.medium16,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Column(
                            children: [
                              Expanded(
                                  child: ComCarouselImage(
                                      pageController: pageController,
                                      imagePaths: imagePaths)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "ทำเลที่ตั้ง",
                          style: ComFontStyle.medium16,
                        ),
                        const SizedBox(height: 24),
                        const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ComShapeCircleLocation(
                                  titleText: "1.8",
                                  detailText: "โรงพญาบาล",
                                ),
                                ComShapeCircleLocation(
                                  titleText: "1.2",
                                  detailText: "โรงเรียน",
                                ),
                                ComShapeCircleLocation(
                                  titleText: "1.3",
                                  detailText: "ห้างดัง",
                                ),
                              ],
                            ),
                            SizedBox(height: 21),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ComShapeCircleLocation(
                                  titleText: "2.0",
                                  detailText: "ตลาด",
                                ),
                                ComShapeCircleLocation(
                                  titleText: "0.5",
                                  detailText: "สวนสาธารณะ",
                                ),
                                ComShapeCircleLocation(
                                  titleText: "0.8",
                                  detailText: "คาเฟ่",
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "Map",
                          style: ComFontStyle.medium16,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border:
                                Border.all(width: 1, color: comPrimaryColor),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "ราคา",
                          style: ComFontStyle.medium16,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "1,500,000 บาท",
                          style: ComFontStyle.medium18,
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "ติดต่อสอบถาม",
                          style: ComFontStyle.medium16,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone_android_outlined,
                              size: 24,
                              color: comPrimaryColor,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Text(
                              "0801234567",
                              style: ComFontStyle.regular16,
                            )
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            const Icon(
                              Icons.chat_bubble_outline,
                              size: 24,
                              color: comPrimaryColor,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Text(
                              "ID LINE",
                              style: ComFontStyle.regular16,
                            )
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            const Icon(
                              Icons.facebook_outlined,
                              size: 24,
                              color: comPrimaryColor,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Text(
                              "Facebook",
                              style: ComFontStyle.regular16,
                            )
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            const Icon(
                              Icons.mail_outline,
                              size: 24,
                              color: comPrimaryColor,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Text(
                              "yourhome.home@mail.com",
                              style: ComFontStyle.regular16,
                            )
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
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
