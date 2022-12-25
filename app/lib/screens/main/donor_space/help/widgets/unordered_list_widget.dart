import 'package:flutter/material.dart';

import '../../../../../config/colors.dart';

class UnorderedListWidget extends StatelessWidget {
  const UnorderedListWidget(this.texts, {super.key});
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      widgetList.add(
        UnorderedListWidgetItem(
          text,
        ),
      );
      widgetList.add(
        const SizedBox(
          height: 5.0,
        ),
      );
    }

    return Column(children: widgetList);
  }
}

class UnorderedListWidgetItem extends StatelessWidget {
  const UnorderedListWidgetItem(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text(
          "•",
          style: TextStyle(
            color: AppColors.grey_color_2,
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                ' $text',
                style: TextStyle(
                  color: AppColors.black_color,
                  fontSize: _width * 0.036,
                ),
              ),
              SizedBox(
                height: _height * 0.02,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
