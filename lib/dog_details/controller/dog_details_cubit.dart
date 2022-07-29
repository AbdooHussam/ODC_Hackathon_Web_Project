import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'dog_details_state.dart';

class DogDetailsCubit extends Cubit<DogDetailsState> {
  DogDetailsCubit() : super(DogDetailsInitial());
  static DogDetailsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getDogDetails({String ?id}) async{
    try{
      Dio().get('https://petology.orangedigitalcenteregypt.com/pets/$id', ).then((value) {
        print(value.data);
      });
    } on DioError catch(dataError)
    {
     print(dataError);
    }
  }
}
