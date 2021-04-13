import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/base_sight_card.dart';

class SightCard extends BaseSightCard {
  SightCard({
    Key key,
    Sight sight,
  }) : super(
          key: key,
          sight: sight,
          content: _SightContent(sight: sight),
        );
}

class _SightContent extends StatelessWidget {
  final Sight sight;

  _SightContent({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${sight.name}',
            style: textMeduim16Secondary,
            softWrap: true,
          ),
          SizedBox(height: 2),
          Text(
            '${sight.workHours}',
            style: textRegular14Secondary1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
