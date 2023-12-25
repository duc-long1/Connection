import 'dart:io';

import 'package:connection/services/api_service.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user.dart';
import 'package:image/image.dart' as img;

class UserRepository {
  Future<User> getUserInfo() async {
    User user = User();
    final response = await ApiService().getUserInfo();
    if (response != null) {
      var json = response.data['data'];
      user = User.fromJson(json);
    }
    return user;
  }

  Future<bool> updateProfile() async {
    bool kq = false;
    var response = await ApiService().updateProfile();
    if (response != null) {
      kq = true;
    }
    return kq;
  }

  Future<void> uploadAvatar(XFile image) async {
    ApiService api = ApiService();
    if (image != null) {
      final img.Image orginalImage =
          img.decodeImage(File(image.path).readAsBytesSync())!;
      final img.Image resizeImage = img.copyResize(orginalImage, width: 300);
      final File resizeFile =
          File(image.path.replaceAll('.jpg', '_resized.jpg'))
            ..writeAsBytesSync(img.encodeJpg(resizeImage));
      await api.uploadAvatarToServer(File(resizeFile.path));
    }
  }
}
