import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/controllers/notification/list_notif_page_vtl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListNotifPage extends StatelessWidget {
  const ListNotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListNotifPageVtl>(
      init: ListNotifPageVtl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(title: const Text("Notifications")),
          body: WrapperBodyListView(
            loading: ctl.isLoading,
            children: ctl.notifs
                .map(
                  (e) => ListTile(
                    leading:
                        const CircleAvatar(child: Icon(Icons.notifications)),
                    title: Text(e.title.value),
                    subtitle: Row(
                      children: [
                        Expanded(child: Text(e.body.value)),
                        Text(e.createdAt.toFrenchDateTime)
                      ],
                    ),
                    onTap: () => CAlertDialog.show(
                      title: e.title.value,
                      message: e.body.value,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
