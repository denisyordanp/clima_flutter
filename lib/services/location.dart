import 'package:geolocator/geolocator.dart';

class Location {

  Future<Position> handleLocation() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        return _getLocation();
      } else {
        throw const PermissionDeniedException("denied");
      }
    } else {
      return _getLocation();
    }
  }

  Future<Position> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }
}
