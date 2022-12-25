import 'package:app_9atra/utils/extentions.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter/material.dart';

import '../../../../../config/colors.dart';
import '../../../../../utils/local_data.dart';

class CurrentBanksListScreen extends StatefulWidget {
  const CurrentBanksListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentBanksListScreen> createState() => _CurrentBanksListScreenState();
}

class _CurrentBanksListScreenState extends State<CurrentBanksListScreen> {
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
    AppLocalData.elementsAssociation.add(
      (AppLocalData.elementsAssociation.length + 1),
    );
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  bool _participate = false;

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
          color: AppColors.white_color,
          backgroundColor: AppColors.red_color,
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: AppLocalData.elementsAssociation.length,
          padding: const EdgeInsets.only(
            top: 2,
          ),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
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
                  child: Card(
                    margin: const EdgeInsets.only(
                      bottom: 15,
                      left: 5,
                      right: 5,
                    ),
                    elevation: 3,
                    shadowColor: AppColors.grey_color_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
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
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     RightTransition(
                                  //         const DetailsAssociationScreen()));
                                },
                                child: Image(
                                  image: AssetImage(
                                    '${AppLocalData.elementsAssociation[index]['image']}',
                                  ),
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
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
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '${AppLocalData.elementsAssociation[index]['title']}'
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
                                              'De ${AppLocalData.elementsAssociation[index]['date_debut']} à ${AppLocalData.elementsAssociation[index]['date_fin']}'
                                                  .toCapitalized(),
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                                color: AppColors.grey_color_2,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            child: Row(
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
                                                  '${AppLocalData.elementsMyReservations[index]['city']}'
                                                      .toCapitalized(),
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  overflow: TextOverflow.fade,
                                                  style: const TextStyle(
                                                    fontSize: 11.0,
                                                    color:
                                                        AppColors.grey_color_2,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _participate = !_participate;
                                                });
                                              },
                                              child: Icon(
                                                _participate
                                                    ? Icons.back_hand_rounded
                                                    : Icons.back_hand_outlined,
                                                color: AppColors.red_color,
                                              )),
                                        ],
                                      ),
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
