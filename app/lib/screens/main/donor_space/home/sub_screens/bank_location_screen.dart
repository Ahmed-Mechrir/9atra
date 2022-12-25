import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../config/colors.dart';

class BankLocationScreen extends StatefulWidget {
  const BankLocationScreen({
    Key? key,
    required this.longitude_pos,
    required this.latitude_pos,
    required this.title,
  }) : super(key: key);

  final double latitude_pos;
  final double longitude_pos;
  final String title;

  @override
  State<BankLocationScreen> createState() => _BankLocationScreenState();
}

class _BankLocationScreenState extends State<BankLocationScreen> {
  // Declarations
  late GoogleMapController _googleMapController;
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  var maptype = MapType.normal;
  Icon mapicon =
      const Icon(Icons.map_outlined, size: 30, color: AppColors.red_color);

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
      body: GoogleMap(
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude_pos, widget.longitude_pos),
          zoom: 5,
        ),
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: false,
        onMapCreated: (controller) => _googleMapController = controller,
        onLongPress: null,
        mapType: maptype,
        markers: {
          Marker(
            markerId: MarkerId(
              widget.title,
            ),
            position: LatLng(
              widget.latitude_pos,
              widget.longitude_pos,
            ),
            infoWindow: InfoWindow(
              title: widget.title,
              snippet: '',
            ),
            anchor: const Offset(0.5, 0.5),
            zIndex: 1,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: SizedBox(
        height: _height * 0.16,
        width: _width * 0.12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: AppColors.white_color,
              foregroundColor: AppColors.red_color,
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(
                      widget.latitude_pos,
                      widget.longitude_pos,
                    ),
                    zoom: 12,
                  ),
                ),
              ),
              child: const Icon(
                Icons.center_focus_strong,
                size: 25,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: AppColors.white_color,
              foregroundColor: AppColors.red_color,
              onPressed: () {
                setState(() {
                  (maptype == MapType.normal)
                      ? maptype = MapType.hybrid
                      : maptype = MapType.normal;
                  (maptype == MapType.normal)
                      ? mapicon = const Icon(
                          Icons.map_outlined,
                          size: 30,
                          color: AppColors.red_color,
                        )
                      : mapicon = const Icon(
                          Icons.map_rounded,
                          size: 30,
                          color: AppColors.red_color,
                        );
                });
              },
              child: mapicon,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
}
