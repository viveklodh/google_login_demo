import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/login_view_model.dart';
import 'view_models/register_view_model.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginView(),
        routes: {
          '/register': (context) => RegisterView(),
          '/home': (context) => HomeView(),
        },
      ),
    );
  }
}
