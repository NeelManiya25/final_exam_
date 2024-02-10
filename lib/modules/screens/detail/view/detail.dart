import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/categorymodel.dart';
import '../../../utils/global.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Catagory_Model? data =
        ModalRoute.of(context)!.settings.arguments as Catagory_Model?;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.favorite_border),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.share),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * .38,
              width: w,
              child: Image.network("${data?.image}"),
            ),
            Text(
              "${data?.category}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "${data?.title}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff789461),
              ),
            ),
            Text(
              "${data?.description}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff999999),
              ),
            ),
            Text(
              "\$ ${data?.price}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff789461)),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/cart');
              },
              child: Container(
                height: h * .07,
                width: w,
                decoration: BoxDecoration(
                  color: Color(0xff789461),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Add to bag",
                  style: Global.size16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
