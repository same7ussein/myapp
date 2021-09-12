import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/new_app/cubit/states.dart';
import 'package:untitled/modules/business/business_screen.dart';
import 'package:untitled/modules/science/science_screen.dart';
import 'package:untitled/modules/settings_screen/Settings_screen.dart';
import 'package:untitled/modules/sports/sports_screen.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
class NewsCubit extends Cubit<NewStates> {
  NewsCubit() : super(NewInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int CurrentIndex=0;
  List<BottomNavigationBarItem> BottomItems=[
    BottomNavigationBarItem(icon: Icon(Icons.business,),
    label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports,),
        label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science,),
        label: 'Science'),

  ];
  List<Widget> Sceens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changeBottomNavBar(int index)
  {
    CurrentIndex=index;
    if(index==1)
      getSports();
    else if(index==2)
      getScience();
    emit(NewBottomNavState());
  }
  List<dynamic> business=[];

  void getBusiness(){
    emit(NewGetBusinessLoadingState());

    DioHelper.GetData(url: 'v2/top-headlines',
      query:{
        'country': 'eg',
        'category': 'business',
        'apikey': '4974fc8a585143c2a18c4976f8175050',
      },

    ).then((value) {
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewGetBusinessSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> Sports=[];

  void getSports(){
    emit(NewGetBusinessLoadingState());
    if(Sports.length==0)
      {
        DioHelper.GetData(url: 'v2/top-headlines',
          query:{
            'country': 'eg',
            'category': 'Sports',
            'apikey': '4974fc8a585143c2a18c4976f8175050',
          },

        ).then((value) {
          Sports=value.data['articles'];
          print(Sports[0]['title']);
          emit(NewGetSportsSuccessState());

        }).catchError((error){
          print(error.toString());
          emit(NewGetSportsErrorState(error.toString()));
        });
      }
    else{
      emit(NewGetSportsSuccessState());
    }

  }

  List<dynamic> Science=[];

  void getScience(){
    emit(NewGetScienceLoadingState());
    if(Science.length==0)
      {
        DioHelper.GetData(url: 'v2/top-headlines',
          query:{
            'country': 'eg',
            'category': 'Science',
            'apikey': '4974fc8a585143c2a18c4976f8175050',
          },

        ).then((value) {
          Science=value.data['articles'];
          print(Science[0]['title']);
          emit(NewGetScienceSuccessState());

        }).catchError((error){
          print(error.toString());
          emit(NewGetScienceErrorState(error.toString()));
        });
      }
    else
      {
        emit(NewGetScienceSuccessState());
      }
  }
  bool isDark=false;
  void changeAppMode({ bool ? formShared}){
    if(formShared !=null)
      {
        isDark=formShared;
        emit(NewChangeModeState());
      }
    else
      {
    isDark= !isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
    {
      emit(NewChangeModeState());
    }
    );
      }
  }
}


