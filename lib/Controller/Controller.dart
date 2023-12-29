import 'package:flutter/foundation.dart';

import '../Model/UserModel.dart';
import '../Service/Service.dart';

class Controller extends ChangeNotifier {
  bool? isloading;
  List<UserModelData> users = [];

  Future<void> getData() async {
    try {
      final value = await Service.fetch();

      if (value != null) {
        users = value.data!.cast<UserModelData>();
        isloading = true;
      } else {
        isloading = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
      isloading = false;
    } finally {
      notifyListeners();
    }
  }
}
