import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/layout/states.dart';
import 'package:trips/models/data_model.dart';
import 'package:trips/modules/http_helper.dart';
class AppCubit extends Cubit<States>{
  AppCubit({required this.dataServices}) : super(InitialState()){
    emit(WelcomeState());
  }

  static AppCubit get(context)=>BlocProvider.of(context);

  final DataServices dataServices;
   late final places;
  void getData()async{
    try{
      emit(LoadingDataState());
      places= await dataServices.getData();
      //print(places);
      emit(LoadedDataState(places));
    }catch(e){
      print('gggggggggggggg${e.toString()}');
    }

  }

  void getDetails(DataModel data){
    emit(LoadedDetailsDataState(data));
  }
  void goHome(){
    emit(LoadedDataState(places));

  }

}