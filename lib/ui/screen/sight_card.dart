import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

class SightCard extends StatelessWidget {
  static const double PRVIEW_IMAGE_HEIGT = 96;

  final Sight sight;

  const SightCard({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildImageContainer(),
        _buildDescriptionContainer(),
      ],
    );
  }

  Widget _buildDescriptionContainer() {
    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: const Radius.circular(12),
          bottomRight: const Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: Text(
              '${sight.name}',
              style: textMeduim16Secondary,
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            '${sight.details}',
            style: textRegular14Secondary1,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer() {
    return Stack(
      children: [
        Container(
          //Картинка превью достопримечательности
          height: PRVIEW_IMAGE_HEIGT,
          decoration: BoxDecoration(
            color: imageMockColor,
            borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
            ),
          ),
        ),
        Positioned(
            //Кнопка Хочу посетить
            top: 16,
            left: 16,
            child: Text('${sight.type}', style: textBold14Inverse)),
        Positioned(
            top: 19,
            right: 18,
            child: Container(width: 20, height: 18, color: Colors.white)),
      ],
    );
  }
}
