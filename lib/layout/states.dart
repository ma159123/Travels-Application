import 'package:equatable/equatable.dart';
import 'package:trips/models/data_model.dart';

abstract class States extends Equatable{}
class InitialState extends States{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class WelcomeState extends States{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class LoadingDataState extends States{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class LoadedDataState extends States{
  LoadedDataState(this.places);
  final List<DataModel>places;


  @override
  // TODO: implement props
  List<Object?> get props => [places];//مسؤؤلة عن بناء ال ui
}

class LoadedDetailsDataState extends States{
  LoadedDetailsDataState(this.place);
  final DataModel place;


  @override
  // TODO: implement props
  List<Object?> get props => [place];//مسؤؤلة عن بناء ال ui
}


