import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/global.dart';

class intropage extends StatefulWidget {
  intropage({super.key});

  @override
  State<intropage> createState() => _intropageState();
}

class _intropageState extends State<intropage> {
  final List pages = [
    {
      'image':
          'assets/images/online-shopping-trolley-click-and-collect-order-logo-design-template-vector.jpg',
      'title': 'Welcome to Super Store',
      'description':
          'Ecommerce is a method of buying and selling goods and services online. The definition of ecommerce business can also include tactics like affiliate marketing. '
    },
    {
      'image':
          'assets/images/online-shopping-trolley-click-and-collect-order-logo-design-template-vector.jpg',
      'title': 'Explore Features',
      'description':
          'You can use ecommerce channels such as your own website, an established selling website like Amazon, or social media to drive online sales.'
    },
    {
      'image':
          'assets/images/online-shopping-trolley-click-and-collect-order-logo-design-template-vector.jpg',
      'title': 'Get Started',
      'description': 'Let\'s get started!'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          PageView.builder(
            controller: Global.pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                Global.currentPageIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: Get.height * 0.5,
                    width: Get.width * 0.5,
                    child: Image.asset(
                      pages[index]['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Text(pages[index]['title'],
                      style: GoogleFonts.robotoSlab(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff789461),
                      )),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      pages[index]['description'],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoSlab(
                        fontSize: 16.0,
                        color: Color(0xff789461),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 50.0,
            right: 160.0,
            child: Row(
              children: [
                for (int i = 0; i < pages.length; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == Global.currentPageIndex
                          ? Color(0xff000000)
                          : Color(0xff789461),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 25.0,
            right: 16.0,
            child: (Global.currentPageIndex == pages.length - 1)
                ? TextButton(
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setBool("isIntroVisited", true);
                      Get.offNamed("/login");
                    },
                    child: Text(
                      "Done",
                      style: GoogleFonts.robotoSlab(
                          color: Color(0xff789461),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ))
                : IconButton(
                    onPressed: () {
                      Global.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
