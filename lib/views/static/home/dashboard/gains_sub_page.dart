import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/gains_sub_page_vct.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class GainsSubPage extends StatelessWidget {
  const GainsSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GainsSubPageVctl>(
      init: GainsSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Gain total"),
            automaticallyImplyLeading: false,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*  Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, bottom: 20),
                child: Text(
                  "Mes articles",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), */
              Expanded(
                child: WrapperBodyListView(
                  loading: ctl.isLoading,
                  children: ctl.gainsCumules
                      .map(
                        (e) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColors.primary,
                            child: Image.asset("assets/icons/cadeau.png"),
                          ),
                          title: Text("${e.libelle}"),
                          trailing: CircleAvatar(
                            radius: 17,
                            backgroundColor: AppColors.primary,
                            child: Text("${e.quantiteCumul}"),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
