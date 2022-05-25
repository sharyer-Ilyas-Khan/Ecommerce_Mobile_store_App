import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/access/accessories.dart';
import 'package:mobile_app/Screens/buyOpt.dart';
import 'package:mobile_app/Screens/mobile/dead/buyDeadPhones.dart';
import 'package:mobile_app/Screens/mobile/checklost.dart';
import 'package:mobile_app/Screens/mobile/lostandfound.dart';
import 'package:mobile_app/Screens/mobile/dead/sellDeadPhone.dart';
import 'package:mobile_app/Screens/mobile/spareparts.dart';
import 'package:mobile_app/repair/repairTech.dart';
import 'package:mobile_app/repair/repare.dart';
import 'package:mobile_app/Screens/sell.dart';
import 'package:mobile_app/Screens/verify/warrantycheck.dart';
import 'package:mobile_app/authantication/auth.dart';
import 'package:mobile_app/authantication/login.dart';
import 'package:mobile_app/authantication/signup.dart';
import 'package:mobile_app/authantication/user.dart';
import 'package:mobile_app/functions.dart';
import  'package:mobile_app/Screens/mobile/used/buyingusedphone.dart';
import 'package:provider/provider.dart';
import 'delivery.dart';
import 'mobile/newPhone/Newphone.dart';
import 'verify/nearByVerifier.dart';
import 'notification.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double height=0;
  double width=0;
  String type;
  String area;
  Functions function= Functions();
  AuthanticateUser _auth=AuthanticateUser();
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
        color:Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor:Colors.white,
        index: 0,

        items: <Widget>
        [
          Icon(Icons.home,size:width*0.065,color: Colors.white,),
          // Image(image:AssetImage('images/hospital.png'),height: 20,width: 20,fit: BoxFit.fill,),
          Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color:Colors.green,
              ),
              child: Center(child: Text("Sell",style: TextStyle(fontSize: 20,color: Color(0xff00c400)),))),
          Icon(Icons.assignment_outlined, size:MediaQuery.of(context).size.width*0.065,color: Colors.white,),
        ],
        height:width*0.15,
        animationDuration: Duration(
          milliseconds: 200,
        ),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          switch (index)
          {
            case 0:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Dashboard()));
              break;
            case 1:
              if(user==null){
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                    title: Center(
                                        child: Column(
                                          children: [
                                            Text("Info",style: styles(Colors.grey,16.0,FontWeight.normal)),
                                            Divider(
                                              color: Colors.grey,
                                              height: 5,
                                              thickness: 2,
                                            ),
                                          ],
                                        )),
                                    content: Container(
                                      height: width*0.3,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Text("You Have To Sign Up to Continue",style: styles(Colors.grey,13.0,FontWeight.normal),),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              RaisedButton(onPressed: (){

                                                Navigator.pop(ctx);
                                                Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                                              },color: Colors.blue,child: Text("Sign Up"),),
                                              RaisedButton(onPressed: (){
                                                Navigator.pop(ctx);

                                              },color: Colors.grey,child: Text("Cancel"),)
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              );

                            }
                            else{
                              print(user.uid);
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>Sell(type:type)));
                            }

              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (_)=>BuyingUsedPhone()));
              break;
          }
        },),
      // backgroundColor: Color(0Xff0B1940),
      backgroundColor: Color(0xfffffeea),
      appBar: AppBar(

        title: Text("Dashboard",style: TextStyle(color: Colors.white,),),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,),
            highlightColor: Colors.transparent,)
        ],
        // backgroundColor:Color(0Xff0B1940),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      drawer: Drawer(
         child: Column(
           children: [
             (user != null)?
             StreamBuilder<DocumentSnapshot>(
                 stream: FirebaseFirestore.instance.collection("user").doc(user.uid).snapshots(),
                 builder: (context, snapshot) {
                   if(snapshot.hasData){
                     area=snapshot.data.get('Area');
                     print(area);
                     return Expanded(
                       child: Container(

                           decoration: BoxDecoration(
                               color: Colors.black
                           ),
                           child: Center(
                             child: SingleChildScrollView(
                               child: Padding(
                                 padding: EdgeInsets.all(12.0),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     CircleAvatar(
                                       radius: 38,
                                       backgroundColor: Colors.grey,
                                       backgroundImage: NetworkImage(snapshot.data.get('ImageUrl')),
                                     ),
                                     Padding(padding: EdgeInsets.all(10.0)),
                                     Text(snapshot.data.get('User Name').toUpperCase(),style: styles(Colors.white,14.0, FontWeight.normal),),
                                     Text(snapshot.data.get('Email'),style: styles(Colors.white,14.0, FontWeight.normal),),
                                     Text(snapshot.data.get('Address'),style: styles(Colors.white,14.0, FontWeight.normal),softWrap: true,),
                                     Text(snapshot.data.get('Shop Name'),style: styles(Colors.white,14.0, FontWeight.normal),),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                       ),
                     );}
                   else{
                     return CircularProgressIndicator();
                   }}):
             UserAccountsDrawerHeader(
             decoration: BoxDecoration(
                 color: Colors.black
             ),
             accountName: Text('Your Name'),
             accountEmail: Text('Email'),
             currentAccountPicture: CircleAvatar(
               radius: 9,
               backgroundColor: Colors.grey,
               backgroundImage: AssetImage('images/cross.png'),
             )

         ),
             Expanded(
               flex: 2,
               child: Container(
                 child: Column(
                   children: [
                     ListTile(
                       title: Text("Profile",
                           style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade800)),
                       leading: Icon(Icons.person,color: Colors.black,),
                     ),
                     Divider(thickness: 2),
                     (type!="tech" && user!=null)?
                     InkWell(
                       onTap: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (_)=>
                                 NotificationClass(area:area,userId:user.uid,notify: true,)));
                       },
                       child: ListTile(
                         title: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade800)),
                             // Container(
                             //   height: 25,
                             //     width:25,
                             //     decoration:BoxDecoration(
                             //         shape: BoxShape.circle,
                             //         color: Colors.red
                             //     ),
                             //     child:Center(
                             //         child:Text("4",style: TextStyle(fontSize:12,fontWeight: FontWeight.normal,color: Colors.white))
                             //     )
                             // )
                           ],
                         ),
                         leading: Icon(Icons.language,color: Colors.blue,),
                       ),
                     ):Container(),
                     (user!=null && type!="tech")?Divider(thickness: 2):Container(),
                     // ListTile(
                     //   title: Text("Language",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade800)),
                     //   leading: Icon(Icons.language,color: Colors.black,),
                     // ),
                     // Divider(thickness: 2),
                     (user!=null)?InkWell(
                       onTap: (){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Login()));
                         _auth.singout();
                       },
                       child: ListTile(
                         title: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade800)),
                         leading: Icon(Icons.logout,color: Colors.black,),
                       ),
                     ):
                     InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                       },
                       child: ListTile(
                         title: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade800)),
                         leading: Icon(Icons.vpn_key,color: Colors.amber),

                       ),
                     ),
                     (user!=null)?Divider(thickness: 2):Divider(thickness: 2),
                     (user!=null)?Container():InkWell(
                       onTap: (){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Login()));
                       },
                       child: ListTile(
                         title: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade800)),
                         leading: Icon(Icons.logout,color: Colors.black,),
                       ),
                     ),
                     (user!=null)?Container():Divider(thickness: 2),
                     ListTile(
                       title: Text("Quit",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade800)),
                       leading: Icon(Icons.power_settings_new,color: Colors.red,),
                     ),
                     Divider(thickness: 2),
                   ],
                 ),
               ),
             )
           ],
         ),
      ),
      body: Column(
        children: [
          (user!=null)?stream(user.uid):Container(),
          //Slider for offers
          Expanded(
            flex: 3,
            child: Container(
              // color: Color(0Xff0B1940),
             color: Colors.transparent,
              child: CarouselSlider(
                options: CarouselOptions(
               aspectRatio: 1.999,
                  autoPlay: true,
                  viewportFraction: 0.9,
                  // enlargeCenterPage: true,

                ),

                items: [
                  Image(image: AssetImage("images/newMObile.jpg"),fit: BoxFit.fill,),
                  Image(image: AssetImage("images/acess.jpg"),fit: BoxFit.fill,),
                  Image(image: AssetImage("images/sellmobile.jpg"),fit: BoxFit.fill,),
                  Image(image: AssetImage("images/acess.jpg"),fit: BoxFit.fill,),
                ],
              ),
            ),
          ),

          // options Cards
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Container(
                // color: Color(0Xff0B1940),
                child:Center(
                  child: GridView.count(
    crossAxisCount: 3,
    mainAxisSpacing: 20,
    crossAxisSpacing: 10,
    // childAspectRatio: 1.3,
    scrollDirection: Axis.vertical,
    children: [
      menuCard(BuyDeadPhones(),"images/dead phone.png","Dead Phones",false,false,false,false,user,),
      // menuCard(UsedPhone(type: "usedmobiles",),"images/old.png","Used Phone",false,false,false,),
      // menuCard(SellUsedPhone(),"images/sell.png","Sell",false,false,false,),
      menuCard(Repairing(area:area,userId: user,),"images/repair.png","Repair",false,false,false,true,user),
      menuCard(SpareParts(),"images/spare.png","Spare Parts",false,false,false,false,user),
      menuCard(BuyOption(type: "newmobile",),"images/new.png","Phones",false,false,false,false,user),
      menuCard(Accessories(),"images/access.png","Accessories",false,false,false,false,user),
      menuCard(LostComplaint(),"images/lost.png","Lost&Found",false,false,true,false,user),
      // menuCard(NearByVerifier(),"images/check.png","Verification",false,false,false,false,user),
      menuCard(WarrantyCheck(),"images/pta.png","PTA",false,true,false,false,user),
      menuCard(WarrantyCheck(),"images/warranty.png","Warranty",false,false,false,false,user),
      menuCard(DeliveryService(),"images/R.jpg","Delivery",false,false,false,false,user),
      // menuCard(WarrantyCheck(),"images/demand.png","Demand",false,false,false,),





      ],),
                ),
              ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         InkWell(
          //           onTap: (){
          //             Navigator.push(context, MaterialPageRoute(builder: (_)=>BuyingUsedPhone()));
          //
          //           },
          //           child: Padding(
          //             padding:  EdgeInsets.only(left:10.0,right: 10.0,bottom: 8),
          //             child: Container(
          //               width: width*0.7,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(15),
          //                 color: Colors.black
          //               ),
          //               child: Center(
          //                   child: Text("Buying used Mobile",
          //                     style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          // ),
          //           ),
          //         ),
          //         InkWell(
          //           onTap: (){
          //             if(user==null){
          //               showDialog(
          //                 context: context,
          //                 builder: (ctx) => AlertDialog(
          //                     title: Center(
          //                         child: Column(
          //                           children: [
          //                             Text("Info",style: styles(Colors.grey,16.0,FontWeight.normal)),
          //                             Divider(
          //                               color: Colors.grey,
          //                               height: 5,
          //                               thickness: 2,
          //                             ),
          //                           ],
          //                         )),
          //                     content: Container(
          //                       height: width*0.3,
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                         children: [
          //
          //                           Text("You Have To Sign Up to Continue",style: styles(Colors.grey,13.0,FontWeight.normal),),
          //
          //                           Row(
          //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                             children: [
          //                               RaisedButton(onPressed: (){
          //
          //                                 Navigator.pop(ctx);
          //                                 Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
          //                               },color: Colors.blue,child: Text("Sign Up"),),
          //                               RaisedButton(onPressed: (){
          //                                 Navigator.pop(ctx);
          //
          //                               },color: Colors.grey,child: Text("Cancel"),)
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     )
          //                 ),
          //               );
          //
          //             }
          //             else{
          //               print(user.uid);
          //               Navigator.push(context, MaterialPageRoute(builder: (_)=>Sell(type:type)));
          //             }
          //
          //
          //           },
          //           child: Container(
          //             width: width*0.2,
          //             decoration: BoxDecoration(
          //               // borderRadius: BorderRadius.circular(15),
          //               color: Colors.green,
          //               shape: BoxShape.circle
          //             ),
          //             child: Center(
          //                 child: Text("Sell",
          //                   style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          // ),
          //         ),
          //       ],
          //     )),
          //   SizedBox(
          //     height: 20,
          //   )
        ],
      ),
    );
  }
  Widget menuCard(route,icon,text,alert,link,alert2,tech,user){
    return InkWell(
      onTap: (){
        alert?
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
          title: Center(child: Text("Choice")),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             RaisedButton(onPressed: (){

               Navigator.pop(ctx);
               Navigator.push(context, MaterialPageRoute(builder: (_)=>BuyDeadPhones()));
             },color: Colors.green,child: Text("Buy"),),
             RaisedButton(onPressed: (){
               Navigator.pop(ctx);
               Navigator.push(context, MaterialPageRoute(builder: (_)=>SellDeadPhone()));

               },color: Colors.green,child: Text("Sell"),)
            ],
          )
        ),
        ):
        alert2?
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: Center(child: Text("Choice")),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(onPressed: (){
                    Navigator.pop(ctx);
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>CheckLost()));
                  },color: Colors.green,child: Text("Check"),),
                  RaisedButton(onPressed: (){
                    Navigator.pop(ctx);
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>route));
                  },color: Colors.green,child: Text("Lost"),)
                ],
              )
          ),
        ):
        link?
        function.launchUniversalLinkIos('https://dirbs.pta.gov.pk/'):tech?
        (type=="tech")?
        Navigator.push(context, MaterialPageRoute(builder: (_)=>RepairTech(area:area))):
        (user==null)?
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: Center(
                  child: Column(
                    children: [
                      Text("Info",style: styles(Colors.grey,16.0,FontWeight.normal)),
                      Divider(
                        color: Colors.grey,
                        height: 5,
                        thickness: 2,
                      ),
                    ],
                  )),
              content: Container(
                height: width*0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text("You Have To Sign Up to Continue",style: styles(Colors.grey,13.0,FontWeight.normal),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(onPressed: (){

                          Navigator.pop(ctx);
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                        },color: Colors.blue,child: Text("Sign Up"),),
                        RaisedButton(onPressed: (){
                          Navigator.pop(ctx);

                        },color: Colors.grey,child: Text("Cancel"),)
                      ],
                    ),
                  ],
                ),
              )
          ),
        ):Navigator.push(context, MaterialPageRoute(builder: (_)=>route)):
        Navigator.push(context, MaterialPageRoute(builder: (_)=>route));
      },
      child: Container(
        height: height*0.3,
        width: width*0.1,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height*0.08,
              width: width*0.15,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(12),
                image:DecorationImage(
                    image:AssetImage(icon),fit: BoxFit.fill,),
                // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.colorBurn),
                // ) ,
                // color: Colors.grey,

              )
        ),
               Text(text,
                style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold),
               ),


          ],
        ),
      ),
    );
  }
  TextStyle styles(color,size,weight){
    return TextStyle(
        color: color,
        fontWeight: FontWeight.normal,
        fontSize: size,
        fontFamily: "fred"
    );
  }

  Widget streamCountHarware(uid){
    return StreamBuilder<QuerySnapshot>(
        stream:  FirebaseFirestore.instance.collection("repair").doc(area).collection("hardwareRepair").
        where("userId",isEqualTo: uid).
        snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            // hardware=snapshot.data.docs.length;

            return Container();
          }
          else{
            return Container();
          }});
  }
  Widget streamCountSoftware(uid){
    return StreamBuilder<QuerySnapshot>(
        stream:  FirebaseFirestore.instance.collection("repair").doc(area).collection("softwareRepair").
        where("userId",isEqualTo: uid).
        snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            // software=snapshot.data.docs.length;

            return Container();
          }
          else{
            return Container();
          }});
  }
  Widget stream(uid){
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("user").doc(uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            print(uid);
            type=snapshot.data.get('Type');
            area=snapshot.data.get('Area');
            print(type);
            print(area);
            return Container();
          }
          else{
            return Container();
          }});
  }
  Widget alert(ctx){
    return AlertDialog(
          title: Center(
              child: Column(
                children: [
                  Text("Info",style: styles(Colors.grey,16.0,FontWeight.normal)),
                  Divider(
                    color: Colors.grey,
                    height: 5,
                    thickness: 2,
                  ),
                ],
              )),
          content: Container(
            height: width*0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Text("You Have To Sign Up to Continue",style: styles(Colors.grey,13.0,FontWeight.normal),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(onPressed: (){

                      Navigator.pop(ctx);
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                    },color: Colors.blue,child: Text("Sign Up"),),
                    RaisedButton(onPressed: (){
                      Navigator.pop(ctx);

                    },color: Colors.grey,child: Text("Cancel"),)
                  ],
                ),
              ],
            ),
          )
      )
    ;
  }
}
