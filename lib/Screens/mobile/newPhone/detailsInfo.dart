import 'package:flutter/material.dart';

class MobileInformation extends StatefulWidget {
  const MobileInformation({Key key}) : super(key: key);

  @override
  _MobileInformationState createState() => _MobileInformationState();
}

class _MobileInformationState extends State<MobileInformation> {
  double height=0;
  double width=0;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body:  ListView(
        children: [
          Center(child: Text('Mobile Details')),
          /// intro
          Container(
            height: height*0.3,
              // color: Colors.amber,
            child:Row(
              children: [
                ///image of mobile
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: height*0.25,
                    width: width*0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage("images/mob.jpg"),
                        fit: BoxFit.cover
                      )
                    ),

                  ),
                ),
                ///Details
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    height: height*0.26,
                    width: width*0.6,
                    child: ListView(
                      children: [
                        ListTile(
                          isThreeLine: false,
                          title: Text("OPPO F5") ,
                          subtitle:   Text("OPPO F5"),
                        ),
                        Container(
                          width: width*0.45,
                          height: height*0.08,
                          child: Row(
                            children: [
                              Icon(Icons.location_on_sharp,color: Colors.red,),
                              Text('chandini chioke ki \nchat ni boht mazxy ki',softWrap: true,)
                            ],
                          ),
                        ),
                        Container(
                          width: width*0.45,
                          height: height*0.08,
                          child: Row(
                            children: [
                              Icon(Icons.call,color: Colors.blue,),
                              Text('+92-3315003638',softWrap: true,)
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
          /// details
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(color:Colors.grey,width:width*0.12,height:width*0.007,),
              Text(" Details "),
              Container(color:Colors.grey,width:width*0.7,height:width*0.007,)
            ],
          ),
          Container(
            height: height*0.3,
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text("Name: Oppo F5"),
                        Text("Name: Oppo F5"),
                        Text("Name: Oppo F5"),
                        Text("Name: Oppo F5"),
                        Text("Name: Oppo F5"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Price:200"),
                        Text("Price:200"),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
          ///waranty
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(color:Colors.grey,width:width*0.12,height:width*0.007,),
              Text(" Warranty "),
              Container(color:Colors.grey,width:width*0.63,height:width*0.007,)
            ],
          ),
          Container(
            height: height*0.3,
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text("Check Warranty: 2 Day"),
                        Text("Phone Warranty: 2 Day"),
                      ],
                    ), Column(
                      children: [
                       ElevatedButton(onPressed: (){

                       }, child: Text("Buy"))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
           ///reviews
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(color:Colors.grey,width:width*0.12,height:width*0.007,),
              Text(" Reviews "),
              Container(color:Colors.grey,width:width*0.67,height:width*0.007,)
            ],
          ),
          Container(
            height: height*0.3,
            // color: Colors.green,
            child: ListView(
              children: [
                ListTile(
                  leading:CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text("Sharyer"),
                  isThreeLine: true,
                  subtitle: Row(
                    children: [
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star_border,color: Colors.amber),
                    ],
                  ),
                ),
                ListTile(
                  leading:CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text("Dianat"),
                  isThreeLine: true,
                  subtitle: Row(
                    children: [
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star_border,color: Colors.amber),
                    ],
                  ),
                ),
                ListTile(
                  leading:CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text("Dianat"),
                  isThreeLine: true,
                  subtitle: Row(
                    children: [
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star,color: Colors.amber),
                      Icon(Icons.star_border,color: Colors.amber),
                    ],
                  ),
                ),
              ],
            ),
          ),


        ],
      )
    );
  }
}
