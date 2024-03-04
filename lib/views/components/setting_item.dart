part of '../screens/settings_screen.dart';

class SettingItem extends StatelessWidget {
  final String leadingIcon, title;
  final String? trailing;
  const SettingItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset("assets/icons/$leadingIcon.svg"),
      title: Text(title),
      trailing: trailing is String ? Text(trailing ?? "") : SvgPicture.asset("assets/icons/arrowUpRight.svg"),
    );
  }
}
