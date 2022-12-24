// map_center_association.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:app_9atra/utils/importations.dart';

class ListCenterAssociationScreen extends StatefulWidget {
  const ListCenterAssociationScreen({Key? key}) : super(key: key);

  @override
  _ListCenterAssociationScreenState createState() =>
      _ListCenterAssociationScreenState();
}

class _ListCenterAssociationScreenState
    extends State<ListCenterAssociationScreen> {
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

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Centres et associations",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black_color,
                ),
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.filter_alt_rounded,
                  color: AppColors.red_color,
                  size: 18,
                ),
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                label: const Text(
                  'Filtre',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.red_color,
                  ),
                ),
              ),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: Colors.transparent,
                ),
          ),
          child: SizedBox(
            width: _width,
            height: _height * 0.6,
            child: const CentersAssociationsList(),
          ),
        ),
      ],
    );
  }
}
