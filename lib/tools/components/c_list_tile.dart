import 'package:flutter/material.dart';

class CListTile extends StatelessWidget {
  final bool? dense;
  final Widget? title;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;
  final void Function()? onTap;

  const CListTile({
    super.key,
    this.title,
    this.dense,
    this.onTap,
    this.leading,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      title: title,
      leading: leading,
      subtitle: subtitle,
      trailing: trailing,
    );
  }
}
