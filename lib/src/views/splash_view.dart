import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:task_2/src/views/home_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const HomeView()));
    });
  }


  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: SizedBox(
          height: mHeight,
          width: mWidth,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset(
                'assets/LIQUIDGALAXYLOGO_cropped.png',
                height: mHeight * 0.2,
                width: mWidth * 0.2,
              )
              .animate().slideX(begin: 1,curve: Curves.linearToEaseOut,duration: 700.ms).shimmer(delay: 200.ms, duration: 2.seconds)
              ,
            
              const Text('Liquid Galaxy',style: TextStyle(color:Colors.grey,fontWeight:  FontWeight.w400,fontSize: 30),)
              .animate()
            ]),
          )),
    );
  }
}