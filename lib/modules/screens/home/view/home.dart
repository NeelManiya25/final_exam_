import 'package:final_exam_online_shoping/modules/hleper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/categorymodel.dart';
import '../../../utils/global.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Container(
        color: Color(0xffFFFFFF),
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 150,
                ),
                CircleAvatar(
                  radius: 100,
                  foregroundImage: AssetImage(
                    "assets/images/pexels-chloe-1043474.jpg",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "neelmaniya@gmail.com",
                  style: Global.size10,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Explore",
                  style: Global.size17black,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Vapes",
                  style: Global.size17black,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Your order",
                  style: Global.size17black,
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamedUntil('/login', (route) => false);
                  },
                  child: Text(
                    "Logout",
                    style: Global.size12red,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Snapdeal"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
          CircleAvatar(
            child: Image.asset(""),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: FutureBuilder(
        future: Api_Helper.api.fetchCatagory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Catagory_Model>? catagory = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: catagory!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 200,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (ctx, i) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                '/detail',
                                arguments: catagory![i],
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child:
                                        Image.network("${catagory[i].image}"),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "${catagory[i].category}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
