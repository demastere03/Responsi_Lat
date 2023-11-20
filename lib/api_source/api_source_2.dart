import 'package:prak_latihan/base_network/base_network_2.dart';

class ApiDataSource2 {
  static ApiDataSource2 instance = ApiDataSource2();

  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork2.get("blogs");
  }

  Future<Map<String, dynamic>> loadDetailUser(int idDiterima){
    String id = idDiterima.toString();
    return BaseNetwork2.get("blogs/$id");
  }
}
