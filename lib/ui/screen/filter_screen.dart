import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:places/domain/domain.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/buttons/accent_action_button.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/widgets/sight_category_select_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key, required this.filter}) : super(key: key);

  final SightFilter filter;

  @override
  _FilterScreenState createState() => _FilterScreenState(filter);
}

class _FilterScreenState extends State<FilterScreen> {
  SightFilter _filter;
  int _sightCount = 191;

  _FilterScreenState(this._filter);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, _filter);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            _ClearFiltersButton(
              onPressed: () => print('FilterScreen. Clean filter is pressed'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: _CategoryFiltersLabel(),
                ),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: _CategoryFilterGrid(),
              ),
              Row(
                children: [
                  Text('Расстояние'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('от ${_filter.minDistance.toStringAsFixed(2)} '
                        'до ${_filter.maxDistance.toStringAsFixed(2)} км'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              RangeSlider(
                values: RangeValues(
                  _filter.minDistance,
                  _filter.maxDistance,
                ),
                min: SightFilter.minDistanceValue,
                max: SightFilter.maxDistanceValue,
                onChanged: (RangeValues values) {
                  setState(() {
                    _filter = _filter.copyWith(
                      minDistance: values.start,
                      maxDistance: values.end,
                    );
                  });
                },
                activeColor: accentColorGreen,
                inactiveColor: dividerColor,
              ),
              const SizedBox(height: 24),
              AccentActionButton(
                text: 'Показать ($_sightCount)',
                onPressed: () => print('Button BuildRoute is pressed'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryFilterGrid extends StatelessWidget {
  const _CategoryFilterGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SightCategorySelectButton(
              category: SightCategory.hotel,
              isSelected: false,
              onSelect: (category) => {},
            ),
            SightCategorySelectButton(
              category: SightCategory.hotel,
              isSelected: false,
              onSelect: (category) => {},
            ),
            Container(
              width: 92,
              height: 96,
              color: Colors.green,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 92,
              height: 96,
              color: Colors.redAccent,
            ),
            Container(
              width: 92,
              height: 96,
              color: Colors.lightBlue,
            ),
            Container(
              width: 92,
              height: 96,
              color: Colors.yellowAccent,
            ),
          ],
        ),
      ],
    );
  }
}

class _CategoryFiltersLabel extends StatelessWidget {
  const _CategoryFiltersLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      selectCategoryLabel.toUpperCase(),
      style: lmCaption.copyWith(color: lmTextColorInactiveBlack),
    );
  }
}

class _ClearFiltersButton extends StatelessWidget {
  const _ClearFiltersButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).brightness == Brightness.dark
        ? dmAppBarActionButtonStyle
        : lmAppBarActionButtonStyle;
    return TextButton(
      style: style,
      child: Text(clearFiltersButtonText),
      onPressed: onPressed,
    );
  }
}

class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter({
    Key? key,
    required this.type,
    required this.isSelected,
  }) : super(key: key);

  final SightCategory type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => {},
        child: Container(
          width: 92,
          height: 96,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Text('filter'),
                ),
              ),
              Text(
                'Отели',
                style: dmCaption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
