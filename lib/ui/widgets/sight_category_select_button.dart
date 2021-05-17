import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

class SightCategorySelectButton extends StatelessWidget {
  const SightCategorySelectButton({
    Key key,
    @required this.category,
    @required this.isSelected,
    @required this.onSelect,
  }) : super(key: key);

  final SightCategory category;
  final bool isSelected;
  final Function(SightCategory category) onSelect;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => {},
        child: Container(
          width: 92,
          height: 96,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _CategoryIcon(),
              Text(
                'Отели',
                style: dmCaption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          alignment: Alignment.center,
          width: 64.0,
          height: 64.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: accentColorGreen.withOpacity(0.16),
          ),
          child: SizedBox(
            width: 30.0,
            height: 24.0,
            child: SvgPicture.asset(
              'res/icons/ic_catalog_hotel.svg',
              color: accentColorGreen,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 16.0,
            height: 16.0,
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: SvgPicture.asset(
              'res/icons/ic_selected.svg',
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
