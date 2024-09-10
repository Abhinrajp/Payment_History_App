import 'package:flutter/material.dart';
import 'package:payment_details_fetch/View/homescreen.dart';
import 'package:payment_details_fetch/Viewmodel/user_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<UserStore>(create: (_) => UserStore()..fetchUsers())
        ],
        child: MaterialApp(
            title: 'User Payment App',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const UserPaymentScreen(),
            debugShowCheckedModeBanner: false));
  }
}
