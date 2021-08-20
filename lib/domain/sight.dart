import 'package:places/domain/domain.dart';

class Sight {
  final String name;
  final GeoPoint geoPoint;
  final String url;
  final String details;
  final SightCategory category;
  final String workHours;

  Sight({
    required this.name,
    required this.geoPoint,
    required this.url,
    required this.details,
    required this.category,
    required this.workHours,
  });
}

class VisitedSight extends Sight {
  final String visited;

  VisitedSight(
      {required String name,
      required GeoPoint geoPoint,
      required String url,
      required String details,
      required SightCategory category,
      required String workHours,
      required this.visited})
      : super(
          name: name,
          geoPoint: geoPoint,
          url: url,
          details: details,
          category: category,
          workHours: workHours,
        );
}

class WishVisitSight extends Sight {
  final String visit;

  WishVisitSight(
      {required String name,
      required GeoPoint geoPoint,
      required String url,
      required String details,
      required SightCategory category,
      required String workHours,
      required this.visit})
      : super(
          name: name,
          geoPoint: geoPoint,
          url: url,
          details: details,
          category: category,
          workHours: workHours,
        );
}
