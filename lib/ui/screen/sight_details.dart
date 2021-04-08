import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight_description.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

class SightDetails extends StatelessWidget {
  final SightDescription description;

  const SightDetails({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _DetailsAppBar(),
      body: SafeArea(child: _DetailsBody(description: description)),
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                description.name,
                style: textBold24Secondary,
                maxLines: 2,
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(description.type, style: textBold14),
                  const SizedBox(width: 16),
                  Text(description.workHours, style: textRegular14Secondary1),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                description.description,
                style: textRegular14Secondary.copyWith(height: 1.3),
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
      ),
    );
  }
}

class _DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _DetailsAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          Container(
            color: imageMockColor,
          ),
          Positioned(
            top: 36,
            left: 16,
            child: _AppBarBackButtonInverse(onBackPressed: () => {}),
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
      color: imageMockColor,
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
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: accent,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class _AppBarBackButtonInverse extends StatelessWidget {
  final VoidCallback onBackPressed;

  const _AppBarBackButtonInverse({
    Key key,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onBackPressed,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.topLeft,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: witeBackground,
        ),
        child: Center(child: const Icon(Icons.keyboard_arrow_left)),
      ),
    );
  }
}
