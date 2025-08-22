import 'package:conexion_a_api_provider/provider/character_provider.dart';
import 'package:conexion_a_api_provider/screens/screen_search_dragon_ball.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()  {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CharacterProvider(),
      child: const MyApp(),
       )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ScreenSearchDragonBall()
    );
  }
}
