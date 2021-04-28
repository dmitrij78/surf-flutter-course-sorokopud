import 'package:flutter/material.dart';
import 'package:places/domain/domain.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/widgets/visited_sight_card.dart';
import 'package:places/ui/widgets/wish_visit_sight_card.dart';

class VisitingScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<VisitingScreen> with TickerProviderStateMixin {
  static const tabs = <String>[wishVistTabTitle, alreadyVisitedTabTitle];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          visitingScreenAppbarTitle,
        ),
        bottom: TabNavigationPanel(
          tabs: tabs,
          tabController: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _WishVistSightList(wishVisitSights: mockWishVisitSights),
          _VisitedSightList(vistedSights: mockVisitedSights),
        ],
      ),
    );
  }
}

class _WishVistSightList extends StatelessWidget {
  final List<WishVisitSight> wishVisitSights;

  const _WishVistSightList({
    Key key,
    this.wishVisitSights,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            WishVistSightCard(sight: wishVisitSights[0]),
            const SizedBox(height: 16),
            WishVistSightCard(sight: wishVisitSights[1]),
          ],
        ),
      ),
    );
  }
}

class _VisitedSightList extends StatelessWidget {
  final List<VisitedSight> vistedSights;

  const _VisitedSightList({Key key, this.vistedSights}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            VistedSightCard(sight: vistedSights[0]),
            const SizedBox(height: 16),
            VistedSightCard(sight: vistedSights[1]),
          ],
        ),
      ),
    );
  }
}

class TabNavigationPanel extends StatelessWidget
    implements PreferredSizeWidget {
  final TabController tabController;
  final List<String> tabs;

  const TabNavigationPanel({
    Key key,
    @required this.tabController,
    @required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabIndicator(
              text: tabs[0],
              isSelected: tabController.index == 0,
              onTap: () => tabController.animateTo(0),
            ),
            TabIndicator(
              text: tabs[1],
              isSelected: tabController.index == 1,
              onTap: () => tabController.animateTo(1),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52);
}

class TabIndicator extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  const TabIndicator({
    Key key,
    this.text,
    this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 164,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _getBackgroundColor(context),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(text, style: _getTextStyle(context)),
      ),
      onTap: this.onTap == null ? null : onTap,
    );
  }

  TextStyle _getTextStyle(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? _getDarkTextStyle(context)
          : _getLightTextStyle(context);

  Color _getBackgroundColor(BuildContext context) =>
      isSelected ? Theme.of(context).accentColor : Colors.transparent;

  TextStyle _getDarkTextStyle(BuildContext context) {
    return isSelected
        ? Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: lmTextColorPrimary)
        : Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: dmTextColorInactiveBlack);
  }

  TextStyle _getLightTextStyle(BuildContext context) {
    return isSelected
        ? Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: dmTextColorPrimary)
        : Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: lmTextColorInactiveBlack);
  }
}
