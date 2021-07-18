import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'api_manager.dart';
import 'news_info.dart';
import 'package:weather_assignment/constants.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<Welcome> _newsModel;

  @override
  void initState() {
    _newsModel = ApiManager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Welcome>(
      future: _newsModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data.articles[index];
                var formattedTime =
                    DateFormat('dd MMM - HH:mm').format(article.publishedAt);
                return Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 7, right: 5),
                  child: Container(
                    decoration: kNewsBoxDecoration,
                    width: double.infinity,
                    height: 150,
                    margin: const EdgeInsets.all(8),
                    child: Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                article.title,
                                overflow: TextOverflow.values[2],
                                style: kNewsTitleDeco,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (article.description != null)
                              Text(
                                article.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: kNewsSummaryDeco,
                              ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              formattedTime,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
