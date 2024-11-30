import 'package:busca_preco/core/pages/dashboard/dashboard.dart';
import 'package:busca_preco/core/pages/reset_password/reset_password.dart';

import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../pages/register/register_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String resetPassword = '/reset-password';
  static const String dashboard = '/dashboard';

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: home,
      page: HomePage.new,
    ),
    GetPage(
      name: register,
      page: RegisterPage.new,
    ),
    GetPage(
      name: login,
      page: LoginPage.new,
    ),
    GetPage(
      name: resetPassword,
      page: ResetPassword.new,
    ),
    GetPage(
      name: dashboard,
      page: Dashboard.new,
    ),
  ];
}
