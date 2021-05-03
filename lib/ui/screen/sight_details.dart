import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight_description.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings/strings.dart';

class SightDetails extends StatefulWidget {
  final SightDescription description;

  const SightDetails({
    Key key,
    this.description,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SightDetails> {
  final bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme(
      subtitle2: TextStyle(
        color: _isDarkMode ? dmTextColorSecondary1 : lmTextColorSecondary1,
      ),
    );
    final theme = Theme.of(context);
    final detailsTheme = theme.copyWith(
      textTheme: theme.textTheme.merge(textTheme),
    );
    return Theme(
      data: detailsTheme,
      child: Scaffold(
        appBar: _DetailsAppBar(description: widget.description),
        body: SafeArea(child: _DetailsBody(description: widget.description)),
      ),
    );
  }
}

class _DetailsBody extends StatelessWidget {
  const _DetailsBody({
    Key key,
    @required this.description,
  }) : super(key: key);

  final SightDescription description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Text(
              description.name,
              style: Theme.of(context).textTheme.headline5,
              maxLines: 2,
            ),
            const SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  description.type,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(width: 16),
                Text(
                  description.workHours,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              description.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 24),
            _ActionButton(),
            const SizedBox(height: 24),
            _Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: _SecondaryActionButton()),
                Expanded(child: _SecondaryActionButton()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SightDescription description;

  const _DetailsAppBar({
    Key key,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Stack(
        children: [
          Container(
            color: Theme.of(context).cardColor,
            child: Image.network(
              '${description.url}',
              width: double.infinity,
              fit: BoxFit.fitWidth,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? Stack(
                        children: [
                          child,
                          _GradientLayer(),
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
          Positioned(
            top: 36,
            left: 16,
            child: _AppBarBackButton(onBackPressed: () => {}),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(360);
}

class _SecondaryActionButton extends StatelessWidget {
  const _SecondaryActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      color: lmImageMockColor,
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.8,
      color: dividerColor,
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        child: Text(
          buildRouteButtonText.toUpperCase(),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          primary: accentColorGreen,
          elevation: 0,
          textStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                color: dmAccent,
              ),
        ),
        onPressed: () => {},
      ),
    );
  }
}

class _AppBarBackButton extends StatelessWidget {
  final VoidCallback onBackPressed;

  const _AppBarBackButton({
    Key key,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => onBackPressed,
      child: Container(
        width: 32,
        height: 32,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: isDark ? dmBackground : lmBackground,
        ),
        child: Center(
          child: Icon(
            Icons.keyboard_arrow_left,
            color: isDark ? dmIconColor : lmIconColor,
          ),
        ),
      ),
    );
  }
}

class _GradientLayer extends StatelessWidget {
  const _GradientLayer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.multiply,
        color: Colors.black.withOpacity(0.4),
        gradient: LinearGradient(
          begin: FractionalOffset(0.5, -1.3125),
          end: FractionalOffset(0.5, 1.6354),
          colors: [
            cardImageGradient1.withOpacity(1),
            cardImageGradient2.withOpacity(0.08),
          ],
          stops: [0, 1],
        ),
      ),
    );
  }
}
