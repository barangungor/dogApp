import 'package:dogapp/services/os_version_getter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part '../components/setting_item.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  final divider = const Divider(
    height: 12,
    indent: 16,
    endIndent: 16,
    color: Color(0xFFE5E5EA),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5,
          width: 35,
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(color: const Color(0xFFE5E5EA), borderRadius: BorderRadius.circular(3)),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Column(
            children: [
              const SettingItem(leadingIcon: "info", title: "Help"),
              divider,
              const SettingItem(leadingIcon: "star", title: "Rate Us"),
              divider,
              const SettingItem(leadingIcon: "share", title: "Share with Friends"),
              divider,
              const SettingItem(leadingIcon: "termsOfUse", title: "Terms of Use"),
              divider,
              const SettingItem(leadingIcon: "shieldCheck", title: "Privacy Policy"),
              divider,
              SettingItem(leadingIcon: "osVersion", title: "OS Version", trailing: OSVersionGetter.instance.oSVersion),
            ],
          ),
        ),
      ],
    );
  }
}
