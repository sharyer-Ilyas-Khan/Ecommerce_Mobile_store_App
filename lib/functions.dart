
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class Functions{
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
    }
  }
  }