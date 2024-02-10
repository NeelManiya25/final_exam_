import 'package:final_exam_online_shoping/modules/hleper/auth_helper.dart';
import 'package:final_exam_online_shoping/modules/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? pass;
  TextEditingController email_c = TextEditingController();
  TextEditingController pass_c = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/online-shopping-trolley-click-and-collect-order-logo-design-template-vector.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Login your",
                  style: Global.gilory36,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "account",
                  style: Global.gilory36,
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Valid Password";
                    } else {
                      return null;
                    }
                  },
                  controller: email_c,
                  onSaved: (val) {
                    email = val!;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter email or phone number",
                    border: outlineInputBorder(),
                    enabledBorder: outlineInputBorder(),
                    focusedBorder: outlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Valid Password";
                    } else {
                      return null;
                    }
                  },
                  controller: pass_c,
                  onSaved: (val) {
                    pass = val!;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Color(0xff888888),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Password",
                    border: outlineInputBorder(),
                    enabledBorder: outlineInputBorder(),
                    focusedBorder: outlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamedUntil('/home', (routes) => false);
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
                      "Login",
                      style: Global.size16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    Map? res = await Auth_Helper.auth_helper.signInWithGoogle();

                    if (res['user'] != null) {
                      Get.offNamedUntil('/home', (routes) => false);
                    } else if (res['error'] != null) {
                      Get.snackbar("Flutter E-commerce", "Login Failed");
                    }
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
                      "Continue with GOOGLE",
                      style: Global.size16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? Please ",
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontSize: 15,
                        color: Color(0xff888888),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/signup');
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontSize: 15,
                          color: Color(0xff81AA66),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() =>
      OutlineInputBorder(borderSide: BorderSide(color: Color(0xff999999)));
}
