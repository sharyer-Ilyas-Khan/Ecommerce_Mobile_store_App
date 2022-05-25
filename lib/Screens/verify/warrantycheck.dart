import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/functions.dart';
import 'package:url_launcher/url_launcher.dart';

class WarrantyCheck extends StatefulWidget {
  const WarrantyCheck({Key key}) : super(key: key);

  @override
  _WarrantyCheckState createState() => _WarrantyCheckState();
}

class _WarrantyCheckState extends State<WarrantyCheck> {
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
         title: Text("Warranty"),
         centerTitle: true,

       ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: GridView.count(crossAxisCount: 2,
          children: [
            imageContainer('mobilelogo/sam.png',"https://www.samsungwarrantycheck.com",true),
            imageContainer('mobilelogo/iphone.png',"https://checkcoverage.apple.com/gb/en/;jsessionid=node01bt30odvzjcjd139osteoh51983240030.node0",true),
            imageContainer('mobilelogo/oppo.jpg',"https://support.oppo.com/pk/warranty-check/",true),
            imageContainer('mobilelogo/hua.jpg',"https://consumer.huawei.com/eg-en/support/warranty-query/",true),
            imageContainer('mobilelogo/nok.jpg','https://www.google.com',true),
            imageContainer('mobilelogo/vivo.png',"https://carlcare.com/pk/warranty-check/",true),
            imageContainer('mobilelogo/infi.jpg',"https://carlcare.com/pk/warranty-check/",true),
            imageContainer('mobilelogo/mi.png',"https://carlcare.com/pk/warranty-check/",true),
            imageContainer('mobilelogo/lg.jpg',"https://www.google.com",true),

          ],),
      )
    ) ;
  }
  Widget imageContainer(image,link,launch){
    return InkWell(
      onTap: (){
        print("clicked");
       launchUniversalLinkIos(link.toString());
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
  Future<void> launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      print("Launched");
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        print("notLaunched");
        await launch(url, forceSafariVC: true);
      }
      else
        print("Not lunched");
    }
  }
}
