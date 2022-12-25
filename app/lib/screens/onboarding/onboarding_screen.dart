import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/colors.dart';
import '../../widgets/screen/screen_transition_widget.dart';
import '../main/auth/connection/connection_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Padding(
      padding: isActive
          ? const EdgeInsets.only(top: 8.0)
          : const EdgeInsets.all(0.0),
      child: Icon(
        isActive ? Icons.water_drop_sharp : Icons.water_drop_outlined,
        size: 26.0,
        color: isActive ? AppColors.red_color : AppColors.grey_color_1,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white_color,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: _height * 0.80,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: _height * 0.015),
                      SvgPicture.asset(
                        'assets/svg/illust_onboarding_part_1.svg',
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 1.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Column(
                          children: const <Widget>[
                            // const Text(
                            //   'Don du sang',
                            //   // Blood donation
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     color: Color(0xff010A65),
                            //     fontFamily: 'CM Sans Serif',
                            //     fontSize: 26.0,
                            //     fontWeight: FontWeight.w500,
                            //     height: 1.5,
                            //   ),
                            // ),
                            // SizedBox(height: _height * 0.009),
                            Text(
                              'Découvrez les banques de sang à proximité et restez informé de leur demande récente et urgente',
                              // 'Discover nearby blood banks and stay updated on their recent and urgent request',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.black_color,
                                fontSize: 18.0,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: _height * 0.015),
                      SvgPicture.asset(
                        'assets/svg/illust_onboarding_part_2.svg',
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 1.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Column(
                          children: const <Widget>[
                            // const Text(
                            //   'Trouver votre groupe sanguin',
                            //   // Find you blood type
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     color: Color(0xff010A65),
                            //     fontFamily: 'CM Sans Serif',
                            //     fontSize: 26.0,
                            //     fontWeight: FontWeight.w500,
                            //     height: 1.5,
                            //   ),
                            // ),
                            // SizedBox(height: _height * 0.009),
                            Text(
                              'Demandez votre groupe sanguin à des donneurs passionnés dans votre région ou votre pays',
                              // Request your blood type from passionate donors in your area or country
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.black_color,
                                fontSize: 18.0,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: _height * 0.015),
                      SvgPicture.asset(
                        'assets/svg/illust_onboarding_part_3.svg',
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 1.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Column(
                          children: const <Widget>[
                            // const Text(
                            //   'Consultez les campagnes',
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     color: Color(0xff010A65),
                            //     fontFamily: 'CM Sans Serif',
                            //     fontSize: 26.0,
                            //     fontWeight: FontWeight.w500,
                            //     height: 1.5,
                            //   ),
                            // ),
                            // SizedBox(height: _height * 0.009),
                            Text(
                              'Cherchez des campagnes de sensibilisation à la prise de sang ayant lieu ce moment',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.black_color,
                                fontSize: 18.0,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: _height * 0.003),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.white_color,
        height: _height * 0.12,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              (_currentPage == _numPages - 1)
                  ? Container()
                  : Entry(
                      delay: const Duration(
                        milliseconds: 800,
                      ),
                      duration: const Duration(
                        milliseconds: 700,
                      ),
                      yOffset: 0,
                      xOffset: -800,
                      curve: Curves.fastOutSlowIn,
                      child: Entry(
                        delay: const Duration(
                          milliseconds: 1000,
                        ),
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        curve: Curves.ease,
                        opacity: 0.5,
                        scale: 0,
                        child: TextButton(
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: AppColors.black_color,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              RightTransitionWidget(
                                const ConnectionScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
              Entry(
                delay: const Duration(
                  milliseconds: 800,
                ),
                duration: const Duration(
                  milliseconds: 700,
                ),
                yOffset: 0,
                xOffset: 800,
                curve: Curves.fastOutSlowIn,
                child: Entry(
                  delay: const Duration(
                    milliseconds: 1000,
                  ),
                  duration: const Duration(
                    milliseconds: 250,
                  ),
                  curve: Curves.ease,
                  opacity: 0.5,
                  scale: 0,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          200,
                        ),
                        boxShadow: (_currentPage == _numPages - 1)
                            ? [
                                BoxShadow(
                                  color: AppColors.red_color.withOpacity(
                                    0.4,
                                  ),
                                  offset: const Offset(0, 0),
                                  blurRadius: 15,
                                ),
                              ]
                            : [
                                BoxShadow(
                                  color: AppColors.black_color.withOpacity(
                                    0.15,
                                  ),
                                  offset: const Offset(0, 0),
                                  blurRadius: 15,
                                ),
                              ],
                        color: (_currentPage == _numPages - 1)
                            ? AppColors.red_color
                            : AppColors.white_color,
                      ),
                      child: Icon(Icons.arrow_forward,
                          color: (_currentPage == _numPages - 1)
                              ? AppColors.white_color
                              : AppColors.red_color,
                          size: 30.0),
                    ),
                    onTap: () {
                      (_currentPage == _numPages - 1)
                          ? Navigator.pushReplacement(
                              context,
                              RightTransitionWidget(
                                const ConnectionScreen(),
                              ),
                            )
                          : _pageController.nextPage(
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.ease,
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
