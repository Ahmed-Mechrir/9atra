import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

import '../screens/main/donor_space/banks/banks_screen.dart';
import '../screens/main/donor_space/blood_needers/blood_needers_screen.dart';
import '../screens/main/donor_space/help/help_screen.dart';
import '../screens/main/donor_space/home/home_screen.dart';
import '../screens/main/donor_space/notifications/notifications.dart';
import '../screens/main/donor_space/profile/profile_screen.dart';
import 'colors.dart';

class AppConstants {
  // App Frame screens ---------------------------------------------------------------------
  static var current_index = 0;
  static late bool profileScreen;
  static final List<Widget> screens = <Widget>[
    // Bottom Navigation Screens
    const HomeScreen(),
    const BanksScreen(),
    const BloodNeedersScreen(),
    const HelpScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];
  static final List<IconData> listOfIcons = [
    // Bottom Navigation Icons
    Icons.home_rounded,
    Icons.local_hospital_rounded,
    Icons.bloodtype_rounded,
    Icons.live_help,
  ];

  // Text Input styles ---------------------------------------------------------------------
  static const inputTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static final hintStyle = TextStyle(
    fontSize: 16,
    color: AppColors.grey_color_2.withOpacity(
      0.5,
    ),
    fontWeight: FontWeight.w500,
  );
  static const errorStyle = TextStyle(
    height: 0.8,
  );
  static final errorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red.shade400,
      width: 1,
    ),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(
        10,
      ),
      topRight: Radius.circular(
        10,
      ),
      bottomLeft: Radius.circular(
        10,
      ),
      bottomRight: Radius.circular(
        10,
      ),
    ),
  );
  static const enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.white_color,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(
        10,
      ),
      topRight: Radius.circular(
        10,
      ),
      bottomLeft: Radius.circular(
        10,
      ),
      bottomRight: Radius.circular(
        10,
      ),
    ),
  );
  static final focusedErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red.shade400,
    ),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(
        10,
      ),
      topRight: Radius.circular(
        10,
      ),
      bottomLeft: Radius.circular(
        10,
      ),
      bottomRight: Radius.circular(
        10,
      ),
    ),
  );
  static const focusedBorder = OutlineInputBorder(
    gapPadding: 0,
    borderSide: BorderSide(
      color: AppColors.white_color,
      width: 2,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(
        10,
      ),
      topRight: Radius.circular(
        10,
      ),
      bottomLeft: Radius.circular(
        10,
      ),
      bottomRight: Radius.circular(
        10,
      ),
    ),
  );

  // Background of all pages related to access screens -------------------------------------
  static bgAccessScreens(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -100,
          right: -100,
          child: Entry(
            delay: const Duration(
              milliseconds: 280,
            ),
            duration: const Duration(
              milliseconds: 1400,
            ),
            yOffset: -1000,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: AppColors.pink_color.withOpacity(
                  0.8,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(2000),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          left: -100,
          child: Entry(
            delay: const Duration(
              milliseconds: 280,
            ),
            duration: const Duration(
              milliseconds: 1400,
            ),
            yOffset: 1000,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: AppColors.pink_color.withOpacity(
                  0.8,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    2000,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: child,
        ),
      ],
    );
  }
}
