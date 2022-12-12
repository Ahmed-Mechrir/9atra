// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, non_constant_identifier_names

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qatra_app/utils/importations.dart';
import 'package:geolocator/geolocator.dart';

// Default toast ------------------------------------------------------------------------
Future<bool?> defaultToastWidget(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: AppColors.black_color.withOpacity(0.6),
    textColor: AppColors.white_color,
    fontSize: 12.0,
  );
}

// Error toast ---------------------------------------------------------------------------
Future<bool?> errorToastWidget(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: AppColors.red_color.withOpacity(0.6),
    textColor: AppColors.white_color,
    fontSize: 12.0,
  );
}

// Screen transitions ---------------------------------------------------------------------
class BottomTransition extends PageRouteBuilder {
  final Widget page;

  BottomTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class TopTransition extends PageRouteBuilder {
  final Widget page;

  TopTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.topCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class CenterTransition extends PageRouteBuilder {
  final Widget page;

  CenterTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class LeftTransition extends PageRouteBuilder {
  final Widget page;

  LeftTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.centerLeft,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class RightTransition extends PageRouteBuilder {
  final Widget page;

  RightTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.centerRight,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

// My custom behavior (Hide grow)  ---------------------------------------------------------
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

// My custom stepper  ---------------------------------------------------------
class MyStepper extends StatelessWidget {
  final double width;
  final int totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;
  final List<IconData> icons;
  const MyStepper({
    Key? key,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
    required this.icons,
  })  : assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        children: _steps(),
      ),
    );
  }

  getCircleColor(i) {
    Color color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = currentStepColor;
    } else {
      color = AppColors.white_color;
    }
    return color;
  }

  getBorderColor(i) {
    Color color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = currentStepColor;
    } else {
      color = inactiveColor;
    }

    return color;
  }

  getLineColor(i) {
    var color = curStep > i + 1
        ? AppColors.pink_color.withOpacity(0.4)
        : AppColors.pink_color.withOpacity(0.4);
    return color;
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      //colors according to state
      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);

      // step circles
      list.add(
        Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: const BorderRadius.all(Radius.circular(200.0)),
            border: Border.all(
              color: borderColor,
              width: 0,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black_color.withOpacity(0.15),
                offset: const Offset(0, 0),
                blurRadius: 15,
              ),
            ],
          ),
          child: getInnerElementOfStepper(i),
        ),
      );

      //line between step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color: lineColor,
            ),
          ),
        );
      }
    }

    return list;
  }

  Widget getInnerElementOfStepper(index) {
    if (index + 1 < curStep) {
      return const Icon(
        Icons.check,
        color: AppColors.white_color,
        size: 22.0,
      );
    } else if (index + 1 == curStep) {
      return Center(
        child: Icon(
          icons[index],
          color: AppColors.red_color,
        ),
      );
    } else {
      return Container();
    }
  }
}

// List of Centers and Associations ---------------------------------------------------------
class CentersAssociationsList extends StatefulWidget {
  const CentersAssociationsList({
    Key? key,
  }) : super(key: key);

  @override
  _CentersAssociationsListState createState() =>
      _CentersAssociationsListState();
}

class _CentersAssociationsListState extends State<CentersAssociationsList> {
  // Declarations
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    AppLocalData.elementsCenter.add((AppLocalData.elementsCenter.length + 1));
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

    return AnimationLimiter(
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        header: const WaterDropMaterialHeader(
          color: Color.fromARGB(255, 47, 255, 0),
          backgroundColor: AppColors.red_color,
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: AppLocalData.elementsCenter.length,
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
                              const DetailsCenterAssociationScreen()));
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
}

// List of Current Associations ---------------------------------------------------------
class CurrentAssociationsList extends StatefulWidget {
  const CurrentAssociationsList({
    Key? key,
  }) : super(key: key);

  @override
  _CurrentAssociationsListState createState() =>
      _CurrentAssociationsListState();
}

class _CurrentAssociationsListState extends State<CurrentAssociationsList> {
  // Declarations
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    AppLocalData.elementsAssociation
        .add((AppLocalData.elementsAssociation.length + 1));
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
  void dispose() {
    super.dispose();
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
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
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
}

// Google Map for all centers and associations  ---------------------------------------------------------
class CentersAssociationsMap extends StatefulWidget {
  const CentersAssociationsMap({
    Key? key,
  }) : super(key: key);

  @override
  _CentersAssociationsMapState createState() => _CentersAssociationsMapState();
}

class _CentersAssociationsMapState extends State<CentersAssociationsMap> {
  // Declarations
  late GoogleMapController _googleMapController;
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  var maptype = MapType.normal;
  Icon mapicon =
      const Icon(Icons.map_outlined, size: 30, color: AppColors.red_color);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(33.9715904, -6.8498129),
          zoom: 5,
        ),
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: false,
        onMapCreated: (controller) => _googleMapController = controller,
        onLongPress: null,
        mapType: maptype,
        markers: {
          for (final element in AppLocalData.elementsLocations)
            Marker(
              markerId: MarkerId(element['type']),
              position: LatLng(
                double.parse(element['lat_pos']),
                double.parse(element['lng_pos']),
              ),
              infoWindow: InfoWindow(
                title: element['type'],
                snippet: '',
              ),
              anchor: const Offset(0.5, 0.5),
              zIndex: 1,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: SizedBox(
        height: _height * 0.16,
        width: _width * 0.12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: AppColors.white_color,
              foregroundColor: AppColors.red_color,
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(
                    target: LatLng(33.9715904, -6.8498129),
                    zoom: 12,
                  ),
                ),
              ),
              child: const Icon(Icons.center_focus_strong, size: 25),
            ),
            const SizedBox(height: 5),
            FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: AppColors.white_color,
              foregroundColor: AppColors.red_color,
              onPressed: () {
                setState(() {
                  (maptype == MapType.normal)
                      ? maptype = MapType.hybrid
                      : maptype = MapType.normal;
                  (maptype == MapType.normal)
                      ? mapicon = const Icon(Icons.map_outlined,
                          size: 30, color: AppColors.red_color)
                      : mapicon = const Icon(Icons.map_rounded,
                          size: 30, color: AppColors.red_color);
                });
              },
              child: mapicon,
            )
          ],
        ),
      ),
    );
  }
}

// Google Map for single center or association  ---------------------------------------------------------
class CenterAssociationMap extends StatefulWidget {
  const CenterAssociationMap({
    Key? key,
    required this.longitude_pos,
    required this.latitude_pos,
    required this.title,
  }) : super(key: key);

  final double latitude_pos;
  final double longitude_pos;
  final String title;

  @override
  _CenterAssociationMapState createState() => _CenterAssociationMapState();
}

class _CenterAssociationMapState extends State<CenterAssociationMap> {
  // Declarations
  late GoogleMapController _googleMapController;
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  var maptype = MapType.normal;
  Icon mapicon =
      const Icon(Icons.map_outlined, size: 30, color: AppColors.red_color);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude_pos, widget.longitude_pos),
          zoom: 5,
        ),
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: false,
        onMapCreated: (controller) => _googleMapController = controller,
        onLongPress: null,
        mapType: maptype,
        markers: {
          Marker(
            markerId: MarkerId(widget.title),
            position: LatLng(widget.latitude_pos, widget.longitude_pos),
            infoWindow: InfoWindow(
              title: widget.title,
              snippet: '',
            ),
            anchor: const Offset(0.5, 0.5),
            zIndex: 1,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: SizedBox(
        height: _height * 0.16,
        width: _width * 0.12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: AppColors.white_color,
              foregroundColor: AppColors.red_color,
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(widget.latitude_pos, widget.longitude_pos),
                    zoom: 12,
                  ),
                ),
              ),
              child: const Icon(Icons.center_focus_strong, size: 25),
            ),
            const SizedBox(height: 5),
            FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: AppColors.white_color,
              foregroundColor: AppColors.red_color,
              onPressed: () {
                setState(() {
                  (maptype == MapType.normal)
                      ? maptype = MapType.hybrid
                      : maptype = MapType.normal;
                  (maptype == MapType.normal)
                      ? mapicon = const Icon(Icons.map_outlined,
                          size: 30, color: AppColors.red_color)
                      : mapicon = const Icon(Icons.map_rounded,
                          size: 30, color: AppColors.red_color);
                });
              },
              child: mapicon,
            )
          ],
        ),
      ),
    );
  }
}

// Card Help  ---------------------------------------------------------
class CardHelp extends StatefulWidget {
  const CardHelp(
      {Key? key,
      required this.index,
      required this.cardColor,
      required this.svgIcon,
      required this.svgIconColor,
      required this.bgIconColor,
      required this.title,
      required this.titleColor,
      required this.action})
      : super(key: key);

  final int index;
  final Color cardColor;
  final String svgIcon;
  final Color svgIconColor;
  final Color bgIconColor;
  final String title;
  final Color titleColor;
  final Function action;

  @override
  _CardHelpState createState() => _CardHelpState();
}

class _CardHelpState extends State<CardHelp>
    with SingleTickerProviderStateMixin {
  // Declarations
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

    return Transform.translate(
      offset: const Offset(0, 3),
      child: InkWell(
        enableFeedback: true,
        onTap: () => widget.action(),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 14),
          padding: EdgeInsets.all(_width / 20),
          width: _width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey_color_2.withOpacity(0.3),
                offset: const Offset(0, 0),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: widget.bgIconColor,
                radius: _width / 15,
                child: SvgPicture.asset(
                  widget.svgIcon,
                  alignment: Alignment.center,
                  color: widget.svgIconColor,
                  height: _height * 0.035,
                ),
              ),
              SizedBox(
                width: _width * 0.02,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            widget.title.toCapitalized(),
                            textScaleFactor: 1.1,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: widget.titleColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: _width * 0.04,
              ),
              Icon(Icons.navigate_next_outlined, size: _width * .08),
            ],
          ),
        ),
      ),
    );
  }
}

// Card Profile  ---------------------------------------------------------
class CardProfile extends StatefulWidget {
  const CardProfile(
      {Key? key,
      required this.cardColor,
      required this.icon,
      required this.iconColor,
      required this.bgIconColor,
      required this.title,
      required this.titleColor,
      required this.linkIcon,
      required this.action})
      : super(key: key);

  final Color cardColor;
  final IconData icon;
  final Color iconColor;
  final Color bgIconColor;
  final String title;
  final Color titleColor;
  final bool linkIcon;
  final Function action;

  @override
  _CardProfileState createState() => _CardProfileState();
}

class _CardProfileState extends State<CardProfile>
    with SingleTickerProviderStateMixin {
  // Declarations
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

    return InkWell(
      enableFeedback: true,
      onTap: () => widget.action(),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        color: widget.cardColor,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: widget.bgIconColor,
                  radius: _width / 15,
                  child: Icon(
                    widget.icon,
                    size: 30,
                    color: widget.iconColor,
                  ),
                ),
                SizedBox(
                  width: _width * 0.01,
                ),
                Text(
                  widget.title,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: widget.titleColor,
                  ),
                ),
              ],
            ),
            Icon(Icons.navigate_next_outlined,
                size: (widget.linkIcon == true) ? _width * .08 : 0),
          ],
        ),
      ),
    );
  }
}

// My Unordered List ---------------------------------------------------------
class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts);
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      widgetList.add(UnorderedListItem(text));
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text("•", style: TextStyle(color: AppColors.grey_color_2)),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                ' $text',
                style: TextStyle(
                  color: AppColors.black_color,
                  fontSize: _width * 0.036,
                ),
              ),
              SizedBox(
                height: _height * 0.02,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// QR code generator ---------------------------------------------------------
StatefulWidget generatedQRCode(BuildContext context, String data, double size) {
  return QrImage(
    data: data,
    version: QrVersions.auto,
    size: size,
  );
}

// Slide Right and Left Background ---------------------------------------------------------
Widget slideRightBackground() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: [
          AppColors.white_bg_color,
          Colors.yellow.shade50,
          Colors.yellow.shade700,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.yellow.shade700,
          ),
          Text(
            " Modifier",
            style: TextStyle(
              color: Colors.yellow.shade700,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
  );
}

Widget slideLeftBackground() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: [
          Colors.red.shade700,
          Colors.red.shade100,
          AppColors.white_bg_color,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          Icon(
            Icons.delete,
            color: Colors.red,
          ),
          Text(
            " Supprimer",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}
