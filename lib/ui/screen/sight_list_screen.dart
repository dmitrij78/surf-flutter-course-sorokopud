import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/domain.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/filter_screen.dart';
import 'package:places/ui/widgets/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key, required this.sights}) : super(key: key);

  final List<Sight> sights;

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  late SightFilter filter;

  @override
  void initState() {
    filter = SightFilter.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SightListSateController(
      filter: filter,
      sights: widget.sights,
      filterUpdater: (SightFilter flter) => _updateFilter(filter),
      child: const _SightsListScreen(),
    );
  }

  void _updateFilter(SightFilter filter) {
    setState(() => this.filter = filter);
  }
}

class SightListSateController extends InheritedWidget {
  const SightListSateController({
    Key? key,
    required this.filter,
    required this.filterUpdater,
    required List<Sight> sights,
    required Widget child,
  })  : this._sights = sights,
        super(key: key, child: child);

  final List<Sight> _sights;

  final SightFilter filter;
  final Function(SightFilter filter) filterUpdater;

  List<Sight> get sights => _sights.where((sight) => true).toList();

  static SightListSateController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SightListSateController>()!;
  }

  @override
  bool updateShouldNotify(covariant SightListSateController oldWidget) {
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
    final stateController = SightListSateController.of(context);
    final sights = stateController.sights;
    return ListView.builder(
      padding: EdgeInsets.all(14.0),
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
      style: isDark ? dmSearchField : lmSearchField,
      autofocus: false,
      maxLines: 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? dmCardBackground : lmCardBackground,
        prefixIcon: SizedBox(
          height: 12,
          width: 12,
          child: IconButton(
            onPressed: () => {},
            icon: SvgPicture.asset(
              'res/icons/ic_search.svg',
            ),
          ),
        ),
        suffixIcon: SizedBox(
          height: 12,
          width: 12,
          child: IconButton(
            onPressed: () => _showFilterScreen(context),
            icon: SvgPicture.asset(
              'res/icons/ic_filter.svg',
            ),
          ),
        ),
        hintText: searchFieldHintText,
        hintStyle: dmSearchField.copyWith(color: dmTextColorInactiveBlack),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  void _showFilterScreen(BuildContext context) async {
    final stateController = SightListSateController.of(context);
    final currentFilter = stateController.filter;
    final filterScreen = FilterScreen(filter: currentFilter.copyWith());
    final newFilter = await Navigator.of(context).push<SightFilter>(
          MaterialPageRoute(builder: (context) => filterScreen),
        ) ??
        currentFilter;

    if (newFilter != currentFilter) {
      stateController.filterUpdater(newFilter);
    }
  }
}
