import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/shared/cubit/states.dart';

import '../local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(BuildContext context)=>BlocProvider.of(context);

  bool isDarkMode=false;

  void changeThemeMode(){
    isDarkMode=!isDarkMode;
    CacheHelper.setThemeMode(isDark:isDarkMode)
        .then((value){
            emit(AppThemeChangedState());
        });
  }

  void getThemeMode(){
    isDarkMode=CacheHelper.getThemeMode();
    emit(AppGetThemeModeState());
  }
}