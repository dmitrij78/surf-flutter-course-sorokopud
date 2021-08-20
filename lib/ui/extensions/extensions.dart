import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/domain.dart';
import 'package:places/ui/res/colors.dart';

extension SightCategoryExt on SightCategory {
  String get description {
    switch (this) {
      case SightCategory.hotel:
        return 'Отель';
      case SightCategory.restaurant:
        return 'Ресторан';
      case SightCategory.special:
        return 'Особое место';
      case SightCategory.park:
        return 'Парк';
      case SightCategory.museum:
        return 'Музей';
      case SightCategory.caffe:
        return 'Кафе';
    }
  }

  Widget get icon {
    late String iconAsset;
    switch (this) {
      case SightCategory.hotel:
        iconAsset = 'res/icons/ic_category_hotel.svg';
        break;
      case SightCategory.restaurant:
        iconAsset = 'res/icons/ic_category_restaurant.svg';
        break;
      case SightCategory.special:
        iconAsset = 'res/icons/ic_category_special.svg';
        break;
      case SightCategory.park:
        iconAsset = 'res/icons/ic_category_park.svg';
        break;
      case SightCategory.museum:
        iconAsset = 'res/icons/ic_category_museum.svg';
        break;
      case SightCategory.caffe:
        iconAsset = 'res/icons/ic_category_caffee.svg';
        break;
    }
    return SvgPicture.asset(iconAsset, color: accentColorGreen);
  }
}

extension ListExt<T> on List<T> {
  List<List<T>> splitByColumns(int columnsCount) {
    if (columnsCount <= 0) return List.empty();

    final result = List<List<T>>.empty(growable: true);
    final length = this.length;
    final decrement = length % columnsCount != 0 ? 1 : 0;
    final rowsCount = length ~/ columnsCount + decrement;

    for (var rowIndex = 0; rowIndex < rowsCount; rowIndex++) {
      final start = rowIndex * columnsCount;
      final lastIndex = start + columnsCount;
      final end = lastIndex > length ? length : lastIndex;

      result.add(sublist(start, end));
    }

    return List.unmodifiable(result);
  }
}
