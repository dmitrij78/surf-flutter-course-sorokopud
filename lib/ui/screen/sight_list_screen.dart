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
  final SightsFilter filter = SightsFilter.init();

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
            child: _SearchField(
              filter: filter,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(14.0),
          itemCount: widget.sights.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: SightCard(sight: widget.sights[index]),
            );
          },
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    Key? key,
    required this.filter,
  }) : super(key: key);

  final SightsFilter filter;

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
    final newFilter = await Navigator.of(context).push<SightsFilter>(
      MaterialPageRoute(
        builder: (context) {
          return FilterScreen(filter: filter.copyWith());
        },
      ),
    );

    if (newFilter != null && newFilter != filter) {}
  }
}
