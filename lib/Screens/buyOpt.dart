import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/mobile/phones.dart';

import 'mobile/newPhone/Newphone.dart';

class BuyOption extends StatefulWidget {
  final type;
  const BuyOption({Key key,this.type}) : super(key: key);

  @override
  _BuyOptionState createState() => _BuyOptionState();
}

class _BuyOptionState extends State<BuyOption> {
  final type;
  _BuyOptionState({this.type});
  double width=0.0;
  double height=0.0;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        title: Text("Buy Phones",style: styles(Colors.white,22.0,FontWeight.normal),),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: width*0.12,
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Container(
                // color: Color(0Xff0B1940),
                child:Center(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        menuCard(NewPhone(type: "newmobile",),"images/neww.png","New Phone"),
                        Divider(color: Colors.black45,thickness: 2,),
                        menuCard(NewPhone(type: "newmobile",),"images/old.png","Used Phone"),
                        Divider(color: Colors.black45,thickness: 2,),
                        menuCard(NewPhone(type: "newmobile",),"images/dead phone.png","Dead Phone"),
                        Divider(color: Colors.black45,thickness: 2,),
                        menuCard(NewPhone(type: "newmobile",),"images/broken.png","Damaged Phone"),
                        Divider(color: Colors.black45,thickness: 2,),
                        menuCard(NewPhone(type: "newmobile",),"images/nonpta.png","Non-Pta Phone"),
                        Divider(color: Colors.black45,thickness: 2,),
                        menuCard(NewPhone(type: "newmobile",),"images/joystick.png","Gaming Phone"),
                        Divider(color: Colors.black45,thickness: 2,),
                        // Spacer(),
                        // menuCard(SellPart(),"images/spare.png","Parts"),
                        // Divider(color: Colors.black45,thickness: 2,),
                        // Spacer(),
                        // (type=="seller")?menuCard(SellNewPhone(),"images/new.png","New Phone"):Container(),
                        // (type=="seller")?Divider(color: Colors.black45,thickness: 2,):Container(),
                        // Spacer(),
                        // (type=="seller")?menuCard(SellAccessories(),"images/access.png","Accessories"):Container(),
                        // (type=="seller")?Divider(color: Colors.black45,thickness: 2,):Container(),
                      ],
                    )
                  // child: GridView.count(
                  //   crossAxisCount: 2,
                  //   mainAxisSpacing: 10,
                  //   crossAxisSpacing: 5,
                  //   // childAspectRatio: 1.3,
                  //   scrollDirection: Axis.vertical,
                  //   children: [
                  //     menuCard(SellUsedPhone(),"images/old.png","Used Phone"),
                  //     menuCard(SellDeadPhone(),"images/dead phone.jpg","Dead Phone"),
                  //     menuCard(DamagedPhone(),"images/broken.png","Damaged Phone"),
                  //     menuCard(SellPart(),"images/spare.png","Parts"),
                  //     (type=="seller")?menuCard(SellNewPhone(),"images/new.png","New Phone"):Container(),
                  //     (type=="seller")?menuCard(SellAccessories(),"images/access.png","Accessories"):Container(),
                  //   ],),
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
      child: ListTile(

        leading:  Container(
            height: height*0.4,
            width: width*0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // shape: BoxShape.circle,
              image:DecorationImage(
                image:AssetImage(icon),fit: BoxFit.fill,),
              // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.colorBurn),
              // ) ,
              // color: Colors.grey,

            )
        ),
        title:  Text(text,
          style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),
        ),
      ),
      // child: Container(
      //   height: height*0.3,
      //   width: width*0.1,
      //
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Container(
      //           height: height*0.1,
      //           width: width*0.19,
      //           decoration: BoxDecoration(
      //             // borderRadius: BorderRadius.circular(12),
      //             image:DecorationImage(
      //               image:AssetImage(icon),fit: BoxFit.fill,),
      //             // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.colorBurn),
      //             // ) ,
      //             // color: Colors.grey,
      //
      //           )
      //       ),
      //       Text(text,
      //         style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),
      //       ),
      //
      //
      //     ],
      //   ),
      // ),
    );
  }
}

