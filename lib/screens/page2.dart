import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/screens/page1.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
     return Container(
       padding:EdgeInsets.symmetric(vertical: 20),
      // width: 50,
      // height: 100,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/image2.jpg",
          ),fit: BoxFit.cover),
      ),
       child:  buildPadding("#BEAUTY SALE","80% OFF","Discover our beauty selection \n your style"),
    );
  }
}
