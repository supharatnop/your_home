import 'package:flutter/material.dart';
import 'package:home_demo/components/com_color.dart';
import 'package:home_demo/components/com_font_style.dart';
import 'package:home_demo/features/post/detail_screen.dart';
import 'package:home_demo/features/sale/sale_screen.dart';
import 'package:home_demo/models/data_home_screen_model.dart';

class MyPostHomePage extends StatefulWidget {
  const MyPostHomePage({super.key});

  @override
  State<MyPostHomePage> createState() => _MyPostHomePageState();
}

class _MyPostHomePageState extends State<MyPostHomePage> {
  bool onOpen = false;

  List<HomeHomeScreenModel> home = [];

  @override
  void initState() {
    super.initState();
    home = dataHomeScreen.home;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: onOpen == false
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: comPrimaryColor),
                  borderRadius: BorderRadius.circular(100)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SaleScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                size: 24,
                color: comPrimaryColor,
              ),
            )
          : null,
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 23),
        child: Column(
          children: [
            const SizedBox(height: 12),
            onOpen == false ? closeBtn() : openBtn(),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: home.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(home[index].id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        home.removeAt(index);
                      });
                    },
                    background: Container(
                      color: comSecondaryColor,
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 21),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                              size: 24,
                            ),
                            Text(
                              "Remove",
                              style: ComFontStyle.medium14
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        if (onOpen == true)
                          Checkbox(
                            value: home[index].selectDel,
                            onChanged: (value) {
                              List<HomeHomeScreenModel> selectHome = home.map(
                                (e) {
                                  if (e.id == home[index].id) {
                                    return e.copyWith(selectDel: value);
                                  } else {
                                    return e;
                                  }
                                },
                              ).toList();
                              setState(() {
                                home = selectHome;
                              });
                            },
                          ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailScreen(),
                              ),
                            ),
                            child: Card(
                              margin: EdgeInsets.zero,
                              color: Colors.white,
                              elevation: 0,
                              shape: const Border(
                                  bottom: BorderSide(
                                      width: 1, color: comPrimaryColor)),
                              child: ListTile(
                                leading: Image.asset(
                                  home[index].image,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  home[index].name,
                                  style: ComFontStyle.medium16
                                      .copyWith(color: comPrimaryColor),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ที่อยู่ :${home[index].location}',
                                      style: const TextStyle(
                                          color: comPrimaryColor),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      'วันที่โพสต์ :',
                                      style: TextStyle(color: comPrimaryColor),
                                    ),
                                  ],
                                ),
                                isThreeLine: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget openBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              home =
                  home.where((element) => element.selectDel == false).toList();

              if (home.isEmpty) {
                onOpen = !onOpen;
              }
            });
          },
          child: Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2, color: comPrimaryColor)),
            child: const Icon(
              Icons.delete_outline,
              color: comPrimaryColor,
              size: 22,
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {
            setState(() {
              onOpen = !onOpen;
            });
          },
          child: Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2, color: comPrimaryColor)),
            child: const Icon(
              Icons.cancel_outlined,
              color: comPrimaryColor,
              size: 18,
            ),
          ),
        )
      ],
    );
  }

  Align closeBtn() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          setState(() {
            onOpen = !onOpen;
          });
        },
        child: Container(
          width: 43,
          height: 43,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 2, color: comPrimaryColor)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete_outline,
                color: comPrimaryColor,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
