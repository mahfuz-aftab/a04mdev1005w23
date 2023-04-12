import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsFeedPage extends StatefulWidget {
  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

//The _NewsFeedPageState class is the state class for NewsFeedPage

//The _NewsFeedPageState class has a apiUrl variable which holds the API URL for fetching news articles.

//The _NewsFeedPageState class has a newsList variable which holds a list of news 

//The _NewsFeedPageState class has an isLoading variable which is used to track whether news articles are currently being loaded from the API

class _NewsFeedPageState extends State<NewsFeedPage> {
  final String apiUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=3b6fe86728144dc8a4c1d96c09f5e946';
  List<dynamic>? newsList = [];
  bool isLoading = false;

  Future<void> fetchNews() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final articles = jsonData['articles'];
      if (articles != null) {
        setState(() {
          newsList = articles;
          isLoading = false;
        });
      } else {
        setState(() {
          newsList = [];
          isLoading = false;
        });
      }
    } else {
      setState(() {
        newsList = [];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  //Each ListTile displays the title and description of a news article, and an onTap callback can be implemented to handle tapping on a news article item
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : newsList!.isEmpty
              ? const Center(child: Text('Failed to load news'))
              : ListView.builder(
                  itemCount: newsList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final news = newsList![index];
                    return ListTile(
                      title: Text(news['title'] ?? ''),
                      subtitle: Text(news['description'] ?? ''),
                      onTap: () {
                        // Do something when a news item is tapped
                      },
                    );
                  },
                ),
    );
  }
}