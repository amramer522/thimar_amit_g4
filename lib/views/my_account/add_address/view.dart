import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar_amit_g4/core/design/app_input.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  Set<Marker> markers = {};
  String addressText = "";
  LatLng? myLocation;

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();
    myLocation = LatLng(position.latitude, position.longitude);
    await getAddress(myLocation!);

    markers
        .add(Marker(markerId: MarkerId("myLocation"), position: myLocation!));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> getAddress(LatLng argument) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(argument.latitude, argument.longitude);
    print("***********");
    print(placemarks.length);
    if (placemarks.isNotEmpty) {
      final address = placemarks.first;
      addressText = (address.locality ?? "") +
          " " +
          (address.administrativeArea ?? "") +
          " " +
          (address.country ?? "");
      print(address.name);
      print(address.administrativeArea);
      print(address.country);
      print(address.locality);
      print(address.street);
      print(address.subAdministrativeArea);
      print(address.thoroughfare);
    } else {
      addressText = "No Location Desctiption Founded";
    }

    addressController.text = addressText;
  }
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إضافة عنوان"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: myLocation == null
                  ? Center(child: CircularProgressIndicator())
                  : GoogleMap(
                markers: markers,
                onTap: (argument) async {
                  getAddress(argument);
                  markers.add(Marker(
                      markerId: MarkerId("myLocation"), position: argument));
                  setState(() {});
                },
                initialCameraPosition:
                CameraPosition(target: myLocation!, zoom: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: addressController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
