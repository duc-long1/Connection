import '../services/api_service.dart';

class RegisterRepository {
  final ApiService api = ApiService();
  Future<int> register(String email, String username, String password) async {
    int kq = 2;
    final reponse = await api.registerUser(email, username, password);
    if (reponse != null && reponse.statusCode == 201) {
      if (reponse.data['require_email_confirmation'] == true) {
        kq = 3;
      } else {
        kq = 4;
      }
    }
    return kq;
  }
}
