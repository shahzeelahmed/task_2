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
      backgroundColor: const Color(0xff1a1625),
      body: SizedBox(
          height: mHeight,
          width: mWidth,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
              Image.network(
                
                	'https://github.com/shahzeelahmed/task_2/blob/main/assets/LIQUIDGALAXYLOGO_cropped.png?raw=true',
                height: mHeight * 0.2,
                width: mWidth * 0.2,
              )
              .animate().slideX(begin: 1,curve: Curves.linearToEaseOut,duration: 700.ms).shimmer(color: Colors.grey.shade400, delay: 400.ms, duration: 4.seconds)
              ,
            
              const Text('Liquid Galaxy',style: TextStyle(color:Colors.grey,fontWeight:  FontWeight.w400,fontSize: 30),)
              .animate()
            ]),
          )),
    );
  }
}
