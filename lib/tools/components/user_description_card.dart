import 'package:flutter/material.dart';

class UserDescriptionCard extends StatelessWidget {
  final bool? dense;
  final Widget? title;
  final Widget? trailing;
  final Widget? leading;
  final Widget? subtitle;
  final void Function()? onTap;

  const UserDescriptionCard({
    super.key,
    this.dense,
    this.title,
    this.onTap,
    this.leading,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        dense: true,
        title: title,
        onTap: onTap,
        leading: leading,
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }
}
