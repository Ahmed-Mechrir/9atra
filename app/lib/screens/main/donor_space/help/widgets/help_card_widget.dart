import 'package:app_9atra/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/colors.dart';

class HelpCardWidget extends StatefulWidget {
  const HelpCardWidget({
    Key? key,
    required this.index,
    required this.cardColor,
    required this.svgIcon,
    required this.svgIconColor,
    required this.bgIconColor,
    required this.title,
    required this.titleColor,
    required this.action,
  }) : super(key: key);

  final int index;
  final Color cardColor;
  final String svgIcon;
  final Color svgIconColor;
  final Color bgIconColor;
  final String title;
  final Color titleColor;
  final Function action;

  @override
  State<HelpCardWidget> createState() => _HelpCardWidgetState();
}

class _HelpCardWidgetState extends State<HelpCardWidget>
    with SingleTickerProviderStateMixin {
  // Declarations
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Transform.translate(
      offset: const Offset(
        0,
        3,
      ),
      child: InkWell(
        enableFeedback: true,
        onTap: () => widget.action(),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            10,
            0,
            10,
            14,
          ),
          padding: EdgeInsets.all(
            _width / 20,
          ),
          width: _width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.cardColor,
            borderRadius: BorderRadius.circular(
              20,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey_color_2.withOpacity(
                  0.3,
                ),
                offset: const Offset(
                  0,
                  0,
                ),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: widget.bgIconColor,
                radius: _width / 15,
                child: SvgPicture.asset(
                  widget.svgIcon,
                  alignment: Alignment.center,
                  color: widget.svgIconColor,
                  height: _height * 0.035,
                ),
              ),
              SizedBox(
                width: _width * 0.02,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            widget.title.toCapitalized(),
                            textScaleFactor: 1.1,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: widget.titleColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: _width * 0.04,
              ),
              Icon(
                Icons.navigate_next_outlined,
                size: _width * .08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
