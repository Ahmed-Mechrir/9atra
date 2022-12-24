// ignore_for_file: library_private_types_in_public_api

import 'package:app_9atra/utils/importations.dart';

class ReserveDonationScreen extends StatefulWidget {
  const ReserveDonationScreen({Key? key}) : super(key: key);

  @override
  _ReserveDonationScreenState createState() => _ReserveDonationScreenState();
}

class _ReserveDonationScreenState extends State<ReserveDonationScreen> {
  // Decalrations
  final GlobalKey<FormBuilderState> _form_questions =
      GlobalKey<FormBuilderState>();
  DateTime? _selectedDate;
  String? _selectedDateString;
  late var question_1, question_2, question_3, question_4, question_5;

  @override
  void initState() {
    super.initState();
    _selectedDate;
    _selectedDateString;
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
                  'Réservation de don',
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
                              'Répondre aux questions',
                              style: TextStyle(
                                fontSize: _width * .048,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black_color,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: _width,
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
                              child: FormBuilder(
                                key: _form_questions,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: <Widget>[
                                    FormBuilderDropdown(
                                      name: 'question_1',
                                      dropdownColor: AppColors.white_color,
                                      style: AppDeclarations.inputTextStyle,
                                      allowClear: true,
                                      isDense: false,
                                      elevation: 2,
                                      hint: Text(
                                        'Quel est votre sexe ?',
                                        style: AppDeclarations.hintStyle,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColors.white_color,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 10,
                                        ),
                                        errorStyle: AppDeclarations.errorStyle,
                                        errorBorder:
                                            AppDeclarations.errorBorder,
                                        enabledBorder:
                                            AppDeclarations.enabledBorder,
                                        focusedErrorBorder:
                                            AppDeclarations.focusedErrorBorder,
                                        focusedBorder:
                                            AppDeclarations.focusedBorder,
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.white_color,
                                      ),
                                      clearIcon: const Icon(
                                        Icons.clear,
                                        color: AppColors.red_color,
                                      ),
                                      items: ['Homme', 'Femme']
                                          .map((selectedItem) =>
                                              DropdownMenuItem(
                                                value: selectedItem,
                                                child: Text(selectedItem),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Veuillez choisir votre sexe';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          question_1 = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    FormBuilderDropdown(
                                      name: 'question_2',
                                      dropdownColor: AppColors.white_color,
                                      style: AppDeclarations.inputTextStyle,
                                      allowClear: true,
                                      isDense: false,
                                      elevation: 2,
                                      hint: Text(
                                        'Vous avez entre 18 et 65 ans ?',
                                        style: AppDeclarations.hintStyle,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColors.white_color,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 10,
                                        ),
                                        errorStyle: AppDeclarations.errorStyle,
                                        errorBorder:
                                            AppDeclarations.errorBorder,
                                        enabledBorder:
                                            AppDeclarations.enabledBorder,
                                        focusedErrorBorder:
                                            AppDeclarations.focusedErrorBorder,
                                        focusedBorder:
                                            AppDeclarations.focusedBorder,
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.white_color,
                                      ),
                                      clearIcon: const Icon(
                                        Icons.clear,
                                        color: AppColors.red_color,
                                      ),
                                      items: [
                                        'Moins de 18 ans',
                                        'Plus de 65 ans',
                                        'Entre 18 et 65 ans'
                                      ]
                                          .map((selectedItem) =>
                                              DropdownMenuItem(
                                                value: selectedItem,
                                                child: Text(selectedItem),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Veuillez choisir votre marge d\'âge';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          question_2 = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    FormBuilderDropdown(
                                      name: 'question_3',
                                      dropdownColor: AppColors.white_color,
                                      style: AppDeclarations.inputTextStyle,
                                      allowClear: true,
                                      isDense: false,
                                      elevation: 2,
                                      hint: Text(
                                        'Vous pesez plus de 49 kg ?',
                                        style: AppDeclarations.hintStyle,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColors.white_color,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 10,
                                        ),
                                        errorStyle: AppDeclarations.errorStyle,
                                        errorBorder:
                                            AppDeclarations.errorBorder,
                                        enabledBorder:
                                            AppDeclarations.enabledBorder,
                                        focusedErrorBorder:
                                            AppDeclarations.focusedErrorBorder,
                                        focusedBorder:
                                            AppDeclarations.focusedBorder,
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.white_color,
                                      ),
                                      clearIcon: const Icon(
                                        Icons.clear,
                                        color: AppColors.red_color,
                                      ),
                                      items: [
                                        'Moins de 49 kg',
                                        'Plus de 49 kg',
                                        '49 kg'
                                      ]
                                          .map((selectedItem) =>
                                              DropdownMenuItem(
                                                value: selectedItem,
                                                child: Text(selectedItem),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Veuillez choisir votre poids';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          question_3 = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    FormBuilderDropdown(
                                      name: 'question_4',
                                      dropdownColor: AppColors.white_color,
                                      style: AppDeclarations.inputTextStyle,
                                      allowClear: true,
                                      isDense: false,
                                      elevation: 2,
                                      hint: Text(
                                        'Avez-vous une infection?',
                                        style: AppDeclarations.hintStyle,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColors.white_color,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 10,
                                        ),
                                        errorStyle: AppDeclarations.errorStyle,
                                        errorBorder:
                                            AppDeclarations.errorBorder,
                                        enabledBorder:
                                            AppDeclarations.enabledBorder,
                                        focusedErrorBorder:
                                            AppDeclarations.focusedErrorBorder,
                                        focusedBorder:
                                            AppDeclarations.focusedBorder,
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.white_color,
                                      ),
                                      clearIcon: const Icon(
                                        Icons.clear,
                                        color: AppColors.red_color,
                                      ),
                                      items: [
                                        'Rhume',
                                        'Grippe',
                                        'Mal de gorge',
                                        'Fièvre',
                                        'Maux de ventre',
                                        'Diabète',
                                        'Pas d\'infection',
                                        'Autre'
                                      ]
                                          .map((selectedItem) =>
                                              DropdownMenuItem(
                                                value: selectedItem,
                                                child: Text(selectedItem),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Veuillez choisir si vous avez une infection';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          question_4 = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    FormBuilderDropdown(
                                      name: 'question_5',
                                      dropdownColor: AppColors.white_color,
                                      style: AppDeclarations.inputTextStyle,
                                      allowClear: true,
                                      isDense: false,
                                      elevation: 2,
                                      hint: Text(
                                        'Avez-vous une infection dddd?',
                                        style: AppDeclarations.hintStyle,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColors.white_color,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 10,
                                        ),
                                        errorStyle: AppDeclarations.errorStyle,
                                        errorBorder:
                                            AppDeclarations.errorBorder,
                                        enabledBorder:
                                            AppDeclarations.enabledBorder,
                                        focusedErrorBorder:
                                            AppDeclarations.focusedErrorBorder,
                                        focusedBorder:
                                            AppDeclarations.focusedBorder,
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.white_color,
                                      ),
                                      clearIcon: const Icon(
                                        Icons.clear,
                                        color: AppColors.red_color,
                                      ),
                                      items: ['Autre']
                                          .map((selectedItem) =>
                                              DropdownMenuItem(
                                                value: selectedItem,
                                                child: Text(selectedItem),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'dddddd';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          question_5 = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.03,
                      ),
                      Container(
                        width: _width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.red_color.withOpacity(0.4),
                              offset: const Offset(0, 0),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.red_color),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 12),
                            ),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Colors.white, width: 0))),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Valider',
                            // 'Validate',
                            style: TextStyle(
                              color: AppColors.white_color,
                              fontSize: 20,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.03,
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
