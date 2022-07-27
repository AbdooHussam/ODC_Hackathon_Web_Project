import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Authentication/model/adaption_model.dart';

part 'adaption_state.dart';

class AdaptionCubit extends Cubit<AdaptionState> {
  AdaptionCubit() : super(AdaptionInitial());
  String? title;
  String? body;

  static AdaptionCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getFeedData() async {
    Dio().get('https://petology.orangedigitalcenteregypt.com/static/how-to/1').then((value) {
      title = value.data['title'];
      body = value.data['body'];
      emit(AdaptionSuccess());
    }).catchError((e) {
      print(e);
    });
  }
}
