import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../config/colors.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/global/behavior_widget.dart';
import '../../../../widgets/global/toast_widget.dart';
import '../../../../widgets/layout/screen_frame_widget.dart';
import '../../../../widgets/screen/screen_transition_widget.dart';
import '../signup/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormBuilderState> _form_signin =
      GlobalKey<FormBuilderState>();
  final TextEditingController _input_email = TextEditingController();
  final TextEditingController _input_password = TextEditingController();

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
      backgroundColor: AppColors.white_bg_color,
      body: ScrollConfiguration(
        behavior: BehaviorWidget(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: _height,
            width: _width,
            child: AppConstants.bgAccessScreens(
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
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        FormBuilder(
                          key: _form_signin,
                          child: Column(
                            children: <Widget>[
                              FormBuilderTextField(
                                controller: _input_email,
                                name: 'input_email',
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: AppColors.black_color,
                                textAlign: TextAlign.left,
                                autocorrect: false,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintStyle: AppConstants.hintStyle,
                                  hintText: "Adresse e-mail",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  fillColor: AppColors.white_color,
                                  filled: true,
                                  errorStyle: AppConstants.errorStyle,
                                  errorBorder: AppConstants.errorBorder,
                                  enabledBorder: AppConstants.enabledBorder,
                                  focusedErrorBorder:
                                      AppConstants.focusedErrorBorder,
                                  focusedBorder: AppConstants.focusedBorder,
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose(
                                  [
                                    (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Adresse email requise';
                                      } else if (val.length < 3) {
                                        return 'Adresse email trop courte (3 caractères minimum)';
                                      } else if (val.length > 30) {
                                        return 'Adresse email trop longue (30 caractères maximum)';
                                      } else if ((val.contains('@') &&
                                              !val.contains('.')) ||
                                          (!val.contains('@') &&
                                              val.contains('.')) ||
                                          (val.contains(RegExp('[a-z]')) &&
                                              (!val.contains('@') ||
                                                  !val.contains('.')))) {
                                        return 'Adresse email invalide';
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
                                    RegExp(r'[a-z0-9+.@()!#$%&*+/=?^`{|}]'),
                                  ),
                                  FilteringTextInputFormatter.deny(
                                    RegExp('[-_]'),
                                  ),
                                  FilteringTextInputFormatter.deny(
                                    RegExp('[ ]'),
                                  ),
                                  LengthLimitingTextInputFormatter(
                                    30,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
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
                                    color:
                                        AppColors.grey_color_2.withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hintText: "Mot de passe",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  fillColor: AppColors.white_color,
                                  filled: true,
                                  suffixIcon: TextButton(
                                    onPressed: _toggle,
                                    // splashColor: Colors.transparent,
                                    // highlightColor: Colors.transparent,
                                    // padding: const EdgeInsets.all(0),
                                    // minWidth: 0,
                                    child: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.grey_color_2,
                                    ),
                                  ),
                                  errorStyle: AppConstants.errorStyle,
                                  errorBorder: AppConstants.errorBorder,
                                  enabledBorder: AppConstants.enabledBorder,
                                  focusedErrorBorder:
                                      AppConstants.focusedErrorBorder,
                                  focusedBorder: AppConstants.focusedBorder,
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose(
                                  [
                                    (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Mot de passe requis';
                                      } else if (val.length < 8) {
                                        return 'Mot de passe trop court (8 caractères minimum)';
                                      } else if (val.length > 15) {
                                        return 'Mot de passe trop long (15 caractères maximum)';
                                      } else if (!val
                                          .contains(RegExp(r'[A-Z]'))) {
                                        return 'Mot de passe invalide (au moins une majuscule)';
                                      } else if (!val
                                          .contains(RegExp(r'[a-z]'))) {
                                        return 'Mot de passe invalide (au moins une minuscule)';
                                      } else if (!val
                                          .contains(RegExp(r'[0-9]'))) {
                                        return 'Mot de passe invalide (au moins un chiffre)';
                                      } else if (!val.contains(RegExp(
                                          r'[!@#$%^&*(),.?":{}|<>_-]'))) {
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
                                  LengthLimitingTextInputFormatter(
                                    15,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 20,
                                padding: const EdgeInsets.all(
                                  0,
                                ),
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  onPressed: () {
                                    defaultToastWidget(
                                      'Mot de passe oublié !',
                                    );
                                  },
                                  child: const Text(
                                    'Mot de passe oublié ?',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey_color_2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.035,
                              ),
                              Container(
                                width: _width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.red_color.withOpacity(
                                        0.4,
                                      ),
                                      offset: const Offset(0, 0),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(
                                      0,
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.red_color),
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                    ),
                                    textStyle: MaterialStateProperty.all(
                                      const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        side: const BorderSide(
                                          color: Colors.white,
                                          width: 0,
                                        ),
                                      ),
                                    ),
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    _form_signin.currentState!.save();
                                    if (_form_signin.currentState!.validate()) {
                                      print(_form_signin.currentState!.value);
                                      Navigator.pushReplacement(
                                        context,
                                        CenterTransitionWidget(
                                          const ScreenFrameWidget(),
                                        ),
                                      );
                                    } else {
                                      print("validation failed");
                                      print(_form_signin.currentState!.value);
                                    }
                                  },
                                  child: const Text(
                                    'Se connecter',
                                    // 'Sign in',
                                    style: TextStyle(
                                      color: AppColors.white_color,
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.05,
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
                                ),
                              ),
                            ),
                            Text(
                              'Ou continuer avec',
                              // 'Or continue with',
                              style: TextStyle(
                                color: AppColors.grey_color_2.withOpacity(
                                  0.5,
                                ),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 0.0,
                                ),
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
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black_color.withOpacity(
                                        0.15,
                                      ),
                                      offset: const Offset(
                                        0,
                                        0,
                                      ),
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
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black_color.withOpacity(
                                        0.15,
                                      ),
                                      offset: const Offset(
                                        0,
                                        0,
                                      ),
                                      blurRadius: 15,
                                    ),
                                  ],
                                  color: AppColors.white_color,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    8,
                                  ),
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
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black_color.withOpacity(
                                        0.15,
                                      ),
                                      offset: const Offset(
                                        0,
                                        0,
                                      ),
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
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Pas encore inscrit ?',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                            color: AppColors.black_color,
                          ),
                        ),
                        TextSpan(
                          text: '  S\'inscrire',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                            color: AppColors.red_color,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              Navigator.pushReplacement(
                                context,
                                BottomTransitionWidget(
                                  const SignUpScreen(),
                                ),
                              );
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
