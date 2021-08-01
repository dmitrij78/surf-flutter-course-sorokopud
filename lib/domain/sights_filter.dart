import 'package:equatable/equatable.dart';

part 'sight_categoty.dart';

class SightsFilter extends Equatable {
  static const minDistanceValue = 100.0;
  static const maxDistanceValue = 10000.0;

  final double minDistance;
  final double maxDistance;
  final Set<SightCategory> categories;

  SightsFilter._({
    required this.minDistance,
    required this.maxDistance,
    required this.categories,
  });

  factory SightsFilter.init() {
    return SightsFilter._(
      minDistance: minDistanceValue,
      maxDistance: maxDistanceValue,
      categories: Set.unmodifiable({}),
    );
  }

  @override
  List<Object?> get props => [minDistance, maxDistance, categories];

  SightsFilter copyWith({
    double? minDistance,
    double? maxDistance,
    Set<SightCategory>? categories,
  }) {
    return SightsFilter._(
      minDistance: minDistance ?? this.minDistance,
      maxDistance: maxDistance ?? this.maxDistance,
      categories: categories ?? this.categories,
    );
  }
}
