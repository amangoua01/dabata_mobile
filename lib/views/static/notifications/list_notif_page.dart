import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:flutter/material.dart';

class ListNotifPage extends StatelessWidget {
  const ListNotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: const WrapperBodyListView(
        loading: false,
        children: [],
      ),
    );
  }
}
