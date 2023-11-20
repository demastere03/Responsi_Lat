import 'package:prak_latihan/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:prak_latihan/api_source/api_source_1.dart';
import '../detail_page/detail_page_news.dart';

class PageNews extends StatefulWidget {
  const PageNews({Key? key}) : super(key: key);

  @override
  State<PageNews> createState() => _PageNewsState();
}

class _PageNewsState extends State<PageNews> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Space Flight News"),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource1.instance.loadUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            NewsModel newsModel = NewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(newsModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(NewsModel results) {
    return ListView.builder(
      itemCount: results.results!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(results.results![index]);
      },
    );
  }

  Widget _buildItemUsers(Results News) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetail(idNews: News.id!,))
      ),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(News.imageUrl!),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(News.title!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
