import 'package:flutter/material.dart';
import 'package:new_year_greeting/new_yr_greeting.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Year Greetings',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      home: NewYrGreetings(),
    );
  }
}

