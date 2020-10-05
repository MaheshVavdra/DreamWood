import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_less_cart_icons.dart';

class ProdCart extends StatefulWidget {
  int imageID;
  ProdCart({Key key, this.imageID}) : super(key: key);
  ProdCartState createState() => ProdCartState();
}

class ProdCartState extends State<ProdCart> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget cartProducts(int index) {
      return new Container(
        margin: EdgeInsets.only(top: 10),
        width: width - 50,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.transparent,
        ),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: width - 100,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  margin: EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 65, top: 25),
                        child: new Text(
                          "Morden Sofa",
                          style: TextStyle(
                              color: Color.fromRGBO(91, 80, 78, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Atana"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 65, top: 6),
                        child: new Text(
                          "Style: Classic",
                          style: TextStyle(
                              color: Color.fromRGBO(91, 80, 78, 1),
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Atana"),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(left: 65, top: 6),
                        width: 100,
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      blurRadius: 30.0, // soften the shadow
                                      spreadRadius: 3.0, //extend the shadow
                                      offset: Offset(
                                        5.0, // Move to right 10  horizontally
                                        8.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ]),
                              child: Icon(
                                AddLessCart.add,
                                color: Colors.black.withOpacity(0.8),
                                size: 12,
                              ),
                            ),
                            Text(
                              "1",
                              style:
                                  TextStyle(fontFamily: "Atana", fontSize: 20),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      blurRadius: 30.0, // soften the shadow
                                      spreadRadius: 3.0, //extend the shadow
                                      offset: Offset(
                                        5.0, // Move to right 10  horizontally
                                        8.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Icon(
                                  AddLessCart.minus,
                                  color: Colors.black.withOpacity(0.8),
                                  size: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset("assets/Chairs/${index}.png")),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    margin: EdgeInsets.only(left: 55, top: 6),
                    child: new Text(
                      "Rs. 15,000",
                      style: TextStyle(
                          color: Color.fromRGBO(91, 80, 78, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Atana"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: height * 0.13,
                  left: 20,
                  child: new Text("My Cart",
                      style: TextStyle(
                          fontFamily: "Atana",
                          fontSize: 40,
                          color: Color.fromRGBO(91, 80, 78, 1),
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
            ),
            width: width,
            child: DraggableScrollableSheet(
              initialChildSize: 0.80,
              minChildSize: 0.80,
              maxChildSize: 0.80,
              builder: (context, scrollController) {
                return new SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        cartProducts(widget.imageID),
                        cartProducts(2),
                        cartProducts(2),
                        Container(
                            margin:
                                EdgeInsets.only(left: width * 0.40, top: 20),
                            width: 140,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Order",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Atana",
                                      fontWeight: FontWeight.w300),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Rs.",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Atana",
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      " 30,000",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Atana",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                        Container(
                            margin:
                                EdgeInsets.only(left: width * 0.35, top: 20),
                            width: 160,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Delivery",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Atana",
                                      fontWeight: FontWeight.w300),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "Rs.  ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Atana",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        " 4,000",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Atana",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: width - 50,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border: Border.all(
                                color: Color.fromRGBO(91, 80, 78, 1), width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: width * 0.50,
                                child: TextFormField(
                                  cursorColor: Colors.white,
                                  cursorWidth: 0,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintText: "Enter Promo Code",
                                      hintStyle: TextStyle(
                                          color: Colors.grey.withOpacity(0.7),
                                          fontFamily: "Atana",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 115,
                                height: 50,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: FlatButton(
                                    onPressed: () {},
                                    color: Colors.grey.withOpacity(0.2),
                                    splashColor: Colors.grey.withOpacity(0.3),
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          fontFamily: "Atana"),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: width - 50,
                          height: 50,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                new Text(
                                  "In Total",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontFamily: "Atana"),
                                ),
                              Row(
                                children: <Widget>[
                                  new Text(
                                    "Rs. ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        fontFamily: "Atana"),
                                  ),Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: new Text(
                                      "35,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          fontFamily: "Atana"),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: width * 0.30,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            child: Container(
              margin: EdgeInsets.only(top: 12,bottom: 10),
              width: width - 50,
              height: 60,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: FlatButton(
                    onPressed: (){
                      print(widget.imageID);
                    },
                    color: Colors.black,
                    child: Text("Place Your Order (Rs. 35,000)",style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Atana",
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
