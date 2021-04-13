import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 188,
      decoration: BoxDecoration(
        color: panelBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Image.network(
          '${sight.url}',
          width: double.infinity,
          fit: BoxFit.fitWidth,
          loadingBuilder: (context, child, progress) {
            if (progress != null) {
              final loaded = progress.cumulativeBytesLoaded;
              final total = progress.expectedTotalBytes;
              final value = loaded / total;
              return _SightCardProgress(progressValue: value);
            } else {
              return _SightCardContent(sight: sight, image: child);
            }
          },
        ),
      ),
    );
  }
}

class _SightCardProgress extends StatelessWidget {
  const _SightCardProgress({
    Key key,
    @required this.progressValue,
  }) : super(key: key);

  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(value: progressValue));
  }
}

class _SightCardContent extends StatelessWidget {
  const _SightCardContent({
    Key key,
    @required this.sight,
    @required this.image,
  }) : super(key: key);

  final Sight sight;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image,
        _GradientCover(),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _CardImageContainer(sight: sight),
            _DiscriptionContainer(sight: sight),
          ],
        )
      ],
    );
  }
}

class _GradientCover extends StatelessWidget {
  const _GradientCover({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.multiply,
        color: Colors.black.withOpacity(0.4),
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            imageGradient1.withOpacity(1),
            imageGradient2.withOpacity(0.08),
          ],
          stops: [0, 1],
        ),
      ),
    );
  }
}

class _DiscriptionContainer extends StatelessWidget {
  const _DiscriptionContainer({
    Key key,
    @required this.sight,
  }) : super(key: key);

  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 96),
      child: Container(
        decoration: BoxDecoration(
          color: panelBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
        ),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${sight.name}',
              style: textMeduim16Secondary,
              maxLines: 3,
              overflow: TextOverflow.fade,
            ),
            SizedBox(height: 2),
            Text(
              '${sight.workHours}',
              style: textRegular14Secondary1,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}

class _CardImageContainer extends StatelessWidget {
  const _CardImageContainer({
    Key key,
    @required this.sight,
  }) : super(key: key);
  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 92,
          decoration: BoxDecoration(
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
