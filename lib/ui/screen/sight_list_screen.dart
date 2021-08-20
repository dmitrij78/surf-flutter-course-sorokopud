import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/domain.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/filter_screen.dart';
import 'package:places/ui/widgets/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({
    Key? key,
    required this.sights,
    required this.currentGeoPoint,
  }) : super(key: key);

  final List<Sight> sights;
  final GeoPoint currentGeoPoint;

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  SightFilter _filter = SightFilter.init();

  @override
  Widget build(BuildContext context) {
    return SightListSateProvider(
      filter: _filter,
      sights: widget.sights,
      currentGeoPoint: widget.currentGeoPoint,
      filterUpdater: (SightFilter newFilter) => setState(() {
        _filter = newFilter;
      }),
      child: const _SightsListScreen(),
    );
  }
}

class SightListSateProvider extends InheritedWidget {
  const SightListSateProvider({
    Key? key,
    required this.filter,
    required this.filterUpdater,
    required GeoPoint currentGeoPoint,
    required List<Sight> sights,
    required Widget child,
  })  : this._sights = sights,
        this._currentGeoPoint = currentGeoPoint,
        super(key: key, child: child);

  final GeoPoint _currentGeoPoint;
  final List<Sight> _sights;

  final SightFilter filter;
  final Function(SightFilter filter) filterUpdater;

  List<Sight> get sights =>
      _sights.where(_isInRadius).where(_filterByCategory).toList();

  bool _isInRadius(sight) => _currentGeoPoint.isInRadius(
        sight.geoPoint,
        filter.maxDistance,
        filter.minDistance,
      );

  bool _filterByCategory(sight) => filter.categories.contains(sight.category);

  static SightListSateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SightListSateProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant SightListSateProvider oldWidget) {
    return filter != oldWidget.filter;
  }
}

class _SightsListScreen extends StatelessWidget {
  const _SightsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        title: Text(
          appBarTitleText,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52.0),
          child: Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            height: 52.0,
            child: const _SearchField(),
          ),
        ),
      ),
      body: SafeArea(child: _SightsListView()),
    );
  }
}

class _SightsListView extends StatelessWidget {
  const _SightsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateProvider = SightListSateProvider.of(context);
    final sights = stateProvider.sights;
    return ListView.builder(
      padding: const EdgeInsets.all(14.0),
      itemCount: sights.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: SightCard(sight: sights[index]),
        );
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      keyboardType: TextInputType.text,
      cursorColor: isDark ? dmTextColorPrimary : lmTextColorPrimary,
      style: isDark ? dmLabelNormal : lmLabelNormal,
      autofocus: false,
      maxLines: 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? dmCardBackground : lmCardBackground,
        prefixIcon: SizedBox(
          height: 12.0,
          width: 12.0,
          child: IconButton(
            onPressed: () => {},
            icon: SvgPicture.asset(
              'res/icons/ic_search.svg',
              
            ),
          ),
        ),
        suffixIcon: SizedBox(
          height: 12.0,
          width: 12.0,
          child: IconButton(
            onPressed: () => _showFilterScreen(context),
            icon: SvgPicture.asset(
              'res/icons/ic_filter.svg',
            ),
          ),
        ),
        hintText: searchFieldHintText,
        hintStyle: dmLabelNormal.copyWith(color: dmTextColorInactiveBlack),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  void _showFilterScreen(BuildContext context) async {
    final stateProvider = SightListSateProvider.of(context);
    final currentFilter = stateProvider.filter;
    final filterScreen = FilterScreen(
      filter: currentFilter.copyWith(),
      sights: mockSights,
      currentGeoPoint: mockGeoPoint,
    );
    final newFilter = await Navigator.of(context).push<SightFilter>(
          MaterialPageRoute(builder: (context) => filterScreen),
        ) ??
        currentFilter;
    if (newFilter != currentFilter) {
      stateProvider.filterUpdater(newFilter);
    }
  }
}
