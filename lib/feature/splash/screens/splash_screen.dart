// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:rentz/constants/global_constants.dart';
// import 'package:rentz/feature/onboarding/screens/onboarding_screen1.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );

//     _animation = Tween<double>(begin: 2.0, end: 1.0).animate(_controller)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           // After 2 seconds, navigate to the next screen
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const OnBoardingScreen1(),
//             ),
//           );
//         }
//       });

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: GlobalConstants.secondaryColor,
//         child: Center(
//           child: AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               return Transform.scale(
//                 scale: _animation.value,
//                 child: child,
//               );
//             },
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   "assets/images/splash_first_logo.svg",
//                   height: 62,
//                   width: 43.165,
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ), // Adding some spacing between SVG and text
//                 Hero(
//                   tag: 'Rentz',
//                   createRectTween: (begin, end) {
//                     // Custom RectTween for spring-like animation
//                     return RectTween(
//                       begin: Rect.fromCenter(
//                         center: Offset(MediaQuery.of(context).size.width / 2,
//                             MediaQuery.of(context).size.height / 2),
//                         width: 0,
//                         height: 0,
//                       ),
//                       end: Rect.fromCenter(
//                         center:
//                             Offset(MediaQuery.of(context).size.width / 2, 0),
//                         width: begin?.width ?? 0,
//                         height: begin?.height ?? 0,
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     'Rentz',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white,
//                       shadows: [
//                         Shadow(
//                           offset: Offset(0, 2.236734628677368),
//                           blurRadius: 10,
//                           color: Color.fromRGBO(0, 27, 51, 0.10),
//                         ),
//                       ],
//                       fontSize: 50.0,
//                       height: 1.0,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentz/constants/global_constants.dart';
import 'package:rentz/feature/onboarding/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 2.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // After 2 seconds, navigate to the next screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            ),
          );
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: GlobalConstants.secondaryColor,
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: child,
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/splash_first_logo.svg",
                  height: 62,
                  width: 43.165,
                ),
                const SizedBox(
                  height: 24,
                ), // Adding some spacing between SVG and text
                Hero(
                  tag: 'Rentz',
                  createRectTween: (begin, end) {
                    // Custom RectTween for spring-like animation
                    return RectTween(
                      begin: Rect.fromCenter(
                        center: Offset(MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.height / 2),
                        width: 0,
                        height: 0,
                      ),
                      end: Rect.fromCenter(
                        center:
                            Offset(MediaQuery.of(context).size.width / 2, 0),
                        width: begin?.width ?? 0,
                        height: begin?.height ?? 0,
                      ),
                    );
                  },
                  child: const Text(
                    'Rentz',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 2.236734628677368),
                          blurRadius: 10,
                          color: Color.fromRGBO(0, 27, 51, 0.10),
                        ),
                      ],
                      fontSize: 50.0,
                      height: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
