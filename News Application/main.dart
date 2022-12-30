import 'package:flutter/material.dart';
import 'package:mvvm_tutorial/screens/detail_screen.dart';
import 'package:mvvm_tutorial/screens/home_screen.dart';
import 'package:mvvm_tutorial/screens/viewallnews_screen.dart';
import 'package:mvvm_tutorial/viewmodel/newsArticalList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NewsAtricleList()
          )
      ],
      child: MaterialApp(
        title: 'Fresh News',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => HomeScreen(),
          NewsDetail.routeName:(context) => NewsDetail(),
          AllNewsScreen.routeName: (context) => AllNewsScreen()
        },
      ),
    );
  }
}

