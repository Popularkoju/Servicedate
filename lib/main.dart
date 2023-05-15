import 'package:flutter/material.dart';
import 'package:servicedate/UI/Screens/DateCalulator/DateCalculator.dart';
import 'package:provider/provider.dart';
import 'package:servicedate/UI/Screens/DateCalulator/DateCalculatorManager.dart';
import 'UI/Components/CustomTheme.dart';

void main() {
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => DateCalculatorManager())
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service Data',
      theme: CustomTheme().lightTheme,
      home: const DateCalculator(),
    );
  }
}



