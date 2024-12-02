import 'package:ts_4_8_1_eigene_app_ui/features/login/schema/user.dart';

class ServerUserResponse {
  final User? user;
  final bool success;
  final String? errorMessage;

  ServerUserResponse({this.user, required this.success, this.errorMessage});
}