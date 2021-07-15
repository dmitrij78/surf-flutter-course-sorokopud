class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final String type;
  final String workHours;

  Sight({
    required this.name,
    required this.lat,
    required this.lon,
    required this.url,
    required this.details,
    required this.type,
    required this.workHours,
  });
}

class VisitedSight extends Sight {
  final String visited;

  VisitedSight(
      {required String name,
      required double lat,
      required double lon,
      required String url,
      required String details,
      required String type,
      required String workHours,
      required this.visited})
      : super(
          name: name,
          lat: lat,
          lon: lon,
          url: url,
          details: details,
          type: type,
          workHours: workHours,
        );
}

class WishVisitSight extends Sight {
  final String visit;

  WishVisitSight(
      {required String name,
      required double lat,
      required double lon,
      required String url,
      required String details,
      required String type,
      required String workHours,
      required this.visit})
      : super(
          name: name,
          lat: lat,
          lon: lon,
          url: url,
          details: details,
          type: type,
          workHours: workHours,
        );
}
