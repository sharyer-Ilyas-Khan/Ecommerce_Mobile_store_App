import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/mobile/dead/sellDamage.dart';
import 'package:mobile_app/Screens/mobile/dead/sellDeadPhone.dart';
import 'package:mobile_app/Screens/mobile/newPhone/sellNewPhone.dart';
import 'package:mobile_app/Screens/mobile/sellSparepart.dart';
import 'package:mobile_app/Screens/mobile/used/sellusedPhone.dart';

import 'access/sellaccess.dart';

class Sell extends StatefulWidget {
  final type;
  const Sell({Key key,this.type}) : super(key: key);

  @override
  _SellState createState() => _SellState(type: type);
}

class _SellState extends State<Sell> {
  final type;
  _SellState({this.type});
  double width=0.0;
  double height=0.0;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        title: Text("Sell",style: styles(Colors.white,22.0,FontWeight.normal),),
        centerTitle: true,
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: width*0.12,
        // ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Container(
              // color: Color(0Xff0B1940),
              child:Center(
                // child:ListView(
                //   // mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     menuCard(SellUsedPhone(),"images/old.png","Used Phone"),
                //     Divider(color: Colors.black45,thickness: 2,),
                //     menuCard(SellDeadPhone(),"images/dead phone.jpg","Dead Phone"),
                //     Divider(color: Colors.black45,thickness: 2,),
                //     menuCard(DamagedPhone(),"images/broken.png","Damaged Phone"),
                //     Divider(color: Colors.black45,thickness: 2,),
                //     menuCard(SellPart(),"images/spare.png","Parts"),
                //     Divider(color: Colors.black45,thickness: 2,),
                //     menuCard(SellNewPhone(),"images/new.png","New Phone"),
                //     Divider(color: Colors.black45,thickness: 2,),
                //     menuCard(SellAccessories(),"images/access.png","Accessories"),
                //     Divider(color: Colors.black45,thickness: 2,),
                //     menuCard(SellPart(),"images/spare.png","Non-PTA"),
                //     Divider(color: Colors.black45,thickness: 2,),
                //     menuCard(SellPart(),"images/spare.png","Gaming"),
                //     Divider(color: Colors.black45,thickness: 2,),
                //   ],
                // )
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1.1,
                  scrollDirection: Axis.vertical,
                  children: [
                                    menuCard(SellUsedPhone(),"images/old.png","Used Phone"),
                                    menuCard(SellDeadPhone(),"images/dead phone.png","Dead Phone"),
                                    menuCard(DamagedPhone(),"images/broken.png","Damaged Phone"),
                                    menuCard(SellPart(),"images/spare.png","Phone Parts"),
                                    menuCard(SellNewPhone(),"images/new.png","New Phone"),
                                    menuCard(SellAccessories(),"images/access.png","Accessories"),
                                    menuCard(SellPart(),"images/nonpta.png","Non-PTA"),
                                    menuCard(SellPart(),"images/joystick.png","Gaming"),
                  ],),
              ),
            ),
          ),
        ),
      ],
    ),
    );
  }
  TextStyle styles(color,size,weight){
    return TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        fontFamily: "fred"
    );
  }
  Widget menuCard(route,icon,text){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>route));
      },
      // child: ListTile(
      //
      //   leading:  Container(
      //           height: height*0.4,
      //           width: width*0.18,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(12),
      //             // shape: BoxShape.circle,
      //             image:DecorationImage(
      //               image:AssetImage(icon),fit: BoxFit.fill,),
      //             // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.colorBurn),
      //             // ) ,
      //             // color: Colors.grey,
      //
      //           )
      //       ),
      //   title:  Text(text,
      //       style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),
      //     ),
      // ),
      child: Container(
        height: height*0.3,
        width: width*0.1,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: height*0.1,
                width: width*0.19,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(12),
                  image:DecorationImage(
                    image:AssetImage(icon),fit: BoxFit.fill,),
                  // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.colorBurn),
                  // ) ,
                  // color: Colors.grey,

                )
            ),
            Text(text,textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),
            ),


          ],
        ),
      ),
    );
  }
}
