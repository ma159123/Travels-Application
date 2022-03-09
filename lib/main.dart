import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/layout/cubit.dart';
import 'package:trips/modules/http_helper.dart';
import 'layout/cubit_logic.dart';
import 'modules/details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (BuildContext context)=>AppCubit(dataServices: DataServices()),
      child: const CubitLogics(),
      ),
    );
  }
}



