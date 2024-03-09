// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:task_2/views/connection_view.dart';

// class HomeView extends ConsumerStatefulWidget {
//   const HomeView({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
// }

// class _HomeViewState extends ConsumerState<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: const Color(0xff1a1625),
//         body: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: IconButton(
//                       onPressed: () async {
//                          await showDialog(
//                         barrierDismissible: true,
//                         context: context,
//                         builder: (context) => const Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [ConnectionView()])
//                             .animate()
//                             .scaleXY(
//                                 delay: 100.ms,
//                                 duration: 600.ms,
//                                 begin: -1,
//                                 curve: Curves.ease)
//                             .slideY(
//                                 begin: -0.9,
//                                 end: 0,
//                                 delay: 2.ms,
//                                 duration: 100.milliseconds,
//                                 curve: Curves.easeInOutCubic));
//                       },
//                       icon: const Icon(
//                         Icons.settings,
//                         color: Colors.white,
//                         size: 35,
//                       )),
//                 )
//               ],
//             ),
//             Center(
//                 child: ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateColor.resolveWith(
//                             (states) => const Color(0xffd29ddb)),
//                         foregroundColor: MaterialStateColor.resolveWith(
//                             (states) => const Color(0xffffffff))),
//                     onPressed: () async {
//                       // ref.read(flyProvider);
//                     },
//                     child: const Text('Fly to Home'))),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:task_2/src/views/connection_view.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
 





  @override
  Widget build(BuildContext context) {
    // final isConnected = ref.watch(isConnectedProvider);

    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    // final util = Utils();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff212121),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
               
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                  onPressed: () async {
                    await showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [PopupContainer()])
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
                                curve: Curves.easeInOutCubic));
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  color: Colors.white,
                )
              ]),
            ],
          ),
          SizedBox(
            height: mHeight * 0.1,
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [Container()],
          // ),

          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: mHeight / 4,
                      width: 0.2,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 75, 49, 224),
                          spreadRadius: 6,
                          blurRadius: 8,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(255, 225, 179, 255),
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      ]),
                    )
                  ],
                ),
              ),
             const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Control ',
                            // style: GoogleFonts.titilliumWeb(
                            //     fontWeight: FontWeight.w700,
                            //     color: Colors.white,
                            //     fontSize: 35
                            //     )
                                ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Liquid Galaxy',
                              // style: GoogleFonts.titilliumWeb(
                              //     fontWeight: FontWeight.w700,
                              //     color: Colors.white,
                              //     fontSize: 35)
                                  ),
                        ),
                        Text('Using Your',
                            // style: GoogleFonts.titilliumWeb(
                            //     fontWeight: FontWeight.w700,
                            //     color: Colors.white,
                            //     fontSize: 35)
                                ),
                        Text('Face',
                            // style: GoogleFonts.titilliumWeb(
                            //     fontWeight: FontWeight.w700,
                            //     color: Colors.white,
                            //     fontSize: 35)
                                ),
                      ],
                    ),
                  ),
                ],
              ),

              // Container(
              //   width: mWidth,
              //   height: mHeight / 2,
              // ),

              
            ],
          ),
          SizedBox(
            height: mHeight * 0.1,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: mHeight * 0.06,
                  width: mWidth * 0.3,
                  decoration: BoxDecoration(
                    color: const Color(0xffbb86fc),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.help_outline_rounded),
                        Text(
                          'ABOUT',
                          // style: GoogleFonts.roboto(color: Colors.white),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: mHeight * 0.05,
              ),
              Container(
                height: mHeight * 0.06,
                width: mWidth * 0.3,
                decoration: BoxDecoration(
                  color: const Color(0xffbb86fc),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.play_arrow_rounded),
                      Text(
                        'START',
                       
                      )
                    ]),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
