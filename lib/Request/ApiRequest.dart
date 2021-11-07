import 'package:http/http.dart' as http;
import 'package:workour/URL/ApiURl.dart';
import 'package:workour/constants/string_assets.dart';
import 'package:workour/prefs/SharedPrefs.dart';

class Request {
  final String url;
  final dynamic body;

  Request({required this.url, this.body});

  Future<http.Response> post() async{
    return await http.post(Uri.parse(URls.baseUrl + url), body: body,headers: {
      'Content-Type': 'application/json; '
          'charset=utf-8'
    }).timeout(Duration(minutes: 2),
        onTimeout: (){
          return http.Response("Error", StringAssets.timeoutCode);
        });
  }

  Future<http.Response> get() async {
    return http.get(Uri.parse(URls.baseUrl + url),
        headers: {
        }).timeout(Duration(minutes: 2),
        onTimeout: (){
          return http.Response("Error", StringAssets.timeoutCode);
        });
  }



  Future<http.Response> postApiWithId() async{
    return await http.post(Uri.parse(URls.baseUrl + url+await SharedPrefs.getUid()), body: body,headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    }).timeout(Duration(minutes: 2));
  }


  Future<http.Response> getRequestWithId() async{
    return http.get(Uri.parse(URls.baseUrl + url+await SharedPrefs.getUid()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }).timeout(Duration(minutes: 2));
  }

  Future<http.Response> put() async {
    return http.put(Uri.parse(URls.baseUrl + url), body: body,
        headers: {
          "content-type": "application/json"
        }).timeout(Duration(minutes: 2));
  }
}