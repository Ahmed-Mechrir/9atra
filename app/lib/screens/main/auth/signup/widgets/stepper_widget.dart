// My custom stepper  ---------------------------------------------------------
import 'package:flutter/material.dart';

import '../../../../../config/colors.dart';

class StepperWidget extends StatelessWidget {
  final double width;
  final int totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;
  final List<IconData> icons;
  const StepperWidget({
    Key? key,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
    required this.icons,
  })  : assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        children: _steps(),
      ),
    );
  }

  getCircleColor(i) {
    Color color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = currentStepColor;
    } else {
      color = AppColors.white_color;
    }
    return color;
  }

  getBorderColor(i) {
    Color color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = currentStepColor;
    } else {
      color = inactiveColor;
    }

    return color;
  }

  getLineColor(i) {
    var color = curStep > i + 1
        ? AppColors.pink_color.withOpacity(
            0.4,
          )
        : AppColors.pink_color.withOpacity(
            0.4,
          );
    return color;
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      //colors according to state
      var circleColor = getCircleColor(
        i,
      );
      var borderColor = getBorderColor(
        i,
      );
      var lineColor = getLineColor(
        i,
      );

      // step circles
      list.add(
        Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                200.0,
              ),
            ),
            border: Border.all(
              color: borderColor,
              width: 0,
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
          ),
          child: getInnerElementOfStepper(
            i,
          ),
        ),
      );

      // Line between step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color: lineColor,
            ),
          ),
        );
      }
    }

    return list;
  }

  Widget getInnerElementOfStepper(index) {
    if (index + 1 < curStep) {
      return const Icon(
        Icons.check,
        color: AppColors.white_color,
        size: 22.0,
      );
    } else if (index + 1 == curStep) {
      return Center(
        child: Icon(
          icons[index],
          color: AppColors.red_color,
        ),
      );
    } else {
      return Container();
    }
  }
}
