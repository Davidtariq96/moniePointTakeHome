import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/page1.dart';
import 'package:money/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageViewController = PageController(initialPage: 0);
  final TextEditingController _controller = TextEditingController();
  // set the initial page you want to show
  int _activePage = 0;
  int _selectedIndex = 0;
  final List<Widget> _Pages = [
    Page1(),
    Page2(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageViewController.dispose();  // dispose the PageController
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        // height: 70,
                        width: MediaQuery.of(context).size.width /1.5,
                        decoration: BoxDecoration(
                            color:  Colors.transparent,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType:TextInputType.text,
                          controller: _controller,
                          onTap: (){},
                          style: const TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            isDense: true,
                            hintStyle: const TextStyle(
                                color: CupertinoColors.systemGrey3,
                                fontFamily: 'PushPenny',
                                fontSize: 23.0,
                                fontWeight: FontWeight.w400),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xffE6E7E9)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xffE6E7E9)),
                            ),
                            labelText: '',
                            prefixIcon:  Icon(Icons.search,size: 30,color: Colors.grey.shade400,),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.red)),
                            errorBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(8),
                                borderSide:
                                BorderSide(color: Colors.red)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xffE6E7E9))),
                            hintText: "Search...",
                          ),
                        ),
                      ),
                    ),
                    iconWidgets("1",const Icon(Icons.lock,color: Colors.black54,),),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: iconWidgets("9+",const Icon(Icons.message,color: Colors.black54),),
                    ),
                  ],
                ),
                SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height /3,
                child:Stack(
                  children: [
                    PageView.builder(
                        controller: _pageViewController,
                        onPageChanged: (int index){
                          setState(() {
                            _activePage = index;
                          });
                        },
                        itemCount: _Pages.length,
                        itemBuilder: (BuildContext context, int index){
                          return _Pages[index];
                        }
                    ),
                    //creating dots at bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                            _Pages.length,
                                (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: InkWell(
                                onTap: () {
                                  _pageViewController.animateToPage(index,
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: Container(
                                  width: _activePage == index ? 20 : 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: _activePage == index ? Colors.black
                                        : Colors.grey.shade600,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                )
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              )

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedIconTheme: IconThemeData(color:Color(0XFF49B399),),
        selectedItemColor:  Colors.black87,
        items:   const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:  FaIcon(
             Icons.home_filled
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:  FaIcon(
                Icons.border_all_outlined
            ),
            label: 'Voucher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  SizedBox iconWidgets(String amount, Widget icon) {
    return SizedBox(
      height: 30,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          icon,
          Positioned(
              top: 0,
              left: 13,
              child: Container(
                width: 23,
               height: 17,
               // padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                decoration: BoxDecoration(
                    color: Color(0XFFE65986),
                    borderRadius: BorderRadius.circular(3)),
                child:  Center(
                  child: Text(
                    amount,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontFamily: "PushPenny"),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
