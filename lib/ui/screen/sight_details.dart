import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight_description.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

class SightDetails extends StatelessWidget {
  static const double IMAGE_PAGER_HEIGHT = 360;
  static const double BACK_BUTTON_SIZE = 32;

  final SightDescription description;

  const SightDetails({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createBody(),
    );
  }

  PreferredSizeWidget _createAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: IMAGE_PAGER_HEIGHT,
      flexibleSpace: Stack(
        children: [
          _buildMockImage(),
          Positioned(
            top: 36,
            left: 16,
            child: _buidBackButton(),
          )
        ],
      ),
    );
  }

  Widget _createBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //_createImagePager(),
            const SizedBox(height: 24),
            _createTitle(),
            const SizedBox(height: 2),
            _createSubtitle(),
            const SizedBox(height: 24),
            _createDescription(),
            const SizedBox(height: 24),
            _createBuildRouteButton(),
            const SizedBox(height: 24),
            _createDivider(),
            const SizedBox(height: 8),
            _createActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildMockImage() {
    return Container(
      color: imageMockColor,
    );
  }

  Widget _buidBackButton() {
    return GestureDetector(
      onTap: () => _onBackPressed(),
      child: Container(
        width: BACK_BUTTON_SIZE,
        height: BACK_BUTTON_SIZE,
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

  Widget _createTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        description.name,
        style: textBold24Secondary,
        maxLines: 2,
      ),
    );
  }

  Widget _createSubtitle() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(description.type, style: textBold14),
            const SizedBox(width: 16),
            Text(description.workHours, style: textRegular14Secondary1),
          ],
        ));
  }

  Widget _createDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        description.description,
        style: textRegular14Secondary.copyWith(height: 1.3),
      ),
    );
  }

  Widget _createBuildRouteButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: accent,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _createDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 0.8,
        color: dividerColor,
      ),
    );
  }

  Widget _createActionButtons() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: imageMockColor,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: dividerColor,
                ),
              ),
            ],
          ),
        ));
  }

  void _onBackPressed() {}
}
