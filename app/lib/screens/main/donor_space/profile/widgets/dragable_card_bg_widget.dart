// Slide Right and Left Background ---------------------------------------------------------
import 'package:app_9atra/config/colors.dart';
import 'package:flutter/material.dart';

Widget slideRightBackground() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        10,
      ),
      gradient: LinearGradient(
        colors: [
          AppColors.white_bg_color,
          Colors.yellow.shade50,
          Colors.yellow.shade700,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.yellow.shade700,
          ),
          Text(
            " Modifier",
            style: TextStyle(
              color: Colors.yellow.shade700,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
  );
}

Widget slideLeftBackground() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        10,
      ),
      gradient: LinearGradient(
        colors: [
          Colors.red.shade700,
          Colors.red.shade100,
          AppColors.white_bg_color,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          Icon(
            Icons.delete,
            color: Colors.red,
          ),
          Text(
            " Supprimer",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}
