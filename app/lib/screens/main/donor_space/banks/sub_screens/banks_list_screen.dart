// List of Centers and Associations ---------------------------------------------------------
import 'package:app_9atra/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../config/colors.dart';
import '../../../../../utils/local_data.dart';
import '../../../../../widgets/screen/screen_transition_widget.dart';
import '../../home/sub_screens/bank_details_screen.dart';

class BanksListScreen extends StatefulWidget {
  const BanksListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BanksListScreen> createState() => _BanksListScreenState();
}

class _BanksListScreenState extends State<BanksListScreen> {
  // Declarations
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(
      const Duration(
        milliseconds: 1000,
      ),
    );
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(
      const Duration(
        milliseconds: 1000,
      ),
    );
    AppLocalData.elementsCenter.add(
      (AppLocalData.elementsCenter.length + 1),
    );
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
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

    return AnimationLimiter(
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        header: const WaterDropMaterialHeader(
          color: Color.fromARGB(
            255,
            47,
            255,
            0,
          ),
          backgroundColor: AppColors.red_color,
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: AppLocalData.elementsCenter.length,
          padding: const EdgeInsets.only(
            top: 2,
          ),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(
                milliseconds: 100,
              ),
              child: SlideAnimation(
                duration: const Duration(
                  milliseconds: 2500,
                ),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(
                  duration: const Duration(
                    milliseconds: 3000,
                  ),
                  curve: Curves.fastLinearToSlowEaseIn,
                  flipAxis: FlipAxis.y,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        RightTransitionWidget(
                          const BanksDetailsScreen(),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                        left: 5,
                        right: 5,
                      ),
                      elevation: 3,
                      shadowColor: AppColors.grey_color_1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 110,
                        width: _width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: AssetImage(
                                          '${AppLocalData.elementsCenter[index]['image']}',
                                        ),
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover,
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 5,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                        color: AppColors.white_color,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.grey_color_1,
                                            blurRadius: 5,
                                            offset: Offset(
                                              0,
                                              0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${AppLocalData.elementsCenter[index]['rating']}',
                                              style: const TextStyle(
                                                color: AppColors.red_color,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: AppColors.red_color,
                                              size: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${AppLocalData.elementsCenter[index]['title']}'
                                                .toCapitalized(),
                                            maxLines: 2,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 13.0,
                                              color: AppColors.black_color,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            '${AppLocalData.elementsCenter[index]['subtitle']}'
                                                .toCapitalized(),
                                            maxLines: 1,
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.grey_color_2,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          const Icon(
                                            Icons.location_on,
                                            color: AppColors.grey_color_1,
                                            size: 14,
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            '${AppLocalData.elementsCenter[index]['city']}'
                                                .toCapitalized(),
                                            maxLines: 1,
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                            style: const TextStyle(
                                              fontSize: 11.0,
                                              color: AppColors.grey_color_2,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
