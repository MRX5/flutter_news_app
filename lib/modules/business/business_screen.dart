import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/cubit.dart';
import 'package:flutter_news_app/layout/states.dart';
import 'package:flutter_news_app/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          if(state is GetBusinessNewsLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
          else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildNewsItem(news:cubit.businessNews[index],context: context),
                separatorBuilder: (context,index)=>buildDivider(),
                itemCount: cubit.businessNews.length
            );
          }
        },
        listener: (context, state) {});
  }
}
