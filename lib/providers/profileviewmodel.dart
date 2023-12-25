import 'package:connection/models/profile.dart';
import 'package:connection/models/user.dart';
import 'package:connection/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel with ChangeNotifier {
  int status = 0;
  int modified = 0;
  int updateavatar = 0;
  void updatescreen() {
    status = 0;
    notifyListeners();
  }

  void setUpdateavatar() {
    updateavatar = 1;
    notifyListeners();
  }

  Future<void> uploadAvatar(XFile image) async {
    status = 1;
    notifyListeners();
    await UserRepository().uploadAvatar(image);
    var user = await UserRepository().getUserInfo();
    Profile().user = User.fromUser(user);
    updateavatar = 0;
    status = 0;
    notifyListeners();
  }

  void displayplayspiner() {
    status = 1;
    notifyListeners();
  }

  void setModified() {
    if (modified == 0) {
      modified = 1;
      notifyListeners();
    }
  }

  void hidespiner() {
    status = 0;
    notifyListeners();
  }

  Future<void> updateProfile() async {
    status = 1;
    notifyListeners();
    await UserRepository().updateProfile();
    status = 0;
    modified = 0;
    notifyListeners();
  }
}
