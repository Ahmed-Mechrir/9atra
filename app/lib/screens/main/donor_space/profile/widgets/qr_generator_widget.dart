import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneratorWidget extends StatelessWidget {
  const QrGeneratorWidget({
    super.key,
    required this.data,
    required this.size,
  });

  final String data;
  final double size;

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: data,
      version: QrVersions.auto,
      size: size,
    );
  }
}
