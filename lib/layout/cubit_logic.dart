import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/layout/layout.dart';
import 'package:trips/layout/states.dart';
import 'package:trips/modules/details_page.dart';
import 'package:trips/modules/on_boarding.dart';
import 'cubit.dart';

class CubitLogics extends StatefulWidget {
  const CubitLogics({Key? key}) : super(key: key);

  @override
  _CubitLogicsState createState() => _CubitLogicsState();
}

class _CubitLogicsState extends State<CubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit,States>(
        builder: (context,state){
          if(state is WelcomeState)
            {
              return const OnBoardingScreen();
            }if(state is LoadingDataState){
            return const Center(child: CircularProgressIndicator());
          }if(state is LoadedDataState){
            return const Layout();
          }if(state is LoadedDetailsDataState){
            return const DetailsPage();
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
