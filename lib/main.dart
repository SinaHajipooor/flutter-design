import 'services/imports/app_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: const Locale('fa', 'IR'),
      localizationsDelegates: appLocalizations,
      debugShowCheckedModeBanner: false,
      supportedLocales: appSupportedLocales,
      theme: ThemeData(
        fontFamily: 'YekanBakh',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: appRoutes,
      home: const WelcomeScreen(),
    );
  }
}
