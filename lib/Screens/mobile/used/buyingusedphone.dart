import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/functions.dart';
import 'buyingOldphonedetails.dart';
class BuyingUsedPhone extends StatefulWidget {
  const BuyingUsedPhone({Key key}) : super(key: key);

  @override
  _BuyingUsedPhoneState createState() => _BuyingUsedPhoneState();
}

class _BuyingUsedPhoneState extends State<BuyingUsedPhone> {
  double height=0;
    double width=0;
    Functions function= Functions();
    @override
  Widget build(BuildContext context) {
     height=MediaQuery.of(context).size.height;
     width=MediaQuery.of(context).size.width;
     return Scaffold(
         backgroundColor: Color(0xfffffeea),
       appBar: AppBar(
         title: Text("Select Brand"),
         centerTitle: true,

       ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: GridView.count(crossAxisCount: 2,
          children: [
            imageContainer('mobilelogo/sam.png',"samsung"),
            imageContainer('mobilelogo/iphone.png',"iphone"),
            imageContainer('mobilelogo/oppo.jpg',"oppo"),
            imageContainer('mobilelogo/hua.jpg',"huawei"),
            imageContainer('mobilelogo/nok.jpg',"nokia"),
            imageContainer('mobilelogo/vivo.png',"vivo"),
            imageContainer('mobilelogo/infi.jpg',"infinix"),
            imageContainer('mobilelogo/mi.png',"mi"),
            imageContainer('mobilelogo/lg.jpg',"lg"),

          ],),
      )
    ) ;
  }
  Widget imageContainer(image,brand){
    return InkWell(
      onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (_)=>BuyingUsedPhoneDetails(brand:brand)));
      },
      child: Column(
         children: [
           Container(

             width: width*0.4,
             height: width*0.4,


             decoration: BoxDecoration(
                image: DecorationImage(

                    image: AssetImage(image),fit: BoxFit.fitWidth),
               borderRadius: BorderRadius.circular(10),
               color: Colors.white,
               boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(2, 2),
                )
               ]

             ),

           ),
           // Text(name),

         ],
      ),
    ) ;
  }
}
