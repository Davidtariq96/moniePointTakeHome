import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical: 20),
      // width: 50,
      // height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/image6.jpg",
        ),fit: BoxFit.cover)
      ),
      child: buildPadding("#FASHION DAY","80% OFF","Discover fashion that suits to \n your style"),
    );
  }

}
Padding buildPadding(String title, String subTitle,String heading) {
  return Padding(
    padding: const EdgeInsets.only(left: 15,top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title,style: GoogleFonts.roboto(fontWeight: FontWeight.bold),),
        Text(subTitle,style: GoogleFonts.acme(fontSize: 40),),
        Text(heading,style: GoogleFonts.acme(color: Colors.black38),),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black
            ),
            child: const Text("Check this out",style: TextStyle(color: Colors.white),),
          ),
        )
      ],
    ),
  );
}
