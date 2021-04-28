import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/domain.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/widgets/base_sight_card.dart';

class WishVistSightCard extends BaseSightCard {
  WishVistSightCard({
    Key key,
    WishVisitSight sight,
  }) : super(
          key: key,
          sight: sight,
          content: _WishVistSightContent(sight: sight),
          actions: [
            Container(width: 20, height: 18, color: Colors.green),
            Container(width: 20, height: 18, color: Colors.white),
          ],
        );
}

class _WishVistSightContent extends StatelessWidget {
  final WishVisitSight sight;

  _WishVistSightContent({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${sight.name}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 2),
          Container(
            height: 28,
            child: Text(
              '${sight.visit}',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: textColorAccentGreen),
            ),
          ),
          Text(
            '${sight.workHours}',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
