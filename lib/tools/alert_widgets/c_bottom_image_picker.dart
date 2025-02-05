// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:icofont_flutter/icofont_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lebedoo_assets_manager/utils/alert_widgets/c_bottom_sheet.dart';
// import 'package:lebedoo_assets_manager/utils/externals_components.dart';
// import 'package:lebedoo_assets_manager/utils/services/image_cropper_service.dart';
// import 'package:lebedoo_assets_manager/utils/services/image_picker_service.dart';

// abstract class CBottomImagePicker {
//   static Future<File?> show({
//     int? imageQuality,
//     bool cropImage = false,
//     CameraDevice preferredCameraDevice = CameraDevice.rear,
//   }) async {
//     return CBottomSheet.show(
//       height: 250,
//       child: ListView(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         children: [
//           ListTile(
//             leading: const Icon(IcoFontIcons.camera),
//             subtitle: const Text("Prendre une image avec l'appareil photo"),
//             title: const Text("Ouvrir l'appareil photo"),
//             onTap: () async {
//               var res = await ImagePickerService.pickImage(
//                 imageQuality: imageQuality,
//                 preferredCameraDevice: preferredCameraDevice,
//               );
//               if (res != null) {
//                 if (cropImage) {
//                   res = await ImageCropperService.crop(res);
//                 }
//                 Get.back(result: res);
//               }
//             },
//           ),
//           ListTile(
//             leading: const Icon(IcoFontIcons.image),
//             subtitle: const Text("Prendre une image dans la galerie"),
//             title: const Text("Ouvrir la galérie"),
//             onTap: () async {
//               var res = await ImagePickerService.pickImage(
//                 from: ImageSource.gallery,
//                 imageQuality: imageQuality,
//                 preferredCameraDevice: preferredCameraDevice,
//               );

//               if (res != null) {
//                 if (cropImage) {
//                   res = await ImageCropperService.crop(res);
//                 }
//                 Get.back(result: res);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
