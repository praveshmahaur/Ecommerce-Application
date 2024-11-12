import 'package:ecommerce_application/constants/global_colors.dart';
import 'package:ecommerce_application/features/auth/screens/auth_screen.dart';
import 'package:ecommerce_application/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Ecommerce App"),
          centerTitle: true,),
        body: Column(
          children: [
            Center(
              child: Text("Project"),
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, AuthScreen.routeName);
                },
                 child: Text("Click",style: TextStyle(color: Colors.black,)),);
              }
            )
          ],
        ),
      ),
    );
  }
}

