// map_center_association.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:qatra_app/utils/importations.dart';

class MapCenterAssociationScreen extends StatefulWidget {
  const MapCenterAssociationScreen({Key? key}) : super(key: key);

  @override
  _MapCenterAssociationScreenState createState() =>
      _MapCenterAssociationScreenState();
}

class _MapCenterAssociationScreenState
    extends State<MapCenterAssociationScreen> {
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
            child: CentersAssociationsMap(),
          ),
        ),
      ),
    );
  }
}
