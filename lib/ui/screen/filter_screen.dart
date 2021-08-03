import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:places/domain/domain.dart';
import 'package:places/core/debouncer.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/buttons/accent_action_button.dart';
import 'package:places/ui/res/strings/strings.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:places/ui/extensions/extensions.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required this.filter,
    required this.sights,
    required this.currentGeoPoint,
  }) : super(key: key);

  final SightFilter filter;

  final List<Sight> sights;
  final GeoPoint currentGeoPoint;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  _FilterScreenState();

  late SightFilter _filter = widget.filter;

  @override
  Widget build(BuildContext context) {
    print('FilterScreen. _FilterScreenState. build');
    return FilterScreenStateProvider(
      filter: _filter,
      filteredSightsCount: _filteredSightsItemCount,
      onRangeUpdate: _onDisntanceRangeUpdate,
      onResetFilter: _resetFilter,
      onSelectCategory: _onSelectCategory,
      child: const _FilterScreen(),
    );
  }

  void _onDisntanceRangeUpdate(double min, double max) {
    setState(() {
      _filter = _filter.copyWith(
        minDistance: min,
        maxDistance: max,
      );
    });
  }

  void _resetFilter() {
    setState(() {
      _filter = SightFilter.init();
    });
  }

  void _onSelectCategory(SightCategory category) {
    setState(() {
      final categories = Set<SightCategory>.from(_filter.categories);
      if (categories.contains(category)) {
        categories.remove(category);
      } else {
        categories.add(category);
      }
      _filter = _filter.copyWith(categories: categories);
    });
  }

  int get _filteredSightsItemCount {
    return widget.sights.where(_isInRadius).where(_filterByCategory).length;
  }

  bool _isInRadius(Sight sight) => widget.currentGeoPoint.isInRadius(
        sight.geoPoint,
        _filter.maxDistance,
        _filter.minDistance,
      );

  bool _filterByCategory(Sight sight) =>
      _filter.categories.contains(sight.category);
}

class _FilterScreen extends StatelessWidget {
  const _FilterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const _ClearFiltersButton(),
          ],
        ),
        body: SafeArea(
          top: false,
          child: const _BodyContent(),
        ),
      ),
    );
  }
}

class FilterScreenStateProvider extends InheritedWidget {
  final int filteredSightsCount;
  final SightFilter filter;

  final Function(double min, double max) onRangeUpdate;
  final Function() onResetFilter;
  final Function(SightCategory category) onSelectCategory;

  FilterScreenStateProvider({
    Key? key,
    required Widget child,
    required this.filter,
    required this.filteredSightsCount,
    required this.onRangeUpdate,
    required this.onResetFilter,
    required this.onSelectCategory,
  }) : super(key: key, child: child);

  static FilterScreenStateProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FilterScreenStateProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant FilterScreenStateProvider oldWidget) {
    print('FilterScreen. FilterScreenStateProvider. updateShouldNotify');
    return oldWidget.filter != filter;
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FilterScreen. _BodyContent. build');
    return LayoutBuilder(builder: (context, contsraints) {
      return SingleChildScrollView(
        child: SizedBox(
          height: contsraints.maxHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24.0),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const _CategoryFiltersLabel(),
              ),
              const SizedBox(height: 24.0),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: const _CategoryFilterGrid(),
              ),
              const SizedBox(height: 60.0),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const _DistanceRangeText(),
              ),
              const SizedBox(height: 32.0),
              const _DistanceRangeSlider(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: const _ShowSightsButton(),
              )
            ],
          ),
        ),
      );
    });
  }
}

class _DistanceRangeText extends StatelessWidget {
  const _DistanceRangeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FilterScreen. _DistanceRangeText. build');
    final stateProvider = FilterScreenStateProvider.of(context);

    final minDistance = stateProvider.filter.minDistance;
    final maxDistance = stateProvider.filter.maxDistance;
    final distanceText = _createDistancteText(minDistance, maxDistance);

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final headerTextStyle = isDarkTheme ? dmLabelNormal : lmLabelNormal;
    final distanceRangeTextStyle = lmLabelNormal.copyWith(
      color: lmTextColorSecondary,
    );
    return Row(
      children: [
        Text(
          distanceHeaderLabel,
          maxLines: 1,
          style: headerTextStyle,
        ),
        const SizedBox(width: 4.0),
        Expanded(
          child: Text(
            distanceText,
            textAlign: TextAlign.end,
            maxLines: 1,
            style: distanceRangeTextStyle,
          ),
        ),
      ],
    );
  }

  String _createDistancteText(double minRange, double maxRange) {
    final minText = _toDistanceString(minRange);
    final maxText = _toDistanceString(maxRange);
    return 'от $minText до $maxText';
  }

  String _toDistanceString(num value) {
    final digits = _isRound(value) ? 0 : 2;
    return value < 1000
        ? '${value.toStringAsFixed(digits)} м'
        : '${(value / 1000).toStringAsFixed(digits)} км';
  }

  bool _isRound(num value) => value % 10 == 0;
}

class _DistanceRangeSlider extends StatelessWidget {
  const _DistanceRangeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FilterScreen. _DistanceRangeSlider. build');
    final debouncer = Debouncer(Duration(milliseconds: 10));
    final stateProvider = FilterScreenStateProvider.of(context);
    return RangeSlider(
      values: RangeValues(
        stateProvider.filter.minDistance,
        stateProvider.filter.maxDistance,
      ),
      min: SightFilter.minDistanceValue,
      max: SightFilter.maxDistanceValue,
      onChanged: (RangeValues values) {
        debouncer.debounce(() {
          stateProvider.onRangeUpdate(values.start, values.end);
        });
      },
      activeColor: accentColorGreen,
      inactiveColor: dividerColor,
    );
  }
}

class _CategoryFilterGrid extends StatelessWidget {
  const _CategoryFilterGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FilterScreen. _CategoryFilterGrid. build');
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _SightCategorySelectButton(SightCategory.hotel),
            const _SightCategorySelectButton(SightCategory.restaurant),
            const _SightCategorySelectButton(SightCategory.special),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _SightCategorySelectButton(SightCategory.park),
            const _SightCategorySelectButton(SightCategory.museum),
            const _SightCategorySelectButton(SightCategory.caffe),
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
    print('FilterScreen. _CategoryFiltersLabel. build');
    return Text(
      selectCategoryLabel.toUpperCase(),
      style: lmCaption.copyWith(color: lmTextColorInactiveBlack),
    );
  }
}

class _ClearFiltersButton extends StatelessWidget {
  const _ClearFiltersButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FilterScreen. _ClearFiltersButton. build');
    final state = FilterScreenStateProvider.of(context);
    final style = Theme.of(context).brightness == Brightness.dark
        ? dmAppBarActionButtonStyle
        : lmAppBarActionButtonStyle;
    return TextButton(
      style: style,
      child: Text(clearFiltersButtonText),
      onPressed: state.onResetFilter,
    );
  }
}

class _ShowSightsButton extends StatelessWidget {
  const _ShowSightsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FilterScreen. _ShowSightsButton. build');
    final stateProvider = FilterScreenStateProvider.of(context);
    final itemsCount = stateProvider.filteredSightsCount;
    final buttonText = '$shoeSightsButtonTextPrefix ($itemsCount)';
    return AccentActionButton(
      text: buttonText,
      onPressed: () =>
          Navigator.of(context).pop<SightFilter>(stateProvider.filter),
    );
  }
}

class _SightCategorySelectButton extends StatelessWidget {
  const _SightCategorySelectButton(
    this._category, {
    Key? key,
  }) : super(key: key);

  final SightCategory _category;

  @override
  Widget build(BuildContext context) {
    print('FilterScreen. _SightCategorySelectButton. build');
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onSelectCategory(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 92.0,
            height: 96.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _CategoryIcon(
                  category: _category,
                  isSelected: _isSelected(context),
                ),
                const SizedBox(height: 12.0),
                Expanded(
                  child: Text(
                    _category.description,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isSelected(BuildContext context) {
    return FilterScreenStateProvider.of(context)
        .filter
        .categories
        .contains(_category);
  }

  void _onSelectCategory(BuildContext context) {
    FilterScreenStateProvider.of(context).onSelectCategory(_category);
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({
    Key? key,
    required this.category,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;
  final SightCategory category;

  @override
  Widget build(BuildContext context) {
    final categoryIcon = category.icon;
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          alignment: Alignment.center,
          width: 64.0,
          height: 64.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: accentColorGreen.withOpacity(0.16),
          ),
          child: SizedBox(
            width: 30.0,
            height: 24.0,
            child: categoryIcon,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: isSelected
              ? Container(
                  width: 16.0,
                  height: 16.0,
                  padding: const EdgeInsets.all(3.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: SvgPicture.asset(
                    'res/icons/ic_selected.svg',
                    color: Colors.white,
                  ),
                )
              : SizedBox.shrink(),
        )
      ],
    );
  }
}
