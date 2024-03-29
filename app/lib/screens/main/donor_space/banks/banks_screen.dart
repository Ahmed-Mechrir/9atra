import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import 'sub_screens/banks_list_screen.dart';
import 'sub_screens/banks_location_screen.dart';

class BanksScreen extends StatefulWidget {
  const BanksScreen({Key? key}) : super(key: key);

  @override
  State<BanksScreen> createState() =>
      _BanksScreenState();
}

class _BanksScreenState
    extends State<BanksScreen> with TickerProviderStateMixin {
  // Declarations
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: _height * 0.01),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                        horizontal: _width * 0.1,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: AppColors.grey_color_1,
                      ),
                      child: TabBar(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        isScrollable: false,
                        labelColor: AppColors.red_color,
                        labelStyle: const TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white_color,
                        ),
                        unselectedLabelColor: AppColors.grey_color_2,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white_bg_color,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black_color.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 1),
                            )
                          ],
                        ),
                        onTap: (value) {
                          print(value);
                        },
                        tabs: [
                          Tab(
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Vue Liste",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Vue Carte",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      dragStartBehavior: DragStartBehavior.down,
                      children: <Widget>[
                        SizedBox(
                          height: _height,
                          width: _width,
                          child: const BanksListScreen(),
                        ),
                        SizedBox(
                          height: _height,
                          width: _width,
                          child: const BankLocationScreen(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
