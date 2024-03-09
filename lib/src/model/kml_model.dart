import 'package:flutter_riverpod/flutter_riverpod.dart';



import '../controllers/connection_controller.dart';


class KML{

  final WidgetRef ref;
  KML(this.ref);
  Future<String> renderInSlave(context, int slaveNo, String kml) async {
    try {
      await ref
          .read(clientProvider)
          ?.run("echo '$kml' > /var/www/html/kml/slave_$slaveNo.kml");
      return kml;
    } catch (error) {
      return '';
    }
  }

  
  static screenOverlay(String imageUrl, double factor) =>

      '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document id ="logo">
         <name>Shahzeel Ansari</name>
             <Folder>
                  <name>Splash Screen</name>
                  <ScreenOverlay>
                      <name>Logo</name>
                      <Icon><href>$imageUrl</href> </Icon>
                      <overlayXY x="0" y="1" xunits="fraction" yunits="fraction"/>
                      <screenXY x="0.025" y="0.95" xunits="fraction" yunits="fraction"/>
                      <rotationXY x="0" y="0" xunits="fraction" yunits="fraction"/>
                      <size x="300" y="${300 * factor}" xunits="pixels" yunits="pixels"/>
                  </ScreenOverlay>
             </Folder>
    </Document>
</kml>
''';


  static String lookAtLinear(double latitude, double longitude, double zoom,
          double tilt, double bearing) =>
      '<LookAt><longitude>$longitude</longitude><latitude>$latitude</latitude><range>$zoom</range><tilt>$tilt</tilt><heading>$bearing</heading><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>';


  static String orbitLookAtLinear(double latitude, double longitude,
          double zoom, double tilt, double bearing) =>
      '<gx:duration>2</gx:duration><gx:flyToMode>smooth</gx:flyToMode><LookAt><longitude>$longitude</longitude><latitude>$latitude</latitude><range>$zoom</range><tilt>$tilt</tilt><heading>$bearing</heading><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>';

  

  

}

