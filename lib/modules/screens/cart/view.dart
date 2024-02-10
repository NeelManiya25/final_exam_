import 'package:flutter/material.dart';

import '../../model/categorymodel.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Catagory_Model? data =
        ModalRoute.of(context)!.settings.arguments as Catagory_Model?;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Bag",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
