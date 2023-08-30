import '../imports/app_imports.dart';

final Map<String, WidgetBuilder> appRoutes = {
  UserPassLoginScreen.routeName: (ctx) => const UserPassLoginScreen(),
  PhoneLoginScreen.routeName: (ctx) => const PhoneLoginScreen(),
};
