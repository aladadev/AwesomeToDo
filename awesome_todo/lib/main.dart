import 'package:awesome_todo/provider/provider_db.dart';
import 'package:awesome_todo/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DatabaseProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              background: const Color.fromARGB(237, 248, 242, 242),
              error: Colors.red,
              onTertiary: Colors.orange),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
