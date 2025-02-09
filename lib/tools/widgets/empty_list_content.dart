import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/placeholder_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListContent extends StatelessWidget {
  final String emptyText;
  final String image;
  final double? width;
  final double? height;
  const EmptyListContent({
    this.emptyText = "Aucune donnée disponible",
    this.image = "assets/icons/empty.png",
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          PlaceHolderWidget(
            condition: image.contains(".json"),
            placeholder: Image.asset(image, width: width, height: height),
            child: Lottie.asset(
              image.value,
              width: width,
              height: height,
            ),
          ),
          ListTile(
            title: Text(
              emptyText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
