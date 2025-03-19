import 'package:flutter_easyloading/flutter_easyloading.dart';

extension FutureExt<T> on Future<T> {
  Future<T> load({String? status}) async {
    await EasyLoading.show(maskType: EasyLoadingMaskType.black, status: status);
    var res = await this;
    await EasyLoading.dismiss();
    return res;
  }
}
