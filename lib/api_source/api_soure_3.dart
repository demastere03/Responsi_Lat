import 'package:prak_latihan/base_network/base_network_3.dart';

class ApiDataSource3 {
  static ApiDataSource3 instance = ApiDataSource3();

  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork3.get("reports");
  }

  Future<Map<String, dynamic>> loadDetailUser(int idDiterima){
    String id = idDiterima.toString();
    return BaseNetwork3.get("reports/$id");
  }
}
