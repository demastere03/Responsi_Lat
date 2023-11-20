import 'package:prak_latihan/detail_page/detail_page_blog.dart';
import 'package:prak_latihan/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:prak_latihan/api_source/api_source_2.dart';

class PageBlog extends StatefulWidget {
  const PageBlog({Key? key}) : super(key: key);

  @override
  State<PageBlog> createState() => _PageBlogState();
}

class _PageBlogState extends State<PageBlog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Space Flight Blog"),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource2.instance.loadUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            BlogModel blogModel = BlogModel.fromJson(snapshot.data);
            return _buildSuccessSection(blogModel);
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

  Widget _buildSuccessSection(BlogModel results) {
    return ListView.builder(
      itemCount: results.results!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(results.results![index]);
      },
    );
  }

  Widget _buildItemUsers(Results Blog) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlogDetail(idBlog: Blog.id!,))
      ),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(Blog.imageUrl!),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Blog.title!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
