import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';


// 
class Util {

  static double splashAspectRatio = 2864 / 3000;
  static double lgZoomScale = 130000000.0;
  
  static CameraPosition initialMapPosition = const CameraPosition(
    target: LatLng(51.4769, 0.0),
    zoom: 2,
  );
}