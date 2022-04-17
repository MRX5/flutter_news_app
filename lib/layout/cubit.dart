import 'dart:core';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/states.dart';
import 'package:flutter_news_app/modules/science/science_screen.dart';
import 'package:flutter_news_app/modules/settings/SettingsScreen.dart';
import 'package:flutter_news_app/modules/sports/sports_screen.dart';
import '../modules/business/business_screen.dart';
import '../shared/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
  List<BottomNavigationBarItem> bottomNavItems=[
      BottomNavigationBarItem(
        icon:Icon(Icons.business),
      label: 'Business'
    ),
      BottomNavigationBarItem(
        icon:Icon(Icons.science),
      label: 'Science'
    ),
      BottomNavigationBarItem(
        icon:Icon(Icons.sports),
      label: 'Sports'
    ),
      BottomNavigationBarItem(
        icon:Icon(Icons.settings),
      label: 'Settings'
    ),
  ];

  List<Widget>screens=[
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingsScreen()
  ];

  List<dynamic> businessNews=[];
  List<dynamic> scienceNews=[];
  List<dynamic> sportsNews=[];
  List<dynamic> searchResults=[];

  void getBusinessNews(){
    emit(GetBusinessNewsLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'63b1f94dad044add871d1e319c630265',
        }
    ).then((value){
      businessNews=value.data['articles'];
      emit(GetBusinessNewsSuccessState());
    }).catchError((e){
      emit(GetBusinessNewsErrorState(e.toString()));
    });
  }

  void getScienceNews(){
    if(scienceNews.isNotEmpty)return;

    emit(GetScienceNewsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'63b1f94dad044add871d1e319c630265',
        }
    ).then((value){
      scienceNews=value.data['articles'];
      emit(GetScienceNewsSuccessState());
    }).catchError((e){
      emit(GetScienceNewsErrorState(e.toString()));
    });
  }

  void getSportsNews(){
    if(sportsNews.isNotEmpty)return ;

    emit(GetSportsNewsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'63b1f94dad044add871d1e319c630265',
        }
    ).then((value){
      sportsNews=value.data['articles'];
      emit(GetSportsNewsSuccessState());
    }).catchError((e){
      emit(GetSportsNewsErrorState(e.toString()));
    });
  }
  
  void searchForNews({required String query}){
    emit(SearchForNewsLoadingState());

    DioHelper.searchForNews(
        query:{
            'q':query,
            'apiKey':'63b1f94dad044add871d1e319c630265',
        }).then((value){
          emit(SearchForNewsSuccessState());
          searchResults=value.data['articles'];
    }).catchError((error){
      emit(SearchForNewsErrorState(error.toString()));
    });
  }
  
  void changeBottomNavIndex(int index){
    currentIndex=index;
    if(index==1){
      getScienceNews();
    }else if(index==2){
      getSportsNews();
    }
    emit(NewsBottomNavState());
  }
}