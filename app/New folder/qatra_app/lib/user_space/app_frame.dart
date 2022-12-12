// ignore_for_file: non_constant_identifier_names

import 'package:qatra_app/utils/importations.dart';

class AppFrameScreen extends StatefulWidget {
  const AppFrameScreen({Key? key}) : super(key: key);

  @override
  AppFrameScreenState createState() => AppFrameScreenState();
}

class AppFrameScreenState extends State<AppFrameScreen> {
  @override
  void initState() {
    super.initState();
    AppDeclarations.profileScreen = true;
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

    return Container(
      width: _width,
      height: _height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.red_color, AppColors.white_bg_color],
          begin: FractionalOffset(0.0, 0.14),
          end: FractionalOffset(0.0, 0.8),
          stops: [0.0, .01],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.red_color,
          automaticallyImplyLeading: false,
          toolbarHeight: 85.0,
          title: Entry.offset(
            delay: const Duration(milliseconds: 280),
            duration: const Duration(milliseconds: 1400),
            yOffset: -800.0,
            xOffset: 0.0,
            child: Row(
              mainAxisAlignment: AppDeclarations.profileScreen
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AppDeclarations.profileScreen
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            AppDeclarations.profileScreen = true;
                            AppDeclarations.current_index = 0;
                            HapticFeedback.lightImpact();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            size: _width * .076,
                            color: AppColors.white_color,
                          ),
                        ),
                      ),
                AnimatedContainer(
                  width: AppDeclarations.profileScreen
                      ? (_width * .8)
                      : (_width * .35),
                  duration: const Duration(seconds: 1),
                  margin: const EdgeInsets.all(20),
                  height: _width * .155,
                  constraints: BoxConstraints(
                    maxWidth: _width * .9,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white_color,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black_color.withOpacity(.15),
                        blurRadius: 12,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SizedBox(
                    width: _width * .6,
                    height: _width * .155,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                AppDeclarations.profileScreen = true;
                                AppDeclarations.current_index = 4;
                                HapticFeedback.lightImpact();
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: AppDeclarations.profileScreen
                                      ? (_width * .2125)
                                      : (_width * .125),
                                  child: Center(
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      height: AppDeclarations.current_index == 4
                                          ? _width * .12
                                          : 0,
                                      width: AppDeclarations.current_index == 4
                                          ? _width * .2125
                                          : 0,
                                      decoration: BoxDecoration(
                                        color:
                                            AppDeclarations.current_index == 4
                                                ? AppColors.pink_color
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDeclarations.profileScreen
                                      ? (_width * .2125)
                                      : (_width * .125),
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Icon(
                                        Icons.notifications,
                                        size: _width * .076,
                                        color:
                                            AppDeclarations.current_index == 4
                                                ? AppColors.red_color
                                                : Colors.black26,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 0,
                                        child: AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color:
                                                AppDeclarations.current_index ==
                                                        4
                                                    ? Colors.transparent
                                                    : AppColors.red_color,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                AppDeclarations.profileScreen = false;
                                AppDeclarations.current_index = 5;
                                HapticFeedback.lightImpact();
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              children: <Widget>[
                                AppDeclarations.profileScreen
                                    ? Text(
                                        'Med Salem',
                                        style: TextStyle(
                                          color: AppColors.black_color,
                                          fontSize: _height * .02,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  width: 5,
                                ),
                                AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  width: 55,
                                  height: 55,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.red_color,
                                    border: Border.all(
                                      color:
                                          (AppDeclarations.current_index == 5)
                                              ? AppColors.red_color
                                              : Colors.transparent,
                                      width:
                                          (AppDeclarations.current_index == 5)
                                              ? 3
                                              : 0,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: const AssetImage(
                                      'assets/images/avatar.jpg',
                                    ),
                                    backgroundColor: AppColors.pink_color,
                                    radius: _height * .035,
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
        body: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: (AppDeclarations.current_index == 1 ||
                          AppDeclarations.current_index == 3)
                      ? (_height * 0.07)
                      : (_height * 0.12),
                  width: _width,
                  decoration: const BoxDecoration(
                    color: AppColors.red_color,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(300),
                      bottomRight: Radius.circular(300),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              AppDeclarations.screens.elementAt(AppDeclarations.current_index),
            ],
          ),
        ),
        bottomNavigationBar: Entry.offset(
          delay: const Duration(milliseconds: 280),
          duration: const Duration(milliseconds: 1400),
          yOffset: 800.0,
          xOffset: 0.0,
          child: AnimatedOpacity(
            opacity: AppDeclarations.profileScreen ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1400),
            child: Visibility(
              visible: AppDeclarations.profileScreen,
              child: Container(
                margin: const EdgeInsets.all(20),
                height: _width * .155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black_color.withOpacity(.15),
                      blurRadius: 12,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: _width * .024),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        AppDeclarations.profileScreen = true;
                        AppDeclarations.current_index = index;
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: _width * .2125,
                          child: Center(
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              height: index == AppDeclarations.current_index
                                  ? _width * .12
                                  : 0,
                              width: index == AppDeclarations.current_index
                                  ? _width * .2125
                                  : 0,
                              decoration: BoxDecoration(
                                color: index == AppDeclarations.current_index
                                    ? AppColors.pink_color
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: _width * .2125,
                          alignment: Alignment.center,
                          child: Icon(
                            AppDeclarations.listOfIcons[index],
                            size: _width * .076,
                            color: index == AppDeclarations.current_index
                                ? AppColors.red_color
                                : Colors.black26,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: (AppDeclarations.current_index == 2) ? AvatarGlow(
          endRadius: 40,
          glowColor: AppColors.red_color,
          duration: const Duration(milliseconds: 1000),
          repeat: true,
          showTwoGlows: true,
          animate: true,
          curve: Curves.easeOutQuad,
          child: FloatingActionButton(
            splashColor: Colors.transparent,
            highlightElevation: 0,
            onPressed: () {
              setState(() {
                HapticFeedback.lightImpact();
                Navigator.push(
                    context, RightTransition(const DemandBloodScreen()));
              });
            },
            backgroundColor: AppColors.red_color,
            child: Icon(
              Icons.bloodtype_outlined,
              size: _width * .08,
            ),
          ),
        ) : Container(),
      ),
    );
  }
}
