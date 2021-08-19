import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/extensions/extensions.dart';

class BaseSightCard extends StatelessWidget {
  final Sight sight;
  final Widget? content;
  final List<Widget>? actions;

  BaseSightCard({
    Key? key,
    required this.sight,
    this.content,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(
        '${sight.url}',
        width: double.infinity,
        height: 188.0,
        fit: BoxFit.fitWidth,
        loadingBuilder: (context, image, progress) {
          return progress == null
              ? _ImageCoverLayer(
                  sight: sight,
                  image: image,
                  content: content,
                  actions: actions,
                )
              : _ImageLoadProgress(
                  value: _calculateProgressValue(
                    progress.cumulativeBytesLoaded,
                    progress.expectedTotalBytes!,
                  ),
                );
        },
      ),
    );
  }

  _calculateProgressValue(int loaded, int total) => loaded / total;
}

class _ImageLoadProgress extends StatelessWidget {
  final double value;

  const _ImageLoadProgress({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(value: value),
    );
  }
}

class _ImageCoverLayer extends StatelessWidget {
  final Sight sight;
  final Widget image;
  final Widget? content;
  final List<Widget>? actions;

  const _ImageCoverLayer({
    Key? key,
    required this.sight,
    required this.image,
    this.content,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image,
        Positioned.fill(
          child: const _GradientLayer(),
        ),
        Positioned(
          top: 16.0,
          left: 16.0,
          child: _SightCategoryText(sight: sight),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _BottomCardContent(content: content),
          ),
        ),
        Positioned.fill(
          child: const _TouchInteractionLayer(),
        ),
        Positioned(
          top: 11,
          right: 9,
          child: Row(
            children: [
              for (var action in actions!)
                Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: action,
                )
            ],
          ),
        ),
      ],
    );
  }
}

class _TouchInteractionLayer extends StatelessWidget {
  const _TouchInteractionLayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        child: InkWell(
          onTap: () => print('On sight card tap'),
        ),
      ),
    );
  }
}

class _BottomCardContent extends StatelessWidget {
  const _BottomCardContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: const SizedBox.shrink()),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 96.0),
          child: _BottomContentLayer(content: content),
        ),
      ],
    );
  }
}

class _SightCategoryText extends StatelessWidget {
  const _SightCategoryText({
    Key? key,
    required this.sight,
  }) : super(key: key);

  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${sight.category.description}',
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: dmTextColorPrimary),
    );
  }
}

class _GradientLayer extends StatelessWidget {
  const _GradientLayer({
    Key? key,
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
            cardImageGradient1.withOpacity(1),
            cardImageGradient1.withOpacity(0.08),
          ],
          stops: [0, 1],
        ),
      ),
    );
  }
}

class _BottomContentLayer extends StatelessWidget {
  final Widget? content;
  const _BottomContentLayer({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
      ),
      padding: const EdgeInsets.all(16),
      child: content ?? SizedBox.shrink(),
    );
  }
}
