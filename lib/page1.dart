import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(image: AssetImage("assets/images/image2.jpg",
        ),fit: BoxFit.cover)
      ),
    );
  }
}
