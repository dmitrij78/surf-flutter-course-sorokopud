import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/main.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings/strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
    required this.appModel,
  }) : super(key: key);

  final AppModel appModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settingsScreenTitle),
      ),
      body: SafeArea(
        top: false,
        child: _BodyContent(
          appModel: appModel,
        ),
      ),
    );
  }
}

class _BodyContent extends StatefulWidget {
  const _BodyContent({
    Key? key,
    required this.appModel,
  }) : super(key: key);

  final AppModel appModel;

  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<_BodyContent> {
  late bool _switcherValue = widget.appModel.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 42.0),
          _LabeledRow(
            label: settingsSwitchThemeLabel,
            child: Align(
              alignment: Alignment.centerRight,
              child: CupertinoSwitch(
                value: _switcherValue,
                onChanged: (bool value) {
                  setState(() {
                    _switcherValue = value;
                    widget.appModel.setDarkMode(value);
                  });
                },
              ),
            ),
          ),
          const Divider(),
          _LabeledRow(
            label: settingsScreenShowTutorialLabel,
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.info_outline,
                color: lmIconColorAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LabeledRow extends StatelessWidget {
  const _LabeledRow({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 48.0),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
