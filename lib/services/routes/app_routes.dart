import 'package:testui/screens/auth/otp_screen.dart';

import '../imports/app_imports.dart';

final Map<String, WidgetBuilder> appRoutes = {
  UserPassLoginScreen.routeName: (ctx) => const UserPassLoginScreen(),
  PhoneLoginScreen.routeName: (ctx) => const PhoneLoginScreen(),
  OtpScreen.routeName: (ctx) => const OtpScreen(),
};
