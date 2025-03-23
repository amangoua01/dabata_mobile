import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserListSubPageVctl extends GetxController {
  List<User> users = [];

  List<User> _allUsers = [];

  bool isLoading = false;

  Future<void> fetchAllUsers() async {
    isLoading = true;
    update();
    var res = await UserApiCtl.getAllUser();
    if (res.status) {
      isLoading = false;
      _allUsers = res.data!;
      users = _allUsers;
    }
    update();
  }

  void onSearchUser(String value) {
    if (value.isEmpty) {
      users = [..._allUsers];
    } else {
      users = _allUsers
          .where((e) =>
              e.fullname.value.toLowerCase().contains(value.toLowerCase()) ||
              e.nom.value.toLowerCase().contains(value.toLowerCase()) ||
              e.prenom.value.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }

    update();
  }

  @override
  void onReady() {
    super.onReady();
    fetchAllUsers();
  }
}
