import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/domain.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/widgets/base_sight_card.dart';
import 'package:places/ui/widgets/buttons/card_icon_button.dart';

class VistedSightCard extends BaseSightCard {
  VistedSightCard({
    Key? key,
    VisitedSight? sight,
  }) : super(
          key: key,
          sight: sight,
          content: _VistedSightCard(sight: sight),
          actions: [
            CardIconButton(
              icon: SvgPicture.asset(
                'res/icons/ic_share.svg',
                color: dmAccent,
              ),
              onPressed: () => print('VistedSightCard.'
                  ' ShareButton is pressed'),
            ),
            CardIconButton(
              icon: SvgPicture.asset(
                'res/icons/ic_delete.svg',
                color: dmAccent,
              ),
              onPressed: () => print('VistedSightCard.'
                  ' DeleteButton is pressed'),
            )
          ],
        );
}

class _VistedSightCard extends StatelessWidget {
  final VisitedSight? sight;

  _VistedSightCard({Key? key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${sight!.name}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 2),
          Container(
            height: 28,
            child: Text(
              '${sight!.visited}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Text(
            '${sight!.workHours}',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
