import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money/helpers/customTab.dart';
import 'package:money/model/productsModel.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../provider/products.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}



class _ProductDetailsState extends State<ProductDetails> {

  ProductsModel? productsModel;
  @override
  void initState() {
    // TODO: implement initState
    productsModel = Provider.of<Products>(context, listen: false).allProducts;
    // rows = userProvider.users.isEmpty ? 1 :user!.length;

    // getAccessToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:  InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: Colors.black54)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(CupertinoIcons.heart,color: Colors.black54),
                const SizedBox(width: 10,),
                const Icon(Icons.share,color: Colors.black54),
                const SizedBox(width: 10,),
                iconWidgets("23", Icon(Icons.lock,color: Colors.black54,))
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  decoration:  BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          buildContainer(productsModel?.image ?? ""),
                          SizedBox(height: 5,),
                          buildContainer("assets/images/image5.jpg"),
                          SizedBox(height: 5,),
                          buildContainer( productsModel?.image ?? ""),
                          SizedBox(height: 5,),
                          buildContainer("assets/images/image2.jpg"),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 3,
                          child: Image.asset(productsModel?.image ?? "",fit: BoxFit.cover,width: 400,height: 400,))
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                     Icon(Icons.sports_basketball,color: Colors.grey.shade500,),
                    const SizedBox(width: 5,),
                    Text("tokobaju.id",style: GoogleFonts.roboto(color: Colors.grey.shade500),)
                  ],
                ),
                const SizedBox(height: 25,),
                Text("Essentials Men's Short-Sleeve \nCrewneck T-Shirt",
                  style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star,
                          color: Color(0XFFF9A23B),),
                        Text("4.9 Ratings",
                            style: GoogleFonts.roboto(
                                fontSize: 13,
                                color: Colors.grey)),
                      ],
                    ),
                    dots(),
                    Text("2.3K+ Reviews",style: GoogleFonts.roboto(color: Colors.grey.shade400,fontWeight: FontWeight.bold),),
                    dots(),
                    Text("2.3K+ Reviews",style: GoogleFonts.roboto(color: Colors.grey.shade400,fontWeight: FontWeight.bold),),

                  ],
                ),
                const CustomTab(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   RichText(text: const TextSpan(
                     text: "Brand:  ",
                     style: TextStyle(color: Colors.black),
                     children: [
                       TextSpan(
                         text: "Zara",
                         style: TextStyle(color: Colors.grey)
                       )
                     ]
                   )),
                    RichText(text: const TextSpan(
                        text: "Color:  ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Blue",
                              style: TextStyle(color: Colors.grey)
                          )
                        ]
                    ))
                  ],
                ),
                const SizedBox(height: 20,),
                Text("Description",style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    dots(),
                    const SizedBox(width: 10,),
                    const Text("High quality material from the best"),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    dots(),
                    const SizedBox(width: 10,),
                    const Text("Good resale value in the market"),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    dots(),
                    const SizedBox(width: 10,),
                    const Text("High quality material from the best")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 100,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Price",style: GoogleFonts.roboto(color: Colors.grey.shade300,fontWeight: FontWeight.bold),),
                  Text("${productsModel?.amount ?? 0}",style:
                  GoogleFonts.roboto(color: const Color(0XFF4BB299),fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                   decoration: const BoxDecoration(
                     color: Color(0XFF49B399),
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )
                   ),
                    child: Row(
                      children: const [
                        Icon(Icons.lock,color: Colors.white,),
                        Text("1",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 25),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight:Radius.circular(5) ),
                      color: Color(0XFF2B2D40),
                    ),
                    child: const Text("Buy Now",style: TextStyle(color: Colors.white
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container dots() {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(50)),
    );
  }

  Container buildContainer(String image) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover)),
    );
  }
}
