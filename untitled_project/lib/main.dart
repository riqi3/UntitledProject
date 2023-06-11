import 'package:flutter/material.dart';
 
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'LoginScreen.dart';
import 'TestProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TestProvider(),
          child: const UntitledApp(),
        ),
      ],
      child: const UntitledApp(),
    ),
  );
}

class UntitledApp extends StatelessWidget {
  const UntitledApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UNTITLED APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
