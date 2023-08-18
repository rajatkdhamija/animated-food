import 'package:flutter/material.dart';

class PreCacheImages {
  static Future<void> preCacheImages(BuildContext context) async {
    await Future.wait([
      precacheImage(const AssetImage('lib/assets/Plate-Black.png'), context),
      precacheImage(const AssetImage('lib/assets/Plate-Black-Outlined.png'), context),
      precacheImage(const AssetImage('lib/assets/Plate-White.png'), context),
      precacheImage(const AssetImage('lib/assets/Plate-White-Outlined.png'), context),
      precacheImage(const AssetImage('lib/assets/Plate-Lemon.png'), context),
      precacheImage(const AssetImage('lib/assets/Plate-Lemon-Outlined.png'), context),
    ]);
  }
}
