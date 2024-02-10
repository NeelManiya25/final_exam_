import 'package:final_exam_online_shoping/modules/hleper/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../model/signupmodel.dart';
import '../../../utils/global.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? s_email;
  String? s_pass;
  TextEditingController s_email_c = TextEditingController();
  TextEditingController s_pass_c = TextEditingController();

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
                  "Create your",
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
                  controller: s_email_c,
                  onSaved: (val) {
                    s_email = val!;
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
                  controller: s_pass_c,
                  onSaved: (val) {
                    s_pass = val!;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Color(0xff789461),
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
                  height: 70,
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      SignUp_model data = SignUp_model(
                        s_email: s_email!,
                        s_pass: s_pass!,
                      );

                      Map<String, dynamic> res =
                          await Auth_Helper.auth_helper.signUp(data: data);

                      if (res['user'] != null) {
                        Get.offNamedUntil('/login', (routes) => false);
                      }
                      s_pass_c.clear();
                      s_email_c.clear();
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
                      "Create an account",
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
                      "Alrady a member? ",
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontSize: 15,
                        color: Color(0xff789461),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Get.back();
                      },
                      child: Text(
                        "Log in",
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontSize: 15,
                          color: Color(0xff789461),
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
