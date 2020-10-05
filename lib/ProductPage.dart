import 'package:flutter/material.dart';
import 'ProdCart.dart';
import 'barket_rupee_icons.dart';
import 'back_button_s_v_g_icons.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key, this.catagory,this.title, this.imageID}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  String catagory;
  int imageID;
  final String title;

  @override
  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  // Only global variable should be Declared here
  int itemColorID = 1;

  //
  AnimationController startupController;
  SequenceAnimation startup;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startupController = AnimationController(vsync: this);
    startup = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: Duration(
            milliseconds: 0,
          ) ,
        to: Duration(
          milliseconds: 500,
        ),
      tag: "startFade"
    )
        .animate(startupController);
    startupController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every ti  me setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    String itemDisc =
        "Mintwud is a classic amalgamation of form and function. Crafted for compact homes, the range is clean and convenient and has an understated design aesthetic that adapts to any space. \n"
        "Modern is a distinct, defined style which originated in the early 1900s. It uses a combination of vinyl, steel, plastic, glass or wood having monochromatic colors and sleek silhouettes. Modern furniture lives at the intersection of clean lines and relaxed comfort accentuating form and function. "
        "\nWriting Tables are a piece of furniture with a surface for writing on, with drawers and compartments for storing writing material. Writing Tables take up less space than computer desks. If you are looking for just a single table, writing desks are good to go. They are also advisable if you only use your laptop to check your social media every once in a while. Computer desks are usually bulkier.";
    Widget itemDetails(String title, String info) {
      return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.only(
                left: 30,
                top: 10,
                bottom: 0,
              ),
              child: new Text(
                "$title$info",
                style: TextStyle(fontFamily: 'Alatas', fontSize: 15),
              )));
    }

    void setItemID(int x) {
      setState(() {
        itemColorID = x;
      });
    }

    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: height * 0.6,
              width: width,
              child: Hero(
                  tag: widget.imageID,
                  child: new Image.asset(
                    "assets/${widget.catagory}/${widget.imageID}.png",
                    fit: BoxFit.fill,
                  ))),
          Positioned(
            top: 25,
            left: 20,
            child: Container(
              height: 60,
              width: 60,
              child: Tab(
                icon: Icon(BackButtonSVG.camera_back,
                    color: Colors.white,
                    size:
                        50), //color should be //color:Color.fromRGBO(252, 182, 68, 1)
              ),
            ),
          ),
          Positioned(
            top: height * 0.12,
            child: new Container(
              padding: EdgeInsets.only(left: 20),
              child: new Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        "sofa",
                        style: TextStyle(
                            fontFamily: "Atana",
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        "Hayao",
                        style: TextStyle(
                            fontFamily: "Atana",
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.40,
            right: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Container(
//                height: 50,
                color: Colors.grey.withOpacity(0.7),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Tab(
                          icon: Icon(
                            BarketRupee.rupee,
                            color: Colors.white,
                          ),
                        ),
                        new Text(
                          " 10,000",
                          style: TextStyle(
                              fontFamily: "Atana",
                              fontSize: 35,
                              color: Colors.white),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Positioned(
              top: height * 0.40,
              left: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Container(
                  height: 70,
                  width: 70,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white, width: 3),
                      ),
                      onPressed: () {},
                      color: Colors.grey.withOpacity(0.7),
                      child: Tab(
                        icon: Icon(
                          BarketRupee.basket,
                          color: Colors.white,
                          size: 35,
                        ),
                      )),
                ),
              )),
          AnimatedBuilder(
            animation: startupController,
            builder: (context,child)=>
            Opacity(
              opacity: startup["startFade"].value,
              child: DraggableScrollableSheet(
                initialChildSize: 0.50,
                minChildSize: 0.50,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      child: new Container(
                          width: width,
                          //height: height*0.50,
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 30, top: 20, bottom: 0),
                                      child: new Text(
                                        "Colors",
                                        style: TextStyle(
                                            fontFamily: 'Alatas', fontSize: 20),
                                      ))),
                              Container(
                                margin: EdgeInsets.only(bottom: 25, top: 15),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(100)),
                                      child: GestureDetector(
                                        onTap: () {
                                          setItemID(1);
                                          print("id: 1");
                                        },
                                        child: new Container(
                                            child: Opacity(
                                              opacity: (itemColorID == 1) ? 1 : 0,
                                              child: Tab(
                                                icon: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                            height: 50,
                                            width: 50,
                                            color: Color.fromRGBO(252, 182, 68, 1)),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(100)),
                                      child: GestureDetector(
                                        onTap: () {
                                          setItemID(2);
                                        },
                                        child: new Container(
                                            child: Opacity(
                                              opacity: (itemColorID == 2) ? 1 : 0,
                                              child: Tab(
                                                icon: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                            height: 50,
                                            width: 50,
                                            color:
                                                Color.fromRGBO(234, 239, 242, 1)),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(100)),
                                      child: GestureDetector(
                                        onTap: () {
                                          setItemID(3);
                                        },
                                        child: new Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromRGBO(82, 85, 100, 1),
                                          child: Opacity(
                                            opacity: (itemColorID == 3) ? 1 : 0,
                                            child: Tab(
                                              icon: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(100)),
                                      child: GestureDetector(
                                        onTap: () {
                                          setItemID(4);
                                        },
                                        child: new Container(
                                            child: Opacity(
                                              opacity: (itemColorID == 4) ? 1 : 0,
                                              child: Tab(
                                                icon: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                            height: 50,
                                            width: 50,
                                            color: Color.fromRGBO(55, 123, 132, 1)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 30, top: 10, bottom: 0),
                                      child: new Text(
                                        "Discription",
                                        style: TextStyle(
                                            fontFamily: 'Alatas', fontSize: 20),
                                      ))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 30, top: 20, bottom: 0, right: 10),
                                      child: new Text(
                                        itemDisc,
                                        style: TextStyle(
                                            fontFamily: 'Alatas', fontSize: 15),
                                      ))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 30, top: 20, bottom: 0),
                                      child: new Text(
                                        "Details",
                                        style: TextStyle(
                                            fontFamily: 'Alatas', fontSize: 20),
                                      ))),
                              itemDetails("Brand: ", "Mintwud"),
                              itemDetails("Dimensions: ",
                                  "H 29 X W 48 X D 24 (All dimension in inches)"),
                              itemDetails("Weight: ", "28 KG"),
                              itemDetails("Assembly: ", "Carpenter Assembly"),
                              itemDetails("Warranty:", " 12 Months' Warranty"),
                              itemDetails("Primary Material: ", "Engineered Wood"),
                              itemDetails("Collection: ", "Hayao"),
                              itemDetails("Sku: ", "FN1680114-P-WH5046"),
                              new Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      child: Container(
                                        height: 55,
                                        width: 150,
                                        child: new MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      252, 182, 68, 1),
                                                  width: 3),
                                            ),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder:(context)=> ProdCart(imageID: widget.imageID,),)
                                              );
                                            },
                                            color: Colors.white,
                                            child: new Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      252, 182, 68, 1),
                                                  fontFamily: 'Alatas',
                                                  fontSize: 20),
                                            )),
                                      ),
                                    ),
                                    new ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      child: Container(
                                        width: 150,
                                        height: 55,
                                        child: new MaterialButton(
                                            onPressed: () {
                                              print("doneHere");
                                            },
                                            color: Color.fromRGBO(252, 182, 68, 1),
                                            child: new Text(
                                              "BUY NOW !!",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Alatas',
                                                  fontSize: 18),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              )

//                          Brand: Mintwud
//                          Dimensions: H 29 X W 48 X D 24 (All dimension in inches)
//                          Weight: 28 KG
//                          Warranty: 12 Months' Warranty
//                          Assembly: Carpenter Assembly
//                          Primary Material: Engineered Wood
//                          Collection: Hayao
//                          Sku: FN1680114-P-WH5046
                            ],
                          )),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
