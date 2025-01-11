import 'package:ecommerce_application/common/widgets/bottom_nav.dart';
import 'package:ecommerce_application/constants/global_colors.dart';
import 'package:ecommerce_application/features/admin/screens/admin_screen.dart';
import 'package:ecommerce_application/features/auth/screens/auth_screen.dart';
import 'package:ecommerce_application/features/auth/services/auth_service.dart';
import 'package:ecommerce_application/providers/user_provider.dart';
import 'package:ecommerce_application/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Application Developed by Pravesh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalColors.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalColors.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type=='user' ? const BottomNav() : AdminScreen()
          : const AuthScreen(),
    );
  }
}
