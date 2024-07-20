import 'dart:math';

const double centerBerlinLat = 52.5207982;
const double centerBerlinLng = 13.405194;

double calculateDistanceBetweenTwoLatLng(
  lat1,
  lon1, [
  lat2 = centerBerlinLat,
  lon2 = centerBerlinLng,
]) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

bool isOutOfScope(lat1, lon1) {
  final distance = calculateDistanceBetweenTwoLatLng(lat1, lon1);
  return distance > 30;
}
