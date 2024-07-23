import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  final bool? isFirstTimeLogin;
  final bool? isLoggedIn;
  final String? token;
  final User? user;

  const LoginResponse({
    this.isFirstTimeLogin,
    this.isLoggedIn,
    this.token,
    this.user,
  });

  @override
  List<Object?> get props => [isFirstTimeLogin, isLoggedIn, token, user];

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
