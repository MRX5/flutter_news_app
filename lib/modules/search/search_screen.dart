import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/cubit.dart';
import 'package:flutter_news_app/layout/states.dart';
import 'package:flutter_news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        builder: (context, state){
          var cubit=NewsCubit.get(context);
          return Scaffold(
          appBar: AppBar(
            title: Text(
                'Search'
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  decoration:  const InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search)
                  ),
                  validator: (String? query){
                    if(query!=null && query.isEmpty){
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  onChanged: (query){
                    cubit.searchForNews(query: query);
                  },
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => buildNewsItem(news: cubit.searchResults[index], context: context),
                      separatorBuilder: (context,index)=>buildDivider(),
                      itemCount:cubit.searchResults.length
                  ),
                ),
              ],
            ),
          ),
        );},
        listener: (context,state){
            if(state is SearchForNewsErrorState){
              print(state.error);
            }
        },
      ),
    );
  }
}
