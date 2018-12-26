import 'package:http/http.dart' as http;
import 'package:testapp/models/test.dart';
import 'dart:convert';

class TestApi {
  Future<Test> getTestData(int id) async {
  final String url = 'https://jsonplaceholder.typicode.com/todos/$id';
    return http.get(url).then((http.Response response) {
      Map<String, dynamic> jsonRes = json.decode(response.body);
      Test test = Test.fromJson(jsonRes);
      return test;
    });
  }
}

TestApi api = TestApi();
