import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/colors.dart';
import '../../../../widgets/screen/screen_transition_widget.dart';
import '../signin/sign_in_screen.dart';
import '../signup/sign_up_screen.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    String greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Bonjour,';
      }
      if (hour < 17) {
        return 'Bonne après-midi,';
      }
      return 'Bonsoir,';
    }

    return Scaffold(
      backgroundColor: AppColors.red_color,
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: _height * 0.3,
                ),
                Entry.scale(
                  delay: const Duration(
                    milliseconds: 200,
                  ),
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                  child: SizedBox(
                    width: _width * 0.9,
                    height: _height * 0.4,
                    child: Image.asset(
                      'assets/images/logo_qatra_light.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: AppColors.pink_color.withOpacity(
                  0.2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    2000,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                top: _height * 0.09,
                left: _width * 0.05,
              ),
              child: Entry.opacity(
                delay: const Duration(
                  milliseconds: 400,
                ),
                duration: const Duration(
                  milliseconds: 1000,
                ),
                child: Text(
                  '${greeting()}\ncontent de vous revoir',
                  // greeting() + '\nwelcome back',
                  style: TextStyle(
                    fontSize: _height * 0.028,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white_color,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: _height * 0.02,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Entry.offset(
                    delay: const Duration(
                      milliseconds: 280,
                    ),
                    duration: const Duration(
                      milliseconds: 1400,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(
                          0,
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          AppColors.white_color,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          BottomTransitionWidget(
                            const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Se connecter',
                        // 'Sign in',
                        style: TextStyle(
                          color: AppColors.red_color,
                          fontSize: 20,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Entry.offset(
                    delay: const Duration(
                      milliseconds: 280,
                    ),
                    duration: const Duration(
                      milliseconds: 1800,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(
                          0,
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          AppColors.red_color,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        shadowColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          BottomTransitionWidget(
                            const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        // 'Create account',
                        'Créer un compte',
                        style: TextStyle(
                          color: AppColors.white_color,
                          fontSize: 20,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
