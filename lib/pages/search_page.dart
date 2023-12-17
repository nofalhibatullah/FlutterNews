import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/models/search_model.dart';
import 'package:flutternews/pages/article_view.dart';
import 'package:flutternews/services/search.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<SearchModel> results = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  getResults() async {
    setState(() {
      _loading = true;
    });

    SearchNews searchNews = SearchNews();
    await searchNews.getResults(_searchController.text.toLowerCase());
    results = searchNews.results;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            onSubmitted: (query) {
              getResults();
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                getResults();
              },
              icon: Icon(Icons.search),
            )
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ShowSearchResult(
                  image: results[index].urlToImage!,
                  desc: results[index].description!,
                  title: results[index].title!,
                  url: results[index].url!,
                );
              }),
        ));
  }
}

class ShowSearchResult extends StatelessWidget {
  String image, desc, title, url;

  ShowSearchResult(
      {required this.image,
      required this.desc,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                  imageUrl: image,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover),
            ),
            SizedBox(height: 5.0),
            Text(
              title,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(desc, maxLines: 3),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
