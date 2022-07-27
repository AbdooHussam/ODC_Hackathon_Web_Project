import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Home/Model/all_pets_model.dart';
import '../service/service_filter.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  static FilterCubit get(context) => BlocProvider.of(context);

  List<AllPetsModel> allPetsCategoryFilterList = [];

  Future<void> getAllPetsFilter({required int categoryId}) async {
    try {
      var products = await RemoteServicesFilter.getAllPetsFilterCategory(
          categoryId: categoryId);
      if (products != null) {
        allPetsCategoryFilterList = products;
        for (int i = 0; i < allPetsCategoryFilterList.length; i++) {
          for (int x = 0; x < allPetsCategoryFilterList[i].image!.length; x++) {
            allPetsCategoryFilterList[i].image![x] =
                allPetsCategoryFilterList[i]
                    .image![x]
                    .replaceAll("data:image/png;base64,", "");
          }
        }
      }
    } finally {
      emit(SuccessFilterCategory());
    }
  }
}
