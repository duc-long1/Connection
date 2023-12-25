import 'package:connection/services/api_service.dart';

class ForgotRepository {
  final ApiService api = ApiService();
  Future<bool> forgotPassword(String email) async {
    final reponse = await api.forgotPassword(email);
    if (reponse! == null) {
      return true;
    } else {
      return false;
    }
  }
}
