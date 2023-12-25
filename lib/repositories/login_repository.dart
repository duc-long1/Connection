import 'package:connection/models/profile.dart';
import 'package:connection/services/api_service.dart';

class LoginRepository {
  final ApiService api = ApiService();
  Future<Profile> login(String username, String password) async {
    Profile profile = Profile();
    final reponse = await api.loginUser(username, password);
    if (reponse != null && reponse.statusCode == 200) {
      profile.token = reponse.data['token'];
      profile.setUsernamePassword(username, password);
    } else {
      profile.token = "";
    }
    return profile;
  }
}
