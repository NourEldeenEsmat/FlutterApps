import 'package:api/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/dio_helper.dart';

class MainCubit extends Cubit<States>{
  MainCubit() : super(InitState());

  static MainCubit get(context) => BlocProvider.of(context);

  double? goldb;
  int? goldi;

  double? Silverb;
  int? Selveri;

  getGoldPrice(){
    DioHelper.getData('XAU/EGP/').then((value) {

        goldb=value.data['price_gram_24k'];
        goldi=goldb!.round();
        print(goldi);
        emit(GetGoldPriceState());

    }).catchError((onError){
      print(onError.toString());
    });

  }
  getSilverPrice(){
    DioHelper.getData('XAG/EGP/').then((value) {

        Silverb=value.data['price_gram_24k'];
        Selveri=Silverb!.round();
        print(Selveri);
        emit(GetSliverPriceState());

  }).catchError((onError){
  print(onError.toString());
  });

  }

}