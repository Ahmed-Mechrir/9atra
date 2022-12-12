// ignore_for_file: deprecated_member_use, avoid_print, non_constant_identifier_names, unused_local_variable, unused_field, unused_element, library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:flutter/gestures.dart';
import 'package:qatra_app/utils/importations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormBuilderState> _form_step2 = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _form_step3 = GlobalKey<FormBuilderState>();
  final TextEditingController _input_full_name = TextEditingController();
  final TextEditingController _input_email = TextEditingController();
  final TextEditingController _input_password = TextEditingController();
  final TextEditingController _input_passwordC = TextEditingController();

  bool _obscureText = true;
  bool _obscureTextC = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleC() {
    setState(() {
      _obscureTextC = !_obscureTextC;
    });
  }

  late var question_1, question_2, question_3, question_4, bloodType;

  /* ---------------------- */
  int currentStep = 1;
  int stepLength = 3;
  late bool complete;

  next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    }
  }

  back() {
    if (currentStep > 1) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);
    }
  }

  int valueLetter = -1, valueSign = -1;
  String titleLetter = '', titleSign = '';
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

  getContentStep(int step) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    switch (step) {
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Veuillez choisir votre groupe sanguin',
              // 'Please pick your blood type',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.black_color,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Si vous ne connaissez pas votre groupe sanguin, vous pouvez sauter cette étape.',
              // 'If you don\'t know your blood type, you can skip this step',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.black_color,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomRadioButtonSign('+', 0),
                  const SizedBox(width: 6),
                  CustomRadioButtonSign('-', 1),
                ],
              ),
            ),
          ],
        );
      case 2:
        return Column(
          children: <Widget>[
            FormBuilder(
              key: _form_step2,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      errorStyle: AppDeclarations.errorStyle,
                      errorBorder: AppDeclarations.errorBorder,
                      enabledBorder: AppDeclarations.enabledBorder,
                      focusedErrorBorder: AppDeclarations.focusedErrorBorder,
                      focusedBorder: AppDeclarations.focusedBorder,
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
                        .map((selectedItem) => DropdownMenuItem(
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
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      errorStyle: AppDeclarations.errorStyle,
                      errorBorder: AppDeclarations.errorBorder,
                      enabledBorder: AppDeclarations.enabledBorder,
                      focusedErrorBorder: AppDeclarations.focusedErrorBorder,
                      focusedBorder: AppDeclarations.focusedBorder,
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
                        .map((selectedItem) => DropdownMenuItem(
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
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      errorStyle: AppDeclarations.errorStyle,
                      errorBorder: AppDeclarations.errorBorder,
                      enabledBorder: AppDeclarations.enabledBorder,
                      focusedErrorBorder: AppDeclarations.focusedErrorBorder,
                      focusedBorder: AppDeclarations.focusedBorder,
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.white_color,
                    ),
                    clearIcon: const Icon(
                      Icons.clear,
                      color: AppColors.red_color,
                    ),
                    items: ['Moins de 49 kg', 'Plus de 49 kg', '49 kg']
                        .map((selectedItem) => DropdownMenuItem(
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
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      errorStyle: AppDeclarations.errorStyle,
                      errorBorder: AppDeclarations.errorBorder,
                      enabledBorder: AppDeclarations.enabledBorder,
                      focusedErrorBorder: AppDeclarations.focusedErrorBorder,
                      focusedBorder: AppDeclarations.focusedBorder,
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
                        .map((selectedItem) => DropdownMenuItem(
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
                ],
              ),
            ),
          ],
        );
      case 3:
        return Column(
          children: <Widget>[
            FormBuilder(
              key: _form_step3,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    controller: _input_full_name,
                    name: 'input_full_name',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: AppColors.black_color,
                    textAlign: TextAlign.left,
                    autocorrect: false,
                    style: AppDeclarations.inputTextStyle,
                    decoration: InputDecoration(
                      hintStyle: AppDeclarations.hintStyle,
                      hintText: "Nom complet",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      fillColor: AppColors.white_color,
                      filled: true,
                      errorStyle: AppDeclarations.errorStyle,
                      errorBorder: AppDeclarations.errorBorder,
                      enabledBorder: AppDeclarations.enabledBorder,
                      focusedErrorBorder: AppDeclarations.focusedErrorBorder,
                      focusedBorder: AppDeclarations.focusedBorder,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose(
                      [
                        (val) {
                          if (val == null || val.isEmpty) {
                            return 'Nom complet requis';
                          } else if (val.length > 40) {
                            return 'Nom complet trop longue (40 caractères maximum)';
                          } else if (val.length < 5) {
                            return 'Nom complet trop courte (5 caractères minimum)';
                          } else if (!val.contains(RegExp(
                              '[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ]'))) {
                            return 'Nom complet invalide';
                          } else if (!val.contains(RegExp('[ ]'))) {
                            return 'Nom complet requis un prénom';
                          } else if (val.contains(RegExp(r'[ ]{2,}]'))) {
                            return 'Nom complet contient double espaces';
                          } else if (_input_full_name.text.split(' ').length >
                              2) {
                            return 'Nom complet contient deux prénoms';
                          } else {
                            return null;
                          }
                        }
                      ],
                    ),
                    onSaved: (value) {
                      _input_full_name.text = value!;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          r'[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ]')),
                      FilteringTextInputFormatter.deny(
                          RegExp(r'[-_0-9+.@()!#$%&*+-/=?^_`{|}]')),
                      FilteringTextInputFormatter.deny(RegExp(r'[ ]{2,}')),
                      LengthLimitingTextInputFormatter(40),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormBuilderTextField(
                    controller: _input_email,
                    name: 'input_email',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: AppColors.black_color,
                    textAlign: TextAlign.left,
                    autocorrect: false,
                    style: AppDeclarations.inputTextStyle,
                    decoration: InputDecoration(
                      hintStyle: AppDeclarations.hintStyle,
                      hintText: "Adresse e-mail",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      fillColor: AppColors.white_color,
                      filled: true,
                      errorStyle: AppDeclarations.errorStyle,
                      errorBorder: AppDeclarations.errorBorder,
                      enabledBorder: AppDeclarations.enabledBorder,
                      focusedErrorBorder: AppDeclarations.focusedErrorBorder,
                      focusedBorder: AppDeclarations.focusedBorder,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose(
                      [
                        (val) {
                          if (val == null || val.isEmpty) {
                            return 'Adresse e-mail requise';
                          } else if (val.length < 3) {
                            return 'Adresse e-mail trop courte (3 caractères minimum)';
                          } else if (val.length > 30) {
                            return 'Adresse e-mail trop longue (30 caractères maximum)';
                          } else if ((val.contains('@') &&
                                  !val.contains('.')) ||
                              (!val.contains('@') && val.contains('.')) ||
                              (val.contains(RegExp('[a-z]')) &&
                                  (!val.contains('@') || !val.contains('.')))) {
                            return 'Adresse e-mail invalide';
                          } else {
                            return null;
                          }
                        }
                      ],
                    ),
                    onSaved: (value) {
                      _input_email.text = value!;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-z0-9+.@()!#$%&*+-/=?^_`{|}]')),
                      FilteringTextInputFormatter.deny(RegExp('[-_]')),
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                      LengthLimitingTextInputFormatter(30),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormBuilderTextField(
                    controller: _input_password,
                    name: 'input_password',
                    enableInteractiveSelection: false,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.black_color,
                    textAlign: TextAlign.left,
                    autocorrect: false,
                    obscureText: _obscureText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black_color,
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: AppColors.grey_color_2.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: "Mot de passe",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      fillColor: AppColors.white_color,
                      filled: true,
                      suffixIcon: FlatButton(
                        onPressed: _toggle,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.all(0),
                        minWidth: 0,
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.grey_color_2,
                        ),
                      ),
                      errorStyle: AppDeclarations.errorStyle,
                      errorBorder: AppDeclarations.errorBorder,
                      enabledBorder: AppDeclarations.enabledBorder,
                      focusedErrorBorder: AppDeclarations.focusedErrorBorder,
                      focusedBorder: AppDeclarations.focusedBorder,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose(
                      [
                        (val) {
                          if (val == null || val.isEmpty) {
                            return 'Mot de passe requis';
                          } else if (val.length < 8) {
                            return 'Mot de passe trop court (8 caractères minimum)';
                          } else if (val.length > 15) {
                            return 'Mot de passe trop long (15 caractères maximum)';
                          } else if (!val.contains(RegExp(r'[A-Z]'))) {
                            return 'Mot de passe invalide (au moins une majuscule)';
                          } else if (!val.contains(RegExp(r'[a-z]'))) {
                            return 'Mot de passe invalide (au moins une minuscule)';
                          } else if (!val.contains(RegExp(r'[0-9]'))) {
                            return 'Mot de passe invalide (au moins un chiffre)';
                          } else if (!val
                              .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-]'))) {
                            return 'Mot de passe invalide (au moins un caractère spécial)';
                          } else {
                            return null;
                          }
                        }
                      ],
                    ),
                    onSaved: (value) {
                      _input_password.text = value!;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormBuilderTextField(
                    controller: _input_passwordC,
                    name: 'input_passwordC',
                    enableInteractiveSelection: false,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.black_color,
                    textAlign: TextAlign.left,
                    autocorrect: false,
                    obscureText: _obscureText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black_color,
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: AppColors.grey_color_2.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: "Confirmation mot de passe",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      fillColor: AppColors.white_color,
                      filled: true,
                      suffixIcon: FlatButton(
                        onPressed: _toggleC,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.all(0),
                        minWidth: 0,
                        child: Icon(
                          _obscureTextC
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.grey_color_2,
                        ),
                      ),
                      errorStyle: AppDeclarations.errorStyle,
                      errorBorder: AppDeclarations.errorBorder,
                      enabledBorder: AppDeclarations.enabledBorder,
                      focusedErrorBorder: AppDeclarations.focusedErrorBorder,
                      focusedBorder: AppDeclarations.focusedBorder,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose(
                      [
                        (val) {
                          if (val == null || val.isEmpty) {
                            return 'Confirmation mot de passe requis';
                          } else if (val.length < 8) {
                            return 'Confirmation mot de passe trop court (8 caractères minimum)';
                          } else if (val.length > 15) {
                            return 'Confirmation mot de passe trop long (15 caractères maximum)';
                          } else if (!val.contains(RegExp(r'[A-Z]'))) {
                            return 'Confirmation mot de passe invalide (au moins une majuscule)';
                          } else if (!val.contains(RegExp(r'[a-z]'))) {
                            return 'Confirmation mot de passe invalide (au moins une minuscule)';
                          } else if (!val.contains(RegExp(r'[0-9]'))) {
                            return 'Confirmation mot de passe invalide (au moins un chiffre)';
                          } else if (!val
                              .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-]'))) {
                            return 'Confirmation mot de passe invalide (au moins un caractère spécial)';
                          } else if (val != _input_password.text) {
                            return 'Confirmation mot de passe ne correspond pas au mot de passe';
                          } else {
                            return null;
                          }
                        }
                      ],
                    ),
                    onSaved: (value) {
                      _input_password.text = value!;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
    }
  }
  /* ---------------------- */

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
      backgroundColor: AppColors.white_bg_color,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: _height,
            width: _width,
            child: AppDeclarations.bgAccessScreens(
              context,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    height: _height * 0.16,
                    child: const Text(
                      'Bienvenue',
                      // 'Welcome',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black_color,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          MyStepper(
                            totalSteps: stepLength,
                            width: MediaQuery.of(context).size.width,
                            curStep: currentStep,
                            stepCompleteColor: AppColors.red_color,
                            currentStepColor: AppColors.pink_color,
                            inactiveColor:
                                AppColors.pink_color.withOpacity(0.4),
                            lineWidth: 2.5,
                            icons: const [
                              Icons.bloodtype,
                              Icons.question_mark,
                              Icons.account_circle
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 20),
                            child: getContentStep(currentStep),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.005,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: _width / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.grey_color_2.withOpacity(0.3),
                                  offset: const Offset(0, 0),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.grey_color_1),
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
                                )),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                if ((valueLetter != -1) && (currentStep == 1)) {
                                  setState(() {
                                    valueLetter = -1;
                                    valueSign = -1;
                                  });
                                } else if ((valueSign != -1) &&
                                    (currentStep == 1)) {
                                  setState(() {
                                    valueLetter = -1;
                                    valueSign = -1;
                                  });
                                } else {
                                  back();
                                }
                              },
                              child: Text(
                                (currentStep == 1) ? 'Reset' : 'Précédent',
                                style: const TextStyle(
                                  color: AppColors.grey_color_2,
                                  fontSize: 20,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: _width / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: (currentStep == stepLength)
                                      ? AppColors.red_color.withOpacity(0.4)
                                      : AppColors.pink_color,
                                  offset: const Offset(0, 0),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(
                                  (currentStep == stepLength)
                                      ? AppColors.red_color
                                      : AppColors.pink_color,
                                ),
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
                                )),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                switch (currentStep) {
                                  case 1:
                                    {
                                      if ((valueLetter == -1) &&
                                          (valueSign == -1)) {
                                        next();
                                      } else if ((valueLetter != -1) &&
                                          (valueSign != -1)) {
                                        if (valueLetter == 0 &&
                                            valueSign == 0) {
                                          bloodType = 'A+';
                                          print(bloodType);
                                        } else if (valueLetter == 0 &&
                                            valueSign == 1) {
                                          bloodType = 'A-';
                                          print(bloodType);
                                        } else if (valueLetter == 1 &&
                                            valueSign == 0) {
                                          bloodType = 'B+';
                                          print(bloodType);
                                        } else if (valueLetter == 1 &&
                                            valueSign == 1) {
                                          bloodType = 'B-';
                                          print(bloodType);
                                        } else if (valueLetter == 2 &&
                                            valueSign == 0) {
                                          bloodType = 'O+';
                                          print(bloodType);
                                        } else if (valueLetter == 2 &&
                                            valueSign == 1) {
                                          bloodType = 'O-';
                                          print(bloodType);
                                        } else if (valueLetter == 3 &&
                                            valueSign == 0) {
                                          bloodType = 'AB+';
                                          print(bloodType);
                                        } else if (valueLetter == 3 &&
                                            valueSign == 1) {
                                          bloodType = 'AB-';
                                          print(bloodType);
                                        }
                                        next();
                                      } else if ((valueLetter == -1) &&
                                          (valueSign != -1)) {
                                        errorToastWidget(
                                            'Veuillez sélectionner une lettre');
                                      } else if ((valueLetter != -1) &&
                                          (valueSign == -1)) {
                                        errorToastWidget(
                                            'Veuillez choisir un signe');
                                      } else {
                                        return;
                                      }
                                    }
                                    break;
                                  case 2:
                                    {
                                      _form_step2.currentState!.save();
                                      if (_form_step2.currentState!
                                          .validate()) {
                                        question_1 = _form_step2
                                            .currentState!.value['question_1'];
                                        question_2 = _form_step2
                                            .currentState!.value['question_2'];
                                        question_3 = _form_step2
                                            .currentState!.value['question_3'];
                                        question_4 = _form_step2
                                            .currentState!.value['question_4'];
                                        next();
                                      } else {
                                        print("validation failed");
                                        print(_form_step2.currentState!.value);
                                        defaultToastWidget(
                                            'Veuillez remplir tous les champs correctement');
                                      }
                                    }
                                    break;
                                  case 3:
                                    {
                                      _form_step3.currentState!.save();
                                      if (_form_step3.currentState!
                                          .validate()) {
                                        print(_form_step3.currentState!.value);
                                        Navigator.pushReplacement(
                                            context,
                                            CenterTransition(
                                                const AppFrameScreen()));
                                      } else {
                                        print("validation failed");
                                        print(_form_step3.currentState!.value);
                                        defaultToastWidget(
                                            'Veuillez remplir tous les champs correctement');
                                      }
                                    }
                                }
                              },
                              child: Text(
                                (currentStep == stepLength)
                                    ? 'S\'inscrire'
                                    : 'Suivant',
                                style: TextStyle(
                                  color: (currentStep == stepLength)
                                      ? AppColors.white_color
                                      : AppColors.red_color,
                                  fontSize: 20,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.02,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 10.0),
                                  child: const Divider(
                                    color: AppColors.grey_color_1,
                                    height: 0,
                                    thickness: 1.5,
                                    indent: 0,
                                    endIndent: 0,
                                  )),
                            ),
                            Text(
                              'Ou continuer avec',
                              // 'Or continue with',
                              style: TextStyle(
                                color: AppColors.grey_color_2.withOpacity(0.5),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 0.0),
                                child: const Divider(
                                  color: AppColors.grey_color_1,
                                  height: 0,
                                  thickness: 1.5,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                defaultToastWidget('Facebook');
                              },
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black_color
                                          .withOpacity(0.15),
                                      offset: const Offset(0, 0),
                                      blurRadius: 15,
                                    ),
                                  ],
                                  color: AppColors.white_color,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SvgPicture.asset(
                                    'assets/svg/icon-facebook.svg',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                defaultToastWidget('Instagram');
                              },
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black_color
                                          .withOpacity(0.15),
                                      offset: const Offset(0, 0),
                                      blurRadius: 15,
                                    ),
                                  ],
                                  color: AppColors.white_color,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SvgPicture.asset(
                                    'assets/svg/icon-instagram.svg',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                defaultToastWidget('Twitter');
                              },
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black_color
                                          .withOpacity(0.15),
                                      offset: const Offset(0, 0),
                                      blurRadius: 15,
                                    ),
                                  ],
                                  color: AppColors.white_color,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SvgPicture.asset(
                                    'assets/svg/icon-twitter.svg',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.06,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Vous avez déjà un compte ?',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                            color: AppColors.black_color,
                          ),
                        ),
                        TextSpan(
                          text: '  Se connecter',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                            color: AppColors.red_color,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              Navigator.pushReplacement(context,
                                  BottomTransition(const SignInScreen()));
                            },
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
