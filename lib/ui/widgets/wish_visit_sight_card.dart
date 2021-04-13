import 'package:flutter/widgets.dart';
import 'package:places/domain/domain.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/base_sight_card.dart';

class WishVistSightCard extends BaseSightCard {
  WishVistSightCard({
    Key key,
    WishVisitSight sight,
  }) : super(
          key: key,
          sight: sight,
          content: _WishVistSightContent(sight: sight),
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
            style: textMeduim16Secondary,
            softWrap: true,
          ),
          SizedBox(height: 2),
          Container(
            height: 28,
            child: Text(
              '${sight.visit}',
              style: textRegular14Accent,
            ),
          ),
          Text(
            '${sight.workHours}',
            style: textRegular14Secondary1,
          ),
        ],
      ),
    );
  }
}
