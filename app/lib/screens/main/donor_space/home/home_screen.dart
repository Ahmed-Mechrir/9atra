import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../config/colors.dart';
import '../../../../config/constants.dart';
import 'sub_screens/banks_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat(
      'MMMM',
    ).format(
      now,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: <Widget>[
                Container(
                  width: _width,
                  height: 170,
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Donneurs de sang au mois $formattedDate",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.grey_color_2,
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: _height * 0.11,
                                  //   child: SfSparkLineChart(
                                  //     trackball: const SparkChartTrackball(
                                  //       activationMode:
                                  //           SparkChartActivationMode.tap,
                                  //     ),
                                  //     marker: const SparkChartMarker(
                                  //       displayMode:
                                  //           SparkChartMarkerDisplayMode.all,
                                  //       color: AppColors.red_color,
                                  //       borderColor: AppColors.red_color,
                                  //     ),
                                  //     labelDisplayMode:
                                  //         SparkChartLabelDisplayMode.all,
                                  //     axisLineColor: Colors.transparent,
                                  //     color: AppColors.pink_color,
                                  //     labelStyle: const TextStyle(
                                  //       fontSize: 2,
                                  //       fontWeight: FontWeight.w100,
                                  //       color: Colors.transparent,
                                  //     ),
                                  //     data: const <double>[
                                  //       1,
                                  //       5,
                                  //       -6,
                                  //       0,
                                  //       1,
                                  //       -2,
                                  //       7,
                                  //       -7,
                                  //       -2,
                                  //       13,
                                  //       11,
                                  //       5,
                                  //       3
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IntrinsicWidth(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.red_color,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(
                                        5,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Countup(
                                            begin: 0,
                                            end: 36,
                                            duration: const Duration(
                                              seconds: 2,
                                            ),
                                            separator: ',',
                                            style: const TextStyle(
                                              color: AppColors.white_color,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          const Text(
                                            "Unités données",
                                            style: TextStyle(
                                              color: AppColors.white_color,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.red_color,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(
                                        5,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Countup(
                                            begin: 0,
                                            end: 155,
                                            duration: const Duration(
                                              seconds: 2,
                                            ),
                                            separator: ',',
                                            style: const TextStyle(
                                              color: AppColors.white_color,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          const Text(
                                            "Vies sauvées",
                                            style: TextStyle(
                                              color: AppColors.white_color,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: _height * 0.22,
            left: 0,
            right: 0,
            child: Container(
              transformAlignment: Alignment.center,
              width: _width,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Participez à une compagnie",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black_color,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(
                              () {
                                print("clicked");
                                print(AppConstants.profileScreen);
                                print(AppConstants.current_index);
                                AppConstants.profileScreen = true;
                                AppConstants.current_index = 1;
                                HapticFeedback.lightImpact();
                              },
                            );
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text(
                            'Voir tout',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.red_color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            secondary: Colors.transparent,
                          ),
                    ),
                    child: SizedBox(
                      width: _width,
                      height: _height * 0.45,
                      child: const ListCenterAssociationScreen(),
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
  }
}
