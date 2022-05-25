import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/mobile/newPhone/Newphone.dart';
import 'package:mobile_app/Screens/mobile/used/sellusedPhone.dart';

class Phones extends StatefulWidget {
  const Phones({Key key}) : super(key: key);

  @override
  _PhonesState createState() => _PhonesState();
}

class _PhonesState extends State<Phones> {
  double height=0;
  double width=0;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xfffffeea),
        appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: TabBar(
          labelColor: Colors.white,
        tabs: [
        Tab(text: "Buy",),
        Tab(text: "Sell"),
            ],
            ),
          centerTitle: true,
          title: Text('Phones'),
    ),
      body: TabBarView(
        children: [
          ///new phones
        Column(
          children: [
            Expanded(
              flex: 1,
                child: Container(
                  child:  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                     viewportFraction: 1,
                    ),

                    items: [
                      Image(image: AssetImage("images/newMObile.jpg"),fit: BoxFit.fill,),
                      Image(image: AssetImage("images/acess.jpg"),fit: BoxFit.fill,),
                      Image(image: AssetImage("images/sellmobile.jpg"),fit: BoxFit.fill,),
                      Image(image: AssetImage("images/acess.jpg"),fit: BoxFit.fill,),
                    ],
                  ),
                )
            ),
            Expanded(
              flex: 2,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding:EdgeInsets.only(top:width*0.13,bottom: width*0.13,left: width*0.05,right: width*0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(NewPhone(), "New Phones"),
                        SizedBox(height: 20,),
                        button(NewPhone(), "Used Phones"),
                        SizedBox(height: 20,),
                        button(NewPhone(), "Broken Phones"),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
        ///sell phones
        Column(
          children: [
            Expanded(
              flex: 1,
                child: Container(
                  child:  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                     viewportFraction: 1,
                    ),

                    items: [
                      Image(image: AssetImage("images/newMObile.jpg"),fit: BoxFit.fill,),
                      Image(image: AssetImage("images/acess.jpg"),fit: BoxFit.fill,),
                      Image(image: AssetImage("images/sellmobile.jpg"),fit: BoxFit.fill,),
                      Image(image: AssetImage("images/acess.jpg"),fit: BoxFit.fill,),
                    ],
                  ),
                )
            ),
            Expanded(
              flex: 2,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding:EdgeInsets.only(top:width*0.13,bottom: width*0.13,left: width*0.05,right: width*0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(SellUsedPhone(), "Used Phones"),
                        SizedBox(height: 20,),
                        button(NewPhone(), "Dead Phones"),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      ]
      ),
    )
    );
  }
  Widget button(route,text){
    return  Expanded(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>route));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:Colors.grey,
                boxShadow: [
                  BoxShadow(offset:Offset(1.5,3),spreadRadius: 0,blurRadius: 5,color: Colors.black)
                ]),
            child: Padding(
              padding: EdgeInsets.only(left:40.0,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text),
                  Icon(Icons.arrow_forward_ios_sharp)
                ],
              ),
            ),
          ),
        )
    );
  }
}
