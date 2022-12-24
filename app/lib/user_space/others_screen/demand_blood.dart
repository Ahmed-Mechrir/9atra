// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:app_9atra/utils/importations.dart';

class DemandBloodScreen extends StatefulWidget {
  const DemandBloodScreen({Key? key}) : super(key: key);

  @override
  _DemandBloodScreenState createState() => _DemandBloodScreenState();
}

class _DemandBloodScreenState extends State<DemandBloodScreen> {
  // Declarations
  DateTime? _selectedDate;
  String? _selectedDateString;

  int valueLetter = -1, valueSign = -1, valueType = -1;
  String titleLetter = '', titleSign = '', titleType = '';
  Widget CustomRadioButtonType(String text, int index) {
    return TextButton(
      focusNode: FocusNode(),
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          (valueType == index) ? AppColors.red_color : AppColors.grey_color_1,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.black,
          ),
        ),
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        setState(() {
          valueType = index;
          titleType = text;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 3,
        height: 30,
        child: Text(
          text,
          style: TextStyle(
            color: (valueType == index)
                ? AppColors.white_color
                : AppColors.grey_color_2,
            fontFamily: 'Open Sans',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget CustomRadioButtonLetter(String text, int index) {
    return TextButton(
      focusNode: FocusNode(),
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          (valueLetter == index) ? AppColors.red_color : AppColors.grey_color_1,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.black,
          ),
        ),
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        setState(() {
          valueLetter = index;
          titleLetter = text;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.1,
        height: 30,
        child: Text(
          text,
          style: TextStyle(
            color: (valueLetter == index)
                ? AppColors.white_color
                : AppColors.grey_color_2,
            fontFamily: 'Open Sans',
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget CustomRadioButtonSign(String text, int index) {
    return TextButton(
      focusNode: FocusNode(),
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          (valueSign == index) ? AppColors.red_color : AppColors.grey_color_1,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.black,
          ),
        ),
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        setState(() {
          valueSign = index;
          titleSign = text;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.04,
        height: 30,
        child: Text(
          text,
          style: TextStyle(
            color: (valueSign == index)
                ? AppColors.white_color
                : AppColors.grey_color_2,
            fontFamily: 'Open Sans',
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.red_color,
        automaticallyImplyLeading: false,
        toolbarHeight: 60.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.pop(context);
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
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Demander du sang',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: _width * .05,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white_color,
                  ),
                ),
              ],
            ),
          ],
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
                height: _height * 0.02,
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
            Positioned(
              top: _height * 0.02,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.topCenter,
                width: _width,
                height: _height * 0.86,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: _width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Choisir un jour',
                              style: TextStyle(
                                fontSize: _width * .048,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black_color,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              width: _width,
                              height: 100,
                              child: DatePicker(
                                DateTime.now(),
                                initialSelectedDate: DateTime.now(),
                                selectionColor: AppColors.red_color,
                                selectedTextColor: AppColors.white_color,
                                height: 80,
                                locale: 'fr_FR',
                                monthTextStyle: const TextStyle(
                                  color: AppColors.red_color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                dateTextStyle: const TextStyle(
                                  color: AppColors.red_color,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                                dayTextStyle: const TextStyle(
                                  color: AppColors.red_color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                onDateChange: (date) {
                                  setState(() {
                                    _selectedDateString =
                                        '${date.year}/${date.day.toString().length == 2 ? date.day.toString() : '0${date.day}'}/${date.month.toString().length == 2 ? date.month.toString() : '0${date.month}'}';
                                    print(
                                        'Date selected: $_selectedDateString');
                                  });
                                },
                                key: const Key('date-picker'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.03,
                      ),
                      SizedBox(
                        width: _width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Choisir une heure',
                              style: TextStyle(
                                fontSize: _width * .048,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black_color,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: AppColors.white_bg_color,
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.black_color.withOpacity(.15),
                                    blurRadius: 5,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              width: _width,
                              child: CustomHourPicker(
                                elevation: 0,
                                initDate: DateTime.now(),
                                // onPositivePressed: (context, time) {
                                //   textFieldController.text = time.toString();
                                // },
                                onNegativePressed: (context) {},
                                titleStyle: const TextStyle(
                                  fontSize: 0,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.transparent,
                                ),
                                negativeButtonStyle: const TextStyle(
                                  fontSize: 0,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.transparent,
                                ),
                                positiveButtonStyle: const TextStyle(
                                  fontSize: 0,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.035,
                      ),
                      SizedBox(
                        width: _width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Choisir un groupe sangin',
                              style: TextStyle(
                                fontSize: _width * .048,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black_color,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: AppColors.white_bg_color,
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.black_color.withOpacity(.15),
                                    blurRadius: 5,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              width: _width,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CustomRadioButtonType('Sang', 0),
                                        const SizedBox(width: 6),
                                        CustomRadioButtonType('Plaquette', 1),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: _height * 0.04),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CustomRadioButtonLetter('A', 0),
                                        const SizedBox(width: 6),
                                        CustomRadioButtonLetter('B', 1),
                                        const SizedBox(width: 6),
                                        CustomRadioButtonLetter('O', 2),
                                        const SizedBox(width: 6),
                                        CustomRadioButtonLetter('AB', 3),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: _height * 0.04),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CustomRadioButtonSign('+', 0),
                                        const SizedBox(width: 6),
                                        CustomRadioButtonSign('-', 1),
                                      ],
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
            ),
          ],
        ),
      ),
    );
  }
}
