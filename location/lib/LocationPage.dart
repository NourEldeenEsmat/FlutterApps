
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});


  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  String? location;
  Position? currentPosition;

  Future<bool> _handelLocationPermision() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      ScaffoldMessenger.of(context).
      showSnackBar(SnackBar(content: Text('Please Enable your Location Services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      await Geolocator.requestPermission();
      ScaffoldMessenger.of(context).
      showSnackBar(SnackBar(content: Text('Please Enable your Location Services')));
      return false;
    }return true;
  }

  Future<void> _getCurrentLocation()async{
    final hasPermission = await _handelLocationPermision();
    if(!hasPermission) return;
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low).then((Position position){
        setState(() {
          currentPosition = position;
        });
        _getAddresFromLatlng(currentPosition!);
      }).catchError((e){
        print(e);
      });
  }

  Future<void> _getAddresFromLatlng(Position position)async{
    await placemarkFromCoordinates(currentPosition!.latitude,currentPosition!.longitude)
        .then((List<Placemark> placemarks){
      Placemark place = placemarks[0];
      location = '${place.street } '
          ',${place.subLocality } ,${place.country}  ,${place
          .postalCode } ';
  }).catchError((e){
  print(e);
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude ${currentPosition?.latitude ?? ""}'),
            Text('longitude ${currentPosition?.longitude ?? ""}'),
            Text('accuracy ${currentPosition?.accuracy ?? ""}'),
            Text('altitude ${currentPosition?.altitude ?? ""}'),
            Text('speed ${currentPosition?.speed ?? ""}'),
            Text('Address ${currentPosition ?? ""}'),
            const SizedBox(height: 33,),
            ElevatedButton(onPressed: _getCurrentLocation,
              child: const Text('Location'),)
          ],
        )
      ),
    );
  }
}
