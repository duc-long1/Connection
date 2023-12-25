import 'package:connection/repositories/register_repository.dart';
import 'package:flutter/widgets.dart';

class RegisterViewModel with ChangeNotifier {
  int status =
      0; // 0-Chua ddky, 1-Dang dky, 2-dky loi, 3-dky can xm email, 4-dky va k xm email
  String errormessage = "";
  bool agree = false;
  final registerRepo = RegisterRepository();
  String quydinh =
      "Khi tham gia vào ứng dụng các bạn phải đồng ý các điều khoản quy định như sau:\n" +
          "1. Các thông tin của bạn sẽ được chia sẻ với các thành viên.\n " +
          "2. Thông tin của bạn có thể ảnh hưởng đến việc học tập ở trường.\n" +
          "3. Thông tn của bạn sẽ được xóa vĩnh viễn khi có yêu cầu xóa thông tin. ";
  void setAgree(bool value) {
    agree = value;
    notifyListeners();
  }

  Future<void> register(
      String email, String username, String pass1, String pass2) async {
    status = 1;
    notifyListeners();
    errormessage = "";
    if (agree == false) {
      status = 2;
      errormessage += "Bạn phải đồng ý điều khoản trước khi đăng ký!\n";
    }
    if (email.isEmpty || username.isEmpty || pass1.isEmpty) {
      status = 2;
      errormessage += "Email, Username, Password không được để trống. \n";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid == false) {
      status = 2;
      errormessage += "Email không hợp lệ";
    }

    if (pass1.length < 8) {
      status = 2;
      errormessage += "Password cần có từ 8 ký tự!\n";
    }
    if (pass1 != pass2) {
      status = 2;
      errormessage = "Mật khẩu không trùng nhau";
    }
    if (status != 2) {
      status = await registerRepo.register(email, username, pass1);
    }

    /// Su dung repository goi ham login va lay ket qua
    notifyListeners();
  }
}
