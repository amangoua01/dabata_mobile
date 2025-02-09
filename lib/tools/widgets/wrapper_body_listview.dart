import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/empty_list_content.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WrapperBodyListView extends StatelessWidget {
  final bool loading;
  final List<Widget> children;

  final Future<void> Function()? onRefresh;
  final String error;
  final Color primaryColor;
  final EdgeInsetsGeometry? listPadding;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final ScrollController? scrollController;
  final bool shrinkWrap;
  final bool primary;
  final ScrollPhysics? physics;
  const WrapperBodyListView({
    this.scrollController,
    required this.loading,
    this.primaryColor = AppColors.primary,
    this.onRefresh,
    required this.children,
    this.listPadding,
    this.error = "",
    this.errorWidget,
    this.emptyWidget,
    this.shrinkWrap = false,
    this.primary = false,
    this.physics = const AlwaysScrollableScrollPhysics(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return (error.isNotEmpty)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                errorWidget ?? const EmptyListContent(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    error,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: CButton(
                    color: primaryColor,
                    onPressed: onRefresh,
                    child: const Text("Recharger la page"),
                  ),
                ),
              ],
            ),
          )
        : (loading)
            ? SingleChildScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: ListTile(
                        leading: const CircleAvatar(),
                        title: Container(
                          color: Colors.grey,
                          height: 10,
                          width: double.infinity,
                        ),
                        subtitle: Container(
                          color: Colors.grey,
                          height: 10,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : (children.isEmpty)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        emptyWidget ?? const EmptyListContent(),
                        Visibility(
                          visible: onRefresh != null,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 200,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: primaryColor,
                                  ),
                                  onPressed: onRefresh,
                                  child: const Text(
                                    "Recharger la page",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : onRefresh != null
                    ? RefreshIndicator(
                        onRefresh: onRefresh!,
                        child: ListView.builder(
                          physics: physics,
                          shrinkWrap: shrinkWrap,
                          primary: primary,
                          itemCount: children.length,
                          controller: scrollController,
                          padding: listPadding,
                          itemBuilder: (context, index) => children[index],
                        ),
                      )
                    : ListView.builder(
                        physics: physics,
                        itemCount: children.length,
                        controller: scrollController,
                        padding: listPadding,
                        itemBuilder: (context, index) => children[index],
                      );
  }
}
