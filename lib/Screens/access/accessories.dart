import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/access/accessoriesDetails.dart';

class Accessories extends StatefulWidget {
  const Accessories({Key key}) : super(key: key);

  @override
  _AccessoriesState createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  double height=0;
  double width=0;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
        title: Text("Accessories"),
    centerTitle: true,

    ),
      backgroundColor: Color(0xfffffeea),
      body: ListView(
        children: [
          Padding(
            padding:EdgeInsets.all(8.0),
            child: Row(
              children: [
                box(height*0.25, width*0.95, Colors.grey,"acess/powerbank.jpg",Colors.white,"Power Banks"),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.all(8.0),
            child: Row(
              children: [
                box(height*0.25, width*0.46, Colors.grey,"acess/bcover.jpg",Colors.white,"Back Covers" ),
                SizedBox(width: width*0.035,),
                box(height*0.25, width*0.46, Colors.grey,"acess/airpod.jpg",Colors.amber,"Air Pods" ),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.all(8.0),
            child: Row(
              children: [
                box(height*0.2, width*0.55, Colors.grey,"acess/adapter.jpg",Colors.blue,"Adapters" ),
                SizedBox(width: width*0.035,),
                box(height*0.2, width*0.37, Colors.grey,"acess/watch.jpg",Colors.blue,"Smart Watch" ),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.all(8.0),
            child: Row(
              children: [
                box(height*0.18, width*0.46, Colors.grey,"acess/selfi.jpg",Colors.blue,"Selfi Stick"),
                SizedBox(width: width*0.02,),
                box(height*0.18, width*0.46, Colors.grey,"acess/cables.jpg" ,Colors.black,"USB Cables"),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.all(8.0),
            child: Row(
              children: [
                box(height*0.2, width*0.37, Colors.grey,"acess/head.jpg",Colors.black,"Head Phones" ),
                SizedBox(width: width*0.035,),
                box(height*0.2, width*0.55, Colors.grey,"acess/watch.jpg",Colors.black,"Pulled Accesories" ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget box(height,width,color,image,txtcolor,text){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>AccessoriesDetails(title: text,)));
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.exclusion)
          ),
          borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 0.3, //spread radius
                blurRadius: 5, // blur radius
                offset: Offset(2, 2),
              )
            ]

        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[

         Text(text,
          style: TextStyle(
              color: txtcolor,
              fontWeight: FontWeight.bold,
          fontSize: 15,
          ),)
        ]),
      ),
    );
  }
}
