
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/modules/search/search_screen.dart';

Widget buildNewsItem({
  required news,
  required context
  })=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                image: NetworkImage(
                    '${news['urlToImage']}'),
                fit: BoxFit.cover)),
      ),
      const SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text(
                    '${news['title']}',
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text(
                  '${news['publishedAt']}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),

              ]),
        ),
      )
    ],
  ),
);

Widget buildDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

void navigateTo(BuildContext context,Widget widget)=>Navigator.push(context,
    MaterialPageRoute(builder:(context)=>widget
    ));