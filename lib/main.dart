import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'main_page.dart';
import 'package:page_transition/page_transition.dart';

var lightColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 255, 255, 255),
);

// var darkColorScheme = ColorScheme.fromSeed(
//   seedColor: const Color.fromARGB(255, 128, 143, 243),
// );

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then(
    (value) => runApp(
      const SmartWikiApp(),
    ),
  );

  runApp(
    const SmartWikiApp(),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(
            child: Lottie.asset('assets/splash_screen_animation.json'),
          ),
          Expanded(
            child: Text(
              'Smart Wiki',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'San Francisco',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      nextScreen: MainPage(),
      splashIconSize: 250,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      animationDuration: const Duration(seconds: 1),
    );
    // AnimatedSplashScreen(
    //   splash: Center(
    //     child: Lottie.asset(
    //       'assets/splash_screen_animation.json',
    //       width: 400,
    //       height: 4000,
    //       fit: BoxFit.fill,
    //     ),
    //   ),

    // Lottie.asset(
    //   'assets/splash_screen_animation.json',
    //   width: 200,
    //   height: 200,
    //   fit: BoxFit.fill,
    // ),
    // Text(
    //   'Smart Wiki',
    //   style: TextStyle(
    //       color: Colors.black,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 20.0),
    // )

    //   backgroundColor: Colors.white,
    //   duration: 4000,
    //   pageTransitionType: PageTransitionType.leftToRightWithFade,
    //   splashTransition: SplashTransition.fadeTransition,
    //   nextScreen: MainPage(),
    // );
  }
}

// Create a class with MaterialApp

class SmartWikiApp extends StatelessWidget {
  const SmartWikiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: lightColorScheme.onPrimaryContainer,
          foregroundColor: lightColorScheme.primary,
        ),
      ),
      // scaffold with text in center body
      title: 'SmartWiki',
      // theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
