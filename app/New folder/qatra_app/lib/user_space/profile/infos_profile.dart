// ignore_for_file: library_private_types_in_public_api

import 'package:qatra_app/utils/importations.dart';

class InfosProfileScreen extends StatefulWidget {
  const InfosProfileScreen({Key? key}) : super(key: key);

  @override
  _InfosProfileScreenState createState() => _InfosProfileScreenState();
}

class _InfosProfileScreenState extends State<InfosProfileScreen> {
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
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: _width,
                height: _height * 0.18,
                decoration: const BoxDecoration(
                  color: AppColors.pink_color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: const AssetImage("assets/images/avatar.jpg"),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.black_color.withOpacity(0.1),
                            AppColors.black_color.withOpacity(0.2),
                            AppColors.black_color.withOpacity(0.4),
                            AppColors.black_color.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Entry.offset(
                                delay: const Duration(milliseconds: 50),
                                duration: const Duration(milliseconds: 800),
                                yOffset: 600.0,
                                xOffset: 0.0,
                                child: Text(
                                  "Med Salem",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _height * 0.03,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Entry.opacity(
                                delay: const Duration(milliseconds: 50),
                                duration: const Duration(milliseconds: 800),
                                child: InkWell(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.red,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: _height * 0.03,
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: _height * -0.008,
                      right: 0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/svg/blood_drop.svg',
                            alignment: Alignment.center,
                            height: _height * 0.08,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: _height * 0.02,
                            ),
                            child: Text(
                              'AB+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.white_color,
                                fontSize: _height * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
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
          Positioned(
            top: _height * 0.2,
            left: 0,
            right: 0,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // First info card
                      Container(
                        alignment: Alignment.center,
                        height: _height * 0.18,
                        width: _width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: AppColors.white_color,
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black_color.withOpacity(.15),
                              blurRadius: 12,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                alignment: Alignment.center,
                                height: _height * 0.02,
                                width: _width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: AppColors.red_color,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                width: _width,
                                height: _height,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: _height * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Countup(
                                          begin: 0,
                                          end: 12,
                                          duration: const Duration(seconds: 2),
                                          separator: '',
                                          style: TextStyle(
                                            color: AppColors.black_color,
                                            fontSize: _height * 0.06,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          'L',
                                          style: TextStyle(
                                            color: AppColors.black_color,
                                            fontSize: _height * 0.03,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Total des dons par litre',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.grey_color_2,
                                        fontSize: _height * 0.015,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Second info card
                      Container(
                        alignment: Alignment.center,
                        height: _height * 0.2,
                        width: _width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: AppColors.white_color,
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black_color.withOpacity(.15),
                              blurRadius: 12,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                alignment: Alignment.center,
                                height: _height * 0.02,
                                width: _width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: AppColors.red_color,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                width: _width,
                                height: _height,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: _height * 0.01,
                                    ),
                                    CircularPercentIndicator(
                                      radius: _width * 0.1,
                                      lineWidth: _width * 0.025,
                                      animation: true,
                                      animationDuration: 1200,
                                      linearGradient: LinearGradient(
                                        colors: [
                                          AppColors.red_color.withOpacity(.9),
                                          AppColors.red_color.withOpacity(.7),
                                          AppColors.pink_color,
                                          AppColors.pink_color,
                                        ],
                                      ),
                                      rotateLinearGradient: false,
                                      backgroundColor: AppColors.white_color,
                                      percent: 0.7,
                                      center: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Countup(
                                            begin: 0,
                                            end: 70,
                                            duration:
                                                const Duration(seconds: 2),
                                            separator: '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: _height * 0.02,
                                            ),
                                          ),
                                          Text(
                                            '%',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: _height * 0.02,
                                            ),
                                          ),
                                        ],
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Cycle de régénération',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.grey_color_2,
                                        fontSize: _height * 0.015,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Third info card
                      Container(
                        alignment: Alignment.center,
                        height: _height * 0.18,
                        width: _width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: AppColors.white_color,
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black_color.withOpacity(.15),
                              blurRadius: 12,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                alignment: Alignment.center,
                                height: _height * 0.02,
                                width: _width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: AppColors.red_color,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                width: _width,
                                height: _height,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: _height * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Countup(
                                          begin: 0,
                                          end: 27,
                                          duration: const Duration(seconds: 2),
                                          separator: ',',
                                          style: TextStyle(
                                            color: AppColors.black_color,
                                            fontSize: _height * 0.06,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              '/05',
                                              style: TextStyle(
                                                color: AppColors.black_color,
                                                fontSize: _height * 0.015,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              '/2022',
                                              style: TextStyle(
                                                color: AppColors.black_color,
                                                fontSize: _height * 0.015,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Dernier don de sang',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.grey_color_2,
                                        fontSize: _height * 0.015,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
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
          Positioned(
            top: _height * 0.42,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Entry.offset(
                          delay: const Duration(milliseconds: 200),
                          duration: const Duration(milliseconds: 1400),
                          yOffset: 800.0,
                          xOffset: 0.0,
                          child: CardProfile(
                            title: 'Mes réservations',
                            titleColor: AppColors.black_color,
                            cardColor: AppColors.white_bg_color,
                            bgIconColor: AppColors.white_bg_color,
                            icon: Icons.water_drop,
                            iconColor: AppColors.red_color,
                            linkIcon: true,
                            action: () {
                              Navigator.push(
                                  context,
                                  RightTransition(
                                      const MyReservationsScreen()));
                            },
                          ),
                        ),
                        Entry.opacity(
                          delay: const Duration(milliseconds: 400),
                          duration: const Duration(milliseconds: 1200),
                          child: Divider(
                            color: AppColors.grey_color_2.withOpacity(0.5),
                            height: 3,
                            thickness: 0.5,
                            indent: _width * 0.05,
                            endIndent: _width * 0.05,
                          ),
                        ),
                        Entry.offset(
                          delay: const Duration(milliseconds: 200),
                          duration: const Duration(milliseconds: 1400),
                          yOffset: 800.0,
                          xOffset: 0.0,
                          child: CardProfile(
                            title: 'Mes demandes',
                            titleColor: AppColors.black_color,
                            cardColor: AppColors.white_bg_color,
                            bgIconColor: AppColors.white_bg_color,
                            icon: Icons.bloodtype_rounded,
                            iconColor: AppColors.red_color,
                            linkIcon: true,
                            action: () {
                              Navigator.push(
                                  context,
                                  RightTransition(
                                      const MyDemandsScreen()));
                            },
                          ),
                        ),
                        Entry.opacity(
                          delay: const Duration(milliseconds: 400),
                          duration: const Duration(milliseconds: 1200),
                          child: Divider(
                            color: AppColors.grey_color_2.withOpacity(0.5),
                            height: 3,
                            thickness: 0.5,
                            indent: _width * 0.05,
                            endIndent: _width * 0.05,
                          ),
                        ),
                        Entry.offset(
                          delay: const Duration(milliseconds: 280),
                          duration: const Duration(milliseconds: 1400),
                          yOffset: 800.0,
                          xOffset: 0.0,
                          child: CardProfile(
                            title: 'Paramètres',
                            titleColor: AppColors.black_color,
                            cardColor: AppColors.white_bg_color,
                            bgIconColor: AppColors.white_bg_color,
                            icon: Icons.settings,
                            iconColor: AppColors.red_color,
                            linkIcon: true,
                            action: () {
                              Navigator.push(context,
                                  RightTransition(const SettingsScreen()));
                            },
                          ),
                        ),
                        Entry.opacity(
                          delay: const Duration(milliseconds: 400),
                          duration: const Duration(milliseconds: 1200),
                          child: Divider(
                            color: AppColors.grey_color_2.withOpacity(0.5),
                            height: 3,
                            thickness: 0.5,
                            indent: _width * 0.05,
                            endIndent: _width * 0.05,
                          ),
                        ),
                        Entry.offset(
                          delay: const Duration(milliseconds: 360),
                          duration: const Duration(milliseconds: 1400),
                          yOffset: 800.0,
                          xOffset: 0.0,
                          child: CardProfile(
                            title: 'Évaluez nous',
                            titleColor: AppColors.black_color,
                            cardColor: AppColors.white_bg_color,
                            bgIconColor: AppColors.white_bg_color,
                            icon: Icons.star_rate_rounded,
                            iconColor: AppColors.red_color,
                            linkIcon: true,
                            action: () {
                              // ##### This block of code required app id after deployment in google play store and app store
                              OpenStore.instance.open(
                                appStoreId: '0101010101',
                                androidAppBundleId:
                                    'com.google.android.googlegoogle',
                              );
                            },
                          ),
                        ),
                        Entry.opacity(
                          delay: const Duration(milliseconds: 400),
                          duration: const Duration(milliseconds: 1200),
                          child: Divider(
                            color: AppColors.grey_color_2.withOpacity(0.5),
                            height: 3,
                            thickness: 0.5,
                            indent: _width * 0.05,
                            endIndent: _width * 0.05,
                          ),
                        ),
                        Entry.offset(
                          delay: const Duration(milliseconds: 440),
                          duration: const Duration(milliseconds: 1400),
                          yOffset: 800.0,
                          xOffset: 0.0,
                          child: CardProfile(
                            title: 'Se déconnecter',
                            titleColor: AppColors.black_color,
                            cardColor: AppColors.white_bg_color,
                            bgIconColor: AppColors.white_bg_color,
                            icon: Icons.power_settings_new,
                            iconColor: AppColors.red_color,
                            linkIcon: false,
                            action: () {
                              Navigator.pushReplacement(context,
                                  CenterTransition(const StartAccessScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
