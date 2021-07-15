import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/widgets/base_sight_card.dart';

import 'buttons/card_icon_button.dart';

class SightCard extends BaseSightCard {
  SightCard({
    Key? key,
    Sight? sight,
  }) : super(
          key: key,
          sight: sight,
          content: _SightContent(sight: sight),
          actions: [
            CardIconButton(
              icon: SvgPicture.asset(
                'res/icons/ic_favorite.svg',
                color: dmAccent,
              ),
              onPressed: () => print('SightCard. AddToFavorite is pressed'),
            )
          ],
        );
}

class _SightContent extends StatelessWidget {
  final Sight? sight;

  _SightContent({Key? key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${sight!.name}',
            style: Theme.of(context).textTheme.bodyText1,
            softWrap: true,
          ),
          SizedBox(height: 2),
          Text(
            '${sight!.workHours}',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
