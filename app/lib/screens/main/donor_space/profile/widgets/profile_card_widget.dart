import 'package:flutter/material.dart';

class ProfileCardWidget extends StatefulWidget {
  const ProfileCardWidget({
    Key? key,
    required this.cardColor,
    required this.icon,
    required this.iconColor,
    required this.bgIconColor,
    required this.title,
    required this.titleColor,
    required this.linkIcon,
    required this.action,
  }) : super(key: key);

  final Color cardColor;
  final IconData icon;
  final Color iconColor;
  final Color bgIconColor;
  final String title;
  final Color titleColor;
  final bool linkIcon;
  final Function action;

  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget>
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

    return InkWell(
      enableFeedback: true,
      onTap: () => widget.action(),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        color: widget.cardColor,
        padding: const EdgeInsets.all(
          5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: widget.bgIconColor,
                  radius: _width / 15,
                  child: Icon(
                    widget.icon,
                    size: 30,
                    color: widget.iconColor,
                  ),
                ),
                SizedBox(
                  width: _width * 0.01,
                ),
                Text(
                  widget.title,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: widget.titleColor,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.navigate_next_outlined,
              size: (widget.linkIcon == true) ? _width * .08 : 0,
            ),
          ],
        ),
      ),
    );
  }
}
