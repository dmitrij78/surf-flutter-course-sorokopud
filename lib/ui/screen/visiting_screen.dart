import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/res/text_styles.dart';

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
        elevation: 0,
        backgroundColor: appBarColor,
        title: Text(
          visitingScreenAppbarTitle,
          style: textMeduim18Secondary,
        ),
        bottom: TabNavigationPanel(
          tabs: tabs,
          tabController: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(child: Center(child: Text('Посетил'))),
          Container(child: Center(child: Text('Хочу посетить'))),
        ],
      ),
    );
  }
}

class TabNavigationPanel extends StatelessWidget
    implements PreferredSizeWidget {
  final TabController tabController;
  final List<String> tabs;

  const TabNavigationPanel(
      {Key key, @required this.tabController, @required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
          color: panelBackground,
          borderRadius: BorderRadius.circular(40),
        ),
        child: SizedBox(
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

  const TabIndicator({Key key, this.text, this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 164,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(text, style: _getTextStyle()),
      ),
      onTap: this.onTap == null ? null : onTap,
    );
  }

  TextStyle _getTextStyle() =>
      isSelected ? textBold14Inverse : textBold14InactiveBlack;

  Color _getBackgroundColor() =>
      isSelected ? activeBackground : invisibleBackground;
}
