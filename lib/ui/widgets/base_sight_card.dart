import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

class BaseSightCard extends StatelessWidget {
  static const double imageHeight = 188;

  final Sight sight;
  final Widget content;
  final List<Widget> actions;

  BaseSightCard({
    Key key,
    @required this.sight,
    this.content,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: imageHeight),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            const Radius.circular(12),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Image.network(
            '${sight.url}',
            width: double.infinity,
            height: imageHeight,
            fit: BoxFit.fitWidth,
            loadingBuilder: (context, image, progress) {
              return progress == null
                  ? _ImageCoverLayer(
                      sight: sight,
                      image: image,
                      imageGradientHeight: imageHeight,
                      content: content,
                      actions: actions,
                    )
                  : _ImageLoadProgress(
                      value: _calculateProgressValue(
                        progress.cumulativeBytesLoaded,
                        progress.expectedTotalBytes,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  _calculateProgressValue(int loaded, int total) => loaded / total;
}

class _ImageLoadProgress extends StatelessWidget {
  final double value;

  const _ImageLoadProgress({
    Key key,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(value: value));
  }
}

class _ImageCoverLayer extends StatelessWidget {
  final double imageGradientHeight;
  final Sight sight;
  final Widget image;
  final Widget content;
  final List<Widget> actions;

  const _ImageCoverLayer({
    Key key,
    @required this.sight,
    @required this.image,
    @required this.imageGradientHeight,
    this.content,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image,
        _GradientLayer(imageGradientHeight),
        Column(
          children: [
            _TopTransparentLayer(
              sight: sight,
              actions: actions,
            ),
            _BottomContentLayer(content: content),
          ],
        )
      ],
    );
  }
}

class _GradientLayer extends StatelessWidget {
  final double height;

  const _GradientLayer(
    this.height, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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

class _BottomContentLayer extends StatelessWidget {
  static const double minHeight = 96;

  final Widget content;
  const _BottomContentLayer({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
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
        child: content ?? SizedBox.shrink(),
      ),
    );
  }
}

class _TopTransparentLayer extends StatelessWidget {
  static const double height = 92;

  final Sight sight;
  final List<Widget> actions;

  const _TopTransparentLayer({
    Key key,
    @required this.sight,
    List<Widget> actions,
  })  : this.actions = actions ?? const [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
            ),
          ),
        ),
        Positioned(
            top: 16,
            left: 16,
            child: Text('${sight.type}', style: textBold14Inverse)),
        Positioned(
            top: 19,
            right: 18,
            child: Row(
              children: [
                for (var action in actions)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: action,
                  )
              ],
            )),
      ],
    );
  }
}
