import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/domain.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/base_sight_card.dart';

class VistedSightCard extends BaseSightCard {
  VistedSightCard({
    Key key,
    VisitedSight sight,
  }) : super(
          key: key,
          sight: sight,
          content: _VistedSightCard(sight: sight),
          actions: [
            Container(width: 20, height: 18, color: Colors.white),
            Container(width: 20, height: 18, color: Colors.blue),
          ],
        );
}

class _VistedSightCard extends StatelessWidget {
  final VisitedSight sight;

  _VistedSightCard({Key key, this.sight}) : super(key: key);

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
          ),
          SizedBox(height: 2),
          Container(
            height: 28,
            child: Text(
              '${sight.visited}',
              style: textRegular14Secondary1,
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
