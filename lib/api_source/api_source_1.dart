import 'package:prak_latihan/base_network/base_network.dart';

class ApiDataSource1 {
  static ApiDataSource1 instance = ApiDataSource1();

  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork1.get("articles");
  }

  Future<Map<String, dynamic>> loadDetailUser(int idDiterima){
    String id = idDiterima.toString();
    return BaseNetwork1.get("articles/$id");
  }
}
