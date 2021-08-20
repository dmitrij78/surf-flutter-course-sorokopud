import 'dart:math';

class GeoPoint {
  final double lat;
  final double long;
  const GeoPoint({
    required this.lat,
    required this.long,
  });

  bool isInRadius(GeoPoint other, double maxRadius, [double minRadius = 0.0]) {
    final distance = caluclateDistance(other);
    return distance > minRadius && distance <= maxRadius;
  }

  double caluclateDistance(GeoPoint other) {
    final ky = 40000 / 360;
    final kx = cos(pi * other.lat / 180.0) * ky;
    final dx = ((other.long - this.long) * kx).abs();
    final dy = ((other.lat - this.lat) * ky).abs();
    return sqrt(dx * dx + dy * dy);
  }

  @override
  String toString() => 'GeoPoint(lat: $lat, long: $long)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GeoPoint && other.lat == lat && other.long == long;
  }

  @override
  int get hashCode => lat.hashCode ^ long.hashCode;
}
