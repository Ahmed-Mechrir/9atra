import 'package:qatra_app/utils/importations.dart';

void main() {
  runApp(const AppQatra());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class AppQatra extends StatelessWidget {
  const AppQatra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Open Sans',
        primarySwatch: Colors.pink,
        backgroundColor: Colors.red,
        splashColor: AppColors.red_color,
        highlightColor: AppColors.white_color,
        scaffoldBackgroundColor: AppColors.white_bg_color,
      ),
      localizationsDelegates: const [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        // FormBuilderLocalizations.delegate,
      ],
      home: const SplashScreen(),
      // home: const AppFrameScreen(),
      // home: const ReserveDonationScreen(),
    );
  }
}



// import 'package:qatra_app/utils/importations.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {

// @override
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

//     return Scaffold();
//   }
// }
