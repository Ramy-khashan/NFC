 
import '../../../Data_access_layer/api_connection.dart';

class LogainApi {
  login({required String username, required String password}) async {
    return await ApiConnection().post(
        "https://test.msyc-eg.com/auth-service/api/v1/dashboard/login",
        data: {
          "user_name": username,
          "password": password,
        });
  }
}
