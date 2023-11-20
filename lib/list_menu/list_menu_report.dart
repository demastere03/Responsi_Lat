import 'package:prak_latihan/api_source/api_soure_3.dart';
import 'package:prak_latihan/detail_page/detail_page_report.dart';
import 'package:prak_latihan/models/report_model.dart';
import 'package:flutter/material.dart';

class PageListUsers extends StatefulWidget {
  const PageListUsers({Key? key}) : super(key: key);

  @override
  State<PageListUsers> createState() => _PageListUsersState();
}

class _PageListUsersState extends State<PageListUsers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Space Flight Report"),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource3.instance.loadUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
             ReportModel reportModel = ReportModel.fromJson(snapshot.data);
            return _buildSuccessSection(reportModel);
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

  Widget _buildSuccessSection(ReportModel results) {
    return ListView.builder(
      itemCount: results.results!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(results.results![index]);
      },
    );
  }

  Widget _buildItemUsers(Results report) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReportDetail(idReport: report.id!,))
      ),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(report.imageUrl!),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(report.title!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
