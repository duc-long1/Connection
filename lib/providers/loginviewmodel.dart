import 'package:connection/models/student.dart';
import 'package:connection/models/user.dart';
import 'package:connection/repositories/login_repository.dart';
import 'package:connection/repositories/student_repository.dart';
import 'package:connection/repositories/user_repository.dart';
import 'package:flutter/widgets.dart';

class LoginViewModel with ChangeNotifier {
  String errorMessage = "";
  int status = 0; //0- notlogin, 1-waiting, 2-error, 3-already logged
  LoginRepository loginRepo = LoginRepository();
  Future<void> login(String username, String password) async {
    status = 1;
    notifyListeners();
    try {
      var profile = await loginRepo.login(username, password);
      if (profile.token == "") {
        status = 2;
        errorMessage = "Tài khoản hoặc mật khẩu sai!";
      } else {
        //dang nhap thanh cong, lay thong tin user student
        var student = await StudentRepository().getStudentInfo();
        profile.student = Student.fromStudent(student);
        var user = await UserRepository().getUserInfo();
        profile.user = User.fromUser(user);
        status = 3;
      }
      notifyListeners();
    } catch (e) {}
  }
}
