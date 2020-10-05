import 'package:flutter/material.dart';
import 'dashboard_icons_icons.dart';
import 'ProductPage.dart';

//Todo Things to do..make ListView dynamic through variable created on line number 14 15 16 17...And add animations.. to switch between Icon tabs


class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currActiveIcon = 2;
  List<String> prodChair = new List();
  List<String> prodBed = new List();
  List<String> prodSofa = new List();
  List<String> prodTable = new List();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    void changeIconState(int currentIcon) {
      setState(() {
        currActiveIcon = currentIcon;
      });
    }

    Widget productList(int index,String catagory) {
      return GestureDetector(
        onTap: (){
          Navigator.push(context,
          MaterialPageRoute(builder:(context)=> ProductPage(imageID: index,catagory: catagory,))
          );
        },
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          height: 275,
          width: 180,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 80),
                height: 195,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 110.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            "Astrra Morden",
                            style: TextStyle(fontFamily: "Atana", fontSize: 18),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            "Chair",
                            style: TextStyle(fontFamily: "Atana", fontSize: 18),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              "Rs. 12000",
                              style: TextStyle(
                                  fontFamily: "Atana",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Opacity(
                opacity: 1.0,
                child: Container(
                  margin: EdgeInsets.only(top: 0, left: 15),
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Hero(
                      tag: index.toString(),
                      child: Image.asset(
                        "assets/${catagory}/${index}.png",
                      fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 10,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(91, 80, 78, 1),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Tab(
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget featuredProd(int index){
      initState(){
        super.initState();
        for(int i = 1; i<7;i++){
          prodChair.add(i.toString());
        }
        for(int i = 1; i<14;i++){
          prodBed.add(i.toString());
        }
        for(int i = 1; i<14;i++){
          prodSofa.add(i.toString());
        }
        for(int i = 1; i<8;i++){
          prodTable.add(i.toString());
        }
      }
      return  new Container(
        margin: EdgeInsets.only(top: 20),
        width: 300,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.transparent,
        ),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 220,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 55,top: 18),
                        child: new Text(
                          "Moden Sofa",
                          style: TextStyle(
                              color: Color.fromRGBO(91, 80, 78, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Atana"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 55,top: 6),
                        child: new Text(
                          "Style: Classic",
                          style: TextStyle(
                              color: Color.fromRGBO(91, 80, 78, 1),
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Atana"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 55,top: 6),
                        child: new Text(
                          "Rs. 15,000",
                          style: TextStyle(
                              color: Color.fromRGBO(91, 80, 78, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Atana"),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ClipRRect(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        child: Image.asset("assets/Sofas/${index}.png")),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 15,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(91, 80, 78, 1),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Tab(
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget iconButton(IconData i, int status, int index) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: GestureDetector(
          onTap: () {
            changeIconState(index);
          },
          child: new AnimatedContainer(
            duration: new Duration(
              milliseconds: 1000,
            ),
            height: (status == index) ? 65 : 60,
            width: (status == index) ? 65 : 60,
            decoration: BoxDecoration(
                color: (status == index)
                    ? Color.fromRGBO(91, 80, 78, 1)
                    : Colors.white54,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, //Color.fromRGBO(91, 80, 78, 1),
                    spreadRadius: 8,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Tab(
              icon: Icon(i,
                  color: (status != index)
                      ? Colors.black
                      : Color.fromRGBO(252, 182, 68, 1),
                  size: 30),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: height * 0.10, left: 20),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Find the",
                          style: TextStyle(
                              fontFamily: "PlayfairDisplay",
                              color: Color.fromRGBO(91, 80, 78, 1),
                              fontSize: 45),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Best ",
                              style: TextStyle(
                                  fontFamily: "PlayfairDisplay",
                                  color: Color.fromRGBO(91, 80, 78, 1),
                                  fontSize: 45),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Furniture.",
                              style: TextStyle(
                                  fontFamily: "PlayfairDisplay",
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(91, 80, 78, 1),
                                  fontSize: 45),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                height: 70,
                width: width,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    iconButton(DashboardIcons.armchair, currActiveIcon, 1),
                    iconButton(DashboardIcons.bed, currActiveIcon, 2),
                    iconButton(DashboardIcons.couch, currActiveIcon, 3),
                    iconButton(DashboardIcons.furniture, currActiveIcon, 4),
                  ],
                ),
              ),
//              productList(1)
//              ListView.builder(itemBuilder: (context,index){
//                return productList((index+1));
//              },
//              itemCount: 5,
//                scrollDirection: Axis.horizontal,
//              )

              Container(
                height: 280,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    productList(1,"Chairs"),
                    productList(2,"Chairs"),
                    productList(3,"Chairs"),
                    productList(5,"Chairs"),
                    productList(6,"Chairs")
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 25, left: 30),
                child: new Text(
                  "Fearued",
                  style: TextStyle(
                    fontFamily: "PlayfairDisplay",
                    fontSize: 25,
                    color: Color.fromRGBO(91, 80, 78, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 120,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    featuredProd(1),
                    featuredProd(2),
                    featuredProd(3),
                    featuredProd(4),
                    featuredProd(5),
                    featuredProd(6),
                    featuredProd(7),
                    featuredProd(8),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
