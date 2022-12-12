// ignore_for_file: library_private_types_in_public_api

import 'package:qatra_app/utils/importations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListFAQScreen extends StatefulWidget {
  const ListFAQScreen({Key? key}) : super(key: key);

  @override
  _ListFAQScreenState createState() => _ListFAQScreenState();
}

class _ListFAQScreenState extends State<ListFAQScreen> {
  // Declarations
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    AppLocalData.elementsFAQ.add((AppLocalData.elementsFAQ.length + 1));
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Container(
            transformAlignment: Alignment.center,
            width: _width,
            height: _height * 0.66,
            padding: const EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      secondary: Colors.transparent,
                    ),
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
                    itemCount: AppLocalData.elementsFAQ.length,
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
                            child: CardHelp(
                              cardColor: Colors.white,
                              title: AppLocalData.elementsFAQ[index]['question'],
                              titleColor: Colors.black,
                              svgIcon: 'assets/svg/response_icon.svg',
                              svgIconColor: AppColors.red_color,
                              bgIconColor: AppColors.pink_color,
                              index: 0,
                              action: () {
                                Navigator.push(
                                    context,
                                    RightTransition(DetailsFAQScreen(index: AppLocalData.elementsFAQ[index]['index'])));
                              },
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
        ),
      ],
    );
  }
}


// // ignore_for_file: library_private_types_in_public_api

// import 'package:qatra_app/utils/importations.dart';

// class ListFAQScreen extends StatefulWidget {
//   const ListFAQScreen({Key? key}) : super(key: key);

//   @override
//   _ListFAQScreenState createState() => _ListFAQScreenState();
// }

// class _ListFAQScreenState extends State<ListFAQScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Declarations
//     double _height = MediaQuery.of(context).size.height;
//     double _width = MediaQuery.of(context).size.width;

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: const <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 5,
//           ),
//         ),
//       ],
//     );
//   }
// }
