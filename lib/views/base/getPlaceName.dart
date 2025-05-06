import 'package:geocoding/geocoding.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class GetPlaceNameFromLatLong {
  //====================== Get place name


 static getPlaceName(double latitude, double longitude  ) async {

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return "${place.subLocality}, ${place.locality}";
      }
      return "No place name found";
    } catch (e) {
      return "Error: $e";
    }
  }
}