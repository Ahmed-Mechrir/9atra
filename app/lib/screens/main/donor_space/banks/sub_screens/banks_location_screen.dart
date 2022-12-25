import 'package:flutter/material.dart';

import '../widgets/bank_location.dart';

class BankLocationScreen extends StatefulWidget {
  const BankLocationScreen({Key? key}) : super(key: key);

  @override
  State<BankLocationScreen> createState() =>
      _BankLocationScreenState();
}

class _BankLocationScreenState
    extends State<BankLocationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
            top: _height * 0.02,
          ),
          child: const ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: BankLocation(),
          ),
        ),
      ),
    );
  }

   @override
  void dispose() {
    super.dispose();
  }
}
