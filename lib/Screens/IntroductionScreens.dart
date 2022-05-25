import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mobile_app/authantication/login.dart';

import 'Dashboard.dart';

class IntroductionScreens extends StatefulWidget {
  const IntroductionScreens({Key key}) : super(key: key);

  @override
  _IntroductionScreensState createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {
  final introKey = GlobalKey<IntroductionScreenState>();
  // Color mainColor=Color(0xff0B1940);
  Color mainColor=HexColor("#0B1940");
  Color orangeColor=HexColor("#FC8804");

  @override
  Widget build(BuildContext context) {
     dynamic bodyStyle = TextStyle(fontSize: 19.0,color: Colors.white);

     dynamic pageDecoration =  PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,color:Colors.black),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,

    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            // child: _buildImage('flutter.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(

          child: const Text(
            'Let\s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color:Colors.white),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(

          title: "Buy New Mobile",
          body:
          "One and Only Market place App.",
          image: _buildImage('newMObile.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Sell Old Mobile",
          body:
          "Sign up and you can sell your old Phone.",
          image: _buildImage('sellmobile.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Need Accessories",
          body:
          "All kinds of Accessories were available On a single Click.",
          image: _buildImage("acess.jpg"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "You Have Dead Phone??",
          body:
          "No Need To Worry About That.\nYou Can Sell Them Also.",
          image: _buildImage("dead phone.jpg"),
          decoration: pageDecoration
        ),
        // PageViewModel(
        //   title: "We Have Lots More",
        //   body: "Explore",
        //   image: _buildImage("dead phone.jpg"),
        //   decoration: pageDecoration,
        // ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return CircleAvatar(
      radius: 140,
      backgroundImage: AssetImage('images/$assetName'),

    );
  }


  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Login()),
    );
  }
}
