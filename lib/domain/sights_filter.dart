import 'package:equatable/equatable.dart';

part 'sight_categoty.dart';

class SightFilter extends Equatable {
  static const minDistanceValue = 10.0;
  static const maxDistanceValue = 10000.0;

  final double minDistance;
  final double maxDistance;
  final Set<SightCategory> categories;

  SightFilter._({
    required this.minDistance,
    required this.maxDistance,
    required this.categories,
  });

  factory SightFilter.init() {
    return SightFilter._(
      minDistance: minDistanceValue,
      maxDistance: maxDistanceValue,
      categories: Set<SightCategory>.from(SightCategory.values),
    );
  }

  @override
  List<Object?> get props => [minDistance, maxDistance, categories];

  SightFilter copyWith({
    double? minDistance,
    double? maxDistance,
    Set<SightCategory>? categories,
  }) {
    return SightFilter._(
      minDistance: minDistance ?? this.minDistance,
      maxDistance: maxDistance ?? this.maxDistance,
      categories: categories ?? this.categories,
    );
  }
}
