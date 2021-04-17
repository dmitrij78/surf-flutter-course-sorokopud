class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final String type;
  final String workHours;

  Sight({
    this.name,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type,
    this.workHours,
  });
}

class VisitedSight extends Sight {
  final String visited;

  VisitedSight(
      {String name,
      double lat,
      double lon,
      String url,
      String details,
      String type,
      String workHours,
      this.visited})
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
      {String name,
      double lat,
      double lon,
      String url,
      String details,
      String type,
      String workHours,
      this.visit})
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
