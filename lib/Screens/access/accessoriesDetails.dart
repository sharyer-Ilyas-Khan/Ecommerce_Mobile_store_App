import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:mobile_app/Screens/mobile/newPhone/detailsInfo.dart';

class AccessoriesDetails extends StatefulWidget {
  final title;
  const AccessoriesDetails({this.title,Key key}) : super(key: key);

  @override
  _AccessoriesDetailsState createState() => _AccessoriesDetailsState(title:title);
}



class _AccessoriesDetailsState extends State<AccessoriesDetails> {
  final title;
  _AccessoriesDetailsState({this.title});
  double height=0;
  double width=0;
  bool selectedBrand=false;
  bool buy=false;
  var titleOfPart="";
  var mobile="";
  var model="";
  var shopName="";
  var address="";
  var price="";
  var image="";
  double total=0.0;
  int increment=0;
  var dataList=[]??['loading failed'];
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      backgroundColor: Color(0xfffffeea),
      body:Column(
        children: [
          // newMobile("shryer", "subtitle", "ram", "rom", "camera", "color", "mPrice", "oPrice"),
          // Expanded(
          //   flex: 2,
          //   child: Padding(
          //     padding:EdgeInsets.all(8.0),
          //     child: Container(
          //       child:Column(
          //         children: [
          //           // Text("New Mobile"),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               Column(
          //                 children: [
          //                   Text("Brand"),
          //                   DropdownButton(
          //
          //                       hint: Text("ex:oppo"),
          //                       // value: selectedBrand,
          //                       onChanged: (value){
          //                         setState(() {
          //                           selectedBrand=value;
          //                         });
          //                       },
          //                       items:[
          //                         DropdownMenuItem(value: 'Oppo',child: Text('Oppo')),
          //                         DropdownMenuItem(value: 'Samsung',child: Text('Samsung')),
          //                         DropdownMenuItem(value: 'Lg',child: Text('LG')),
          //                         DropdownMenuItem(value: 'Iphone',child: Text('Iphone')),
          //                       ])
          //                 ],
          //               ),
          //               Column(
          //                 children: [
          //                   Text("Select Mobile"),
          //                   DropdownButton(
          //
          //                       hint: Text("ex:oppo"),
          //                       // value: selectedBrand,
          //                       onChanged: (value){
          //                         setState(() {
          //                           selectedBrand=value;
          //                         });
          //                       },
          //                       items:[
          //                         DropdownMenuItem(value: 'Oppo',child: Text('Oppo')),
          //                         DropdownMenuItem(value: 'Samsung',child: Text('Samsung')),
          //                         DropdownMenuItem(value: 'Lg',child: Text('LG')),
          //                         DropdownMenuItem(value: 'Iphone',child: Text('Iphone')),
          //                       ])
          //                 ],
          //               )
          //             ],
          //           ),
          //         ],
          //       ) ,),
          //   ),
          // ),
          Expanded(
            flex: 2,
            child: Padding(
              padding:  EdgeInsets.all(2.0),
              child: Container(
                child: GFSearchBar(
                    searchList:dataList,
                    searchQueryBuilder: (query, list) => list
                        .where((item) {
                      return item.toString().toLowerCase().contains(query.toLowerCase());
                    })
                        .toList(),
                    overlaySearchListItemBuilder: (dynamic item) => Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    onItemSelected: (dynamic item) {
                      setState(() {
                        print('$item');
                      });
                    }),
              ),
              // child:TextFormField(
              //   decoration: deco('Enter IMEI'),
              //   validator: RequiredValidator(
              //     errorText: "Required"
              //   ),
              // ),
            ),
            // child: Padding(
            //   padding:EdgeInsets.all(8.0),
            //   child: Container(
            //     child:Column(
            //     children: [
            //       // Text("New Mobile"),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Column(
            //             children: [
            //               Text("Brand"),
            //               DropdownButton(
            //
            //                   hint: Text("ex:oppo"),
            //                   // value: selectedBrand,
            //                   onChanged: (value){
            //                     setState(() {
            //                       selectedBrand=value;
            //                     });
            //                   },
            //                   items:[
            //                     DropdownMenuItem(value: 'Oppo',child: Text('Oppo')),
            //                     DropdownMenuItem(value: 'Samsung',child: Text('Samsung')),
            //                     DropdownMenuItem(value: 'Lg',child: Text('LG')),
            //                     DropdownMenuItem(value: 'Iphone',child: Text('Iphone')),
            //                   ])
            //             ],
            //           ),
            //           Column(
            //             children: [
            //               Text("Select Mobile"),
            //               DropdownButton(
            //
            //                   hint: Text("ex:oppo"),
            //                   // value: selectedBrand,
            //                   onChanged: (value){
            //                     setState(() {
            //                       selectedBrand=value;
            //                     });
            //                   },
            //                   items:[
            //                     DropdownMenuItem(value: 'Oppo',child: Text('Oppo')),
            //                     DropdownMenuItem(value: 'Samsung',child: Text('Samsung')),
            //                     DropdownMenuItem(value: 'Lg',child: Text('LG')),
            //                     DropdownMenuItem(value: 'Iphone',child: Text('Iphone')),
            //                   ])
            //             ],
            //           )
            //         ],
            //       ),
            //     ],
            //   ) ,),
            // ),
          ),
          Expanded(
            flex: 9,
            child: Stack(
                children:[
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("accessories")
                            .doc("9xbNSKmHF2hTt1iuYC3f").collection(title.toString().toLowerCase()).snapshots(),
                        builder: (_,snap){
                          dataList=[];
                          if(snap.hasError){
                            return Text("");
                          }
                          if(snap.hasData){
                            return  ListView.builder(
                              itemCount: snap.data.docs.length,
                              itemBuilder: (_, i) {
                                DocumentSnapshot snaps = snap.data.docs[i];
                                titleOfPart=snaps.get('name');
                                dataList.add(titleOfPart);
                                // mobile=snaps.get('mobile');
                                // model=snaps.get('model');
                                // shopName=snaps.get('shop Name');
                                // address=snaps.get('shop Address');
                                price=snaps.get('price');
                                // image=snaps.get('image');
                                return newPart(titleOfPart,"mobile","model","shopName","address",price,"image");
                                // return newPart(title,mobile,model,shopName,address,price,image);
                              },
                            );
                          }
                          return Text("");
                        },

                      ),
                    ),

                  ),
                  buy?Positioned(
                      top: height*0.1,
                      left: width*0.05,
                      child:dialog(title,address, shopName, price)):Container()
                ]
            ),
          ),
          Expanded(
              flex:1,
              child:Padding(
                padding: EdgeInsets.only(left:15.0,right:15),
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text("Add Demand"),
                  ),
                ),
              )),
          // Expanded(
          //   flex: 4,
          //   child: Container(
          //     child: Padding(
          //       padding:  EdgeInsets.all(10.0),
          //       child:  StreamBuilder<QuerySnapshot>(
          //         stream: FirebaseFirestore.instance.collection("accessories")
          //             .doc("9xbNSKmHF2hTt1iuYC3f").collection(title.toString().toLowerCase()).snapshots(),
          //         builder: (_,snap){
          //           if(snap.hasError){
          //             return Text("No Data Found");
          //           }
          //           if(snap.hasData){
          //             return  ListView.builder(
          //               itemCount: snap.data.docs.length,
          //               itemBuilder: (_, i) {
          //                 print(snap.data.docs.length);
          //                 DocumentSnapshot snaps = snap.data.docs[i];
          //                 var title=snaps.get('name');
          //                 // var subtitle=snaps.get('subTitle');
          //                 // var ram=snaps.get('ram');
          //                 // var rom=snaps.get('rom');
          //                 // var camera=snaps.get('camera');
          //                 var color=snaps.get('color');
          //                 var mPrice=snaps.get('price');
          //                 // var oPrice=snaps.get('oPrice');
          //                 return newMobile(title,color,mPrice,"","","","","");
          //               },
          //             );
          //           }
          //           else
          //             return Center(
          //                 child: Text("No Data found"));
          //
          //           // return Text("");
          //         },
          //
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
  Widget newPart(name,mobile,model,pName,address,price,image){
    return Padding(
      padding: EdgeInsets.only(top: 5,),
      child: Container(
        width: width*0.8,
        height: width*0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.55),offset: Offset(3,9),blurRadius: 20,spreadRadius: 0.2)
            ],
            color: Colors.white
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: width*0.2,
                // height: width*0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image),fit: BoxFit.fill
                    )
                ),
              ),
              title: Text(name),
              subtitle: Text("$mobile $model    Price:$price"),
              isThreeLine: true,
            ),
            Column(

              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     // Column(
                //     //   crossAxisAlignment: CrossAxisAlignment.start,
                //     //   children: [
                //     //     Text("Shop Name: $pName"),
                //     //     Text("Address: $address",softWrap: true,),
                //     //
                //     //   ],
                //     // ),
                //     Column(
                //       children: [
                //         Text(""),
                //       ],
                //     ),
                //
                //   ],
                // ),
                Padding(
                  padding:EdgeInsets.only(right:15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: (){
                        setState(() {
                          buy=true;
                          total=0;
                          increment=0;
                          total=double.parse(price);
                          increment=increment+1;
                        });
                      }, child: Text('Buy'))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget dialog(title,address,shopName,price){
    return Container(
      height: width*0.8,
      width: width*0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.55),offset: Offset(3,9),blurRadius: 20,spreadRadius: 0.2)
          ],
          color: Colors.white
      ),
      child:Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.red,
                onPressed: (){
                  setState(() {
                    buy=false;
                  });
                },
              )),
          Positioned(
              top: 10,
              left: 125,
              child: Container(
                height: height*0.08,
                width: width*0.25,
                child: Image(
                  image: NetworkImage(image),
                ),
              )),
          Positioned(
              top: 10,
              left: 10,
              child: Text(title,style: styleText(width*0.06,FontWeight.bold),)),
          Positioned(
              top: 50,
              left: 10,
              child: Row(
                children: [
                  Icon(Icons.shopping_bag,color: Colors.blue,size: 20,),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(shopName,style: styleText(width*0.04,FontWeight.normal),),
                ],
              )),
          Positioned(
              top: 80,
              left: 10,
              child: Row(
                children: [
                  Icon(Icons.monetization_on_outlined,color: Colors.green,size: 20,),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text("Rs:$price/piece",style: styleText(width*0.04,FontWeight.normal),),
                ],
              )),
          Positioned(
              top: 110,
              left: 10,
              child: Row(
                children: [
                  Icon(Icons.pin_drop,color: Colors.red,size: 20,),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(address,softWrap: true,style: styleText(width*0.04,FontWeight.normal),),
                ],
              )),
          Positioned(
              bottom: 100,
              left: 75,
              child: Text("Rs:$total",style: TextStyle(
                  fontSize: 30
              ),)),
          Positioned(
              bottom: 60,
              left: 50,
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(increment!=1)
                        {
                          increment--;
                          total=total-double.parse(price);
                        }

                      });
                    },
                    child: Container(
                        height: width*0.08,
                        width: width*0.1,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Icon(Icons.exposure_minus_1,color: Colors.red,),)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Container(
                      height: width*0.08,
                      width: width*0.3,
                      color: Colors.grey.shade200,
                      child: Center(
                        child:Text("$increment"),)
                  ),

                  Padding(padding: EdgeInsets.only(left: 10)),
                  InkWell(
                    onTap: (){
                      setState(() {
                        increment++;
                        total=total+double.parse(price);
                      });
                    },
                    child: Container(
                        height: width*0.08,
                        width: width*0.1,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Icon(Icons.exposure_plus_1,color: Colors.blue,),)
                    ),
                  ),

                ],
              )),
          Positioned(
              bottom: 15,
              left: 70,
              child: Row(
                children: [
                  Container(
                    height: width*0.09,
                    width: width*0.4,
                    color: Colors.black,
                    child: Center(
                      child: Text("Add to Cart",style: TextStyle(color: Colors.white
                      ),),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Icon(Icons.shopping_cart,color: Colors.blue,)

                ],
              )),

        ],
      ),
    );
  }
  TextStyle styleText(font,weight){
    return TextStyle(
        color: Colors.black,
        fontSize: font,
        fontWeight: weight
    );
  }
}
