import 'package:favin/home_screen.dart';
import 'package:favin/main_screen.dart';
import 'package:favin/model/bloc/product_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  String name = "omid";
  runApp(BlocProvider<ProductBloc>(
    create: (context) => ProductBloc(),
    child: Application(),
  ));
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
