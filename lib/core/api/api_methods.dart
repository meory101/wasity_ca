import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
class ApiMethods {


  Future<http.Response> post({required String url, required Map body}) async {
    return await http.post(Uri.parse(url), body: body);
  }

  Future<http.Response> get({required String url,}) async {
    return await http.get(Uri.parse(url));
  }


  Future<http.Response> postWithFile(
      {required String url, required Map data, required File file}) async {
    var multiPartRequest = http.MultipartRequest('POST', Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multiPartFile = http.MultipartFile('image', stream, length,
        filename: basename(file.path));
    multiPartRequest.files.add(multiPartFile);
    data.forEach((key, value) {
      multiPartRequest.fields[key] = value;
    });
    http.StreamedResponse streamStream = await multiPartRequest.send();
    http.Response response = await http.Response.fromStream(streamStream);
    return response;
  }

}