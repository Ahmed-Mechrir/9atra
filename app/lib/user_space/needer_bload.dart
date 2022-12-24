// ignore_for_file: library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:app_9atra/utils/importations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NeederBloadScreen extends StatefulWidget {
  const NeederBloadScreen({Key? key}) : super(key: key);

  @override
  _NeederBloadScreenState createState() => _NeederBloadScreenState();
}

class _NeederBloadScreenState extends State<NeederBloadScreen> {
  // Declarations
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    AppLocalData.elementsNeeder.add((AppLocalData.elementsNeeder.length + 1));
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
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
                      "Demandes urgentes",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white_bg_color,
                      ),
                    ),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.filter_alt_rounded,
                        color: AppColors.white_bg_color,
                        size: 18,
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                      ),
                      label: const Text(
                        'Filtre',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white_bg_color,
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
                child: Container(
                  width: _width,
                  height: _height * 0.66,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white_bg_color,
                  ),
                  margin: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: AnimationLimiter(
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
                        itemCount: AppLocalData.elementsNeeder.length,
                        padding: const EdgeInsets.only(top: 2),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              horizontalOffset: 30,
                              verticalOffset: 300.0,
                              child: FlipAnimation(
                                duration: const Duration(milliseconds: 3000),
                                curve: Curves.fastLinearToSlowEaseIn,
                                flipAxis: FlipAxis.y,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        RightTransition(
                                            const ReserveDonationScreen()));
                                  },
                                  child: Card(
                                    margin: const EdgeInsets.only(
                                      bottom: 15,
                                      right: 5,
                                      left: 5,
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
                                            flex: 1,
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        AppColors.grey_color_2,
                                                  ),
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        top: _height * 0.015,
                                                      ),
                                                      child: Text(
                                                        '${AppLocalData.elementsNeeder[index]['type']}',
                                                        style: const TextStyle(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .white_color,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  right: 0,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: _height * 0.03,
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        '${AppLocalData.elementsNeeder[index]['state']}'
                                                            .toCapitalized(),
                                                        style: const TextStyle(
                                                          color: AppColors
                                                              .white_color,
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
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
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${AppLocalData.elementsNeeder[index]['full_name']}'
                                                              .toCapitalized(),
                                                          maxLines: 1,
                                                          softWrap: true,
                                                          overflow:
                                                              TextOverflow.fade,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 13.0,
                                                            color: AppColors
                                                                .black_color,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 3,
                                                        ),
                                                        Text(
                                                          AppLocalData
                                                                  .elementsNeeder[
                                                                      index]
                                                                      ['age']
                                                                  .toString() +
                                                              ' années . ' +
                                                              '${AppLocalData.elementsNeeder[index]['gender']}'
                                                                  .toCapitalized(),
                                                          maxLines: 1,
                                                          softWrap: false,
                                                          overflow:
                                                              TextOverflow.fade,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12.0,
                                                            color: AppColors
                                                                .grey_color_2,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 3,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            const Icon(
                                                              Icons
                                                                  .water_drop_rounded,
                                                              color: Colors.red,
                                                              size: 14,
                                                            ),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              'Besoin de ${AppLocalData.elementsNeeder[index]['litre_sang']}L',
                                                              maxLines: 1,
                                                              softWrap: false,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12.0,
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
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
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: <Widget>[
                                                        SizedBox(
                                                          child: Row(
                                                            children: <Widget>[
                                                              const Icon(
                                                                Icons
                                                                    .calendar_month_outlined,
                                                                color: AppColors
                                                                    .grey_color_1,
                                                                size: 14,
                                                              ),
                                                              const SizedBox(
                                                                width: 3,
                                                              ),
                                                              Text(
                                                                '${AppLocalData.elementsNeeder[index]['published_date']}'
                                                                    .toCapitalized(),
                                                                maxLines: 1,
                                                                softWrap: false,
                                                                overflow:
                                                                    TextOverflow
                                                                        .fade,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize:
                                                                      11.0,
                                                                  color: AppColors
                                                                      .grey_color_2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                          child: Row(
                                                            children: <Widget>[
                                                              const Icon(
                                                                Icons
                                                                    .timelapse_rounded,
                                                                color: AppColors
                                                                    .grey_color_1,
                                                                size: 14,
                                                              ),
                                                              const SizedBox(
                                                                width: 3,
                                                              ),
                                                              Text(
                                                                '${AppLocalData.elementsNeeder[index]['published_time']}'
                                                                    .toCapitalized(),
                                                                maxLines: 1,
                                                                softWrap: false,
                                                                overflow:
                                                                    TextOverflow
                                                                        .fade,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize:
                                                                      11.0,
                                                                  color: AppColors
                                                                      .grey_color_2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ],
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
