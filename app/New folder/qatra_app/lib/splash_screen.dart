// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:qatra_app/utils/importations.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    Timer(const Duration(milliseconds: 700), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(const Duration(milliseconds: 7000), () {
      Navigator.of(context)
          .pushReplacement(SlideTransitionAnimation(const OnboardingScreen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white_color,
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? width : 0,
            height: height,
            color: AppColors.white_color,
          ),
          Center(
            child: SizedBox(
              width: width * 0.9,
              height: height * 0.4,
              child: Animator<double>(
                duration: const Duration(milliseconds: 1500),
                cycles: 0,
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 0.0, end: 15.0),
                builder: (context, animatorState, child) => Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(animatorState.value),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo_qatra_dark.png'),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    '© Copyright ' +
                        DateTime.now().year.toString() +
                        ' | Qatra',
                    style: const TextStyle(
                      color: AppColors.black_color,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                ],
              )),
        ],
      ),
    );
  }
}

// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text('HOME PAGE'),
//           centerTitle: true,
//           brightness: Brightness.dark,
//           backgroundColor: Colors.black),
//       body: const Center(
//         child: Text(
//           "APP HOME PAGE",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//       ),
//     );
//   }
// }

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
                textDirection: TextDirection.rtl,
                child: page,
              );
            });
}
