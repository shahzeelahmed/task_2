import 'dart:math';


import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task_2/src/views/connection_view.dart';

import '../constants/util.dart';
import '../controllers/connection_controller.dart';
import '../model/kml_model.dart';



StateProvider<CameraPosition?> lastGMapPositionProvider =
    StateProvider((ref) => null);

StateProvider<int> rigsProvider = StateProvider((ref) => 3);

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final snackbar = SnackBar(
    duration: const Duration(seconds: 1),
                  
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'Not Connected to LG',
                    message:
                        'Please connect to LG and try again',

                   
                    contentType: ContentType.failure,
                  ),
                );
  orbitAround() async {
    try {
      for (int i = 0; i <= 360; i += 10) {
        await Future.delayed(const Duration(milliseconds: 1000));
        double latitude = 21.1403326;
        double longitude = 79.0554359;
        double zoom = 500;
        double tilt = 45;

        await ref.read(clientProvider)?.run(
            'echo "flytoview=${KML.orbitLookAtLinear(latitude, longitude, zoom, tilt, i.toDouble())}" > /tmp/query.txt');
        await Future.delayed(const Duration(milliseconds: 1000));
      }
    } catch (error) {
      print(e);
     
    }
  }

  flyTo(context, double latitude, double longitude, double zoom, double tilt,
      double bearing) async {
    try {
      await ref.read(clientProvider)?.run(
          'echo "flytoview=${KML.lookAtLinear(latitude, longitude, zoom, tilt, bearing)}" > /tmp/query.txt');
    } catch (error) {
      try {
        await flyTo(context, latitude, longitude, zoom, tilt, bearing);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(isConnectedProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1a1625),
        body: Column(
          children: [
            isConnected
                ? const Text(
                    'Connected',
                    style: TextStyle(color: Colors.white),
                  )
                : const Text(
                    'Disconnected',
                    style: TextStyle(color: Colors.white),
                  ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
                      onPressed: () async {
                        SingleChildScrollView(
                            child: await showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (context) =>
                                     const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                                PopupContainer()

                                            ])
                                        .animate()
                                        .scaleXY(
                                            delay: 100.ms,
                                            duration: 600.ms,
                                            begin: -1,
                                            curve: Curves.ease)
                                        .slideY(
                                            begin: -0.9,
                                            end: 0,
                                            delay: 2.ms,
                                            duration: 100.milliseconds,
                                            curve: Curves.easeInOutCubic)));
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 35,
                      )),
                )
              ],
            ),
            Center(
                child: Column(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffd29ddb)),
                        foregroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffffffff))),
                    onPressed: () async {
                      await flyTo(context, 21.1403326, 79.0554359, 500, 0, 0);
                    },
                    child: const Text('Fly to Home')),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffd29ddb)),
                        foregroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffffffff))),
                    onPressed: () async {
                      isConnected
                          ? showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                title: const Text('Warning'),
                                content: const Text(
                                    'Are you sure you want to Relaunch LG?'),
                                actions: [
                                  TextButton(
                                    child: const Text('cancel',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 176, 12, 0))),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                          color: Colors.green.shade600),
                                    ),
                                    onPressed: () async {
                                      await ref
                                          .read(relaunchProvider.notifier)
                                          .relaunchLG()
                                          .then((_) => Navigator.pop(context));
                                    },
                                  ),
                                ],
                              ),
                            )
                            :     

                ScaffoldMessenger.of(context)
                  
                  .showSnackBar(snackbar);
              
  
                          // : showDialog(
                          //     context: context,
                          //     builder: (_) => AlertDialog(
                          //           title: const Text('Not connected to LG'),
                          //           actions: [
                          //             TextButton(
                          //                 onPressed: () {
                          //                   Navigator.pop(context);
                          //                 },
                          //                 child: const Text('OK'))
                          //           ],
                          //         ));
                      // await showDialog(
                      //     context: context,
                      //     builder: (_) {
                      //       return const AlertDialog(

                      //       );
                      //     });
                    },
                    child: const Text('Relaunch')),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffd29ddb)),
                        foregroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffffffff))),
                    onPressed: () async {
                      await orbitAround();
                    },
                    child: const Text('Orbit')),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffd29ddb)),
                        foregroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffffffff))),
                    onPressed: () async {
                      await KML(ref).renderInSlave(
                          context,
                          2,
                          KML.screenOverlay(
                              'https://github.com/Mahy02/HAPIS-Refurbishment--Humanitarian-Aid-Panoramic-Interactive-System-/blob/week4/hapis/assets/images/cityBallon.png?raw=true',
                              Util.splashAspectRatio));
                    },
                    child: const Text('Overlay')),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
// 21.1403326
// 79.0554359