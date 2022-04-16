import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit.dart';
import '../../layout/states.dart';
import '../../shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          if(state is GetSportsNewsLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildNewsItem(news:cubit.sportsNews[index],context: context),
                separatorBuilder: (context,index)=>buildDivider(),
                itemCount: cubit.sportsNews.length
            );
          }
        },
        listener: (context, state) {});
  }
}
