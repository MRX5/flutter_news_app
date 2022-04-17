import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/cubit.dart';
import 'package:flutter_news_app/layout/states.dart';
import 'package:flutter_news_app/modules/search/search_screen.dart';
import 'package:flutter_news_app/shared/components/components.dart';
import 'package:flutter_news_app/shared/cubit/cubit.dart';
import 'package:flutter_news_app/shared/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusinessNews(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state){
        },
        builder: (context,state){
          var cubit=NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'News App'
              ),
              actions: [
                IconButton(
                    onPressed: (){
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(
                        Icons.search,
                    ),
                ),
                IconButton(
                    onPressed: (){
                      AppCubit.get(context).changeThemeMode();
                    },
                    icon: Icon(
                        Icons.brightness_4,
                    ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items:cubit.bottomNavItems,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                  cubit.changeBottomNavIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
