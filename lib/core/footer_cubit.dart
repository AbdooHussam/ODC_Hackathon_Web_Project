import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../Home/Model/footer_section_model.dart';
import '../Home/service/service_home1.dart';

part 'footer_state.dart';

class FooterCubit extends Cubit<FooterState> {
  FooterCubit() : super(FooterInitial());
  static FooterCubit get(context) => BlocProvider.of(context);

  FooterSectionModel footerSection = FooterSectionModel(location: "",email: "",location2: "",phone: "");

  Future<void> getFooterSection() async {
    try {
      var products = await RemoteServicesHome.fetchFooterSection();
      if (products != null) {
        footerSection = products;
      }
    } finally {
      emit(SuccessFooterSection());
    }
  }
}
