import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_flutter_test_app1/config/server_addresses.dart';
import 'package:my_flutter_test_app1/data/error/exceptions.dart';


abstract class NetworkRequestAbstract{
  // Future<dynamic> getToken();
  Future<dynamic> getLoginResult({
    String email,
    String password,
  });
  Future<dynamic> getUsersResult({
    String page,
  });
  Future<dynamic> getDetailsResult({
    String userId,
  });
}




class NetworkRequest implements NetworkRequestAbstract{

  final http.Client client;

  NetworkRequest({@required this.client});

  // @override
  // Future<dynamic> getToken() async {
  //   var body = {
  //     'key':'?????????/??',
  //     'ip': await getPublicIP(),
  //   };
  //   return _getApiRequest(ServerAddresses.token, body);
  // }

  @override
  Future<dynamic> getLoginResult({
    // String token,
    String email,
    String password,
  }) async {
    var body = {
      // 'token':token,
      'email':email,
      'password':password,
    };
    return _getApiRequest(ServerAddresses.login, body);
  }

  @override
  Future<dynamic> getUsersResult({
    String page,
  }) async {
    var body = {
      'page':page,
    };
    return _getApiRequest(ServerAddresses.users, body);
  }

  @override
  Future<dynamic> getDetailsResult({
    String userId,
  }) async {
    var body = {
      'user_id': userId
    };
    return _getApiRequest(ServerAddresses.details, body);
  }







Future<List<dynamic>> _getApiRequest(String url, body) async {
  String queryString = Uri(queryParameters: body).query;
  var requestUrl = url + '?' + queryString; // result - https://www.myurl.com/api/v1/user?param1=1&param2=2
  final response = await client.get(requestUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw HttpRequestException();
  }
}

  Future<dynamic> _postApiRequest(String url, body) async {
    final response = await client.post(url,  body: body);
    // print(json.decode(response.body).toString());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw HttpRequestException();
    }
  }

  Future<dynamic> _getCreateTicketApiRequest(
      String url,
      String myfile,
      String ip,
      String token,
      String title,
      String uname,
      String password,
      String dep,
      String imp,
      String txt,
      ) async {
    var uri = Uri.parse(url);
    var request =
    myfile != ''
        ?
    (http.MultipartRequest('POST', uri)
      ..fields['token'] = token
      ..fields['ip'] = ip
      ..fields['title'] = title
      ..fields['uname'] = uname
      ..fields['password'] = password
      ..fields['dep'] = dep
      ..fields['imp'] = imp
      ..fields['txt'] = txt
      ..files.add(await http.MultipartFile.fromPath(
          'myfile', myfile,
          contentType: MediaType.parse('image/jpeg'))))
        :
    (http.MultipartRequest('POST', uri)
      ..fields['token'] = token
      ..fields['ip'] = ip
      ..fields['title'] = title
      ..fields['uname'] = uname
      ..fields['password'] = password
      ..fields['dep'] = dep
      ..fields['imp'] = imp
      ..fields['txt'] = txt);
    var response = await request.send();

    if (response.statusCode == 200) {
      try {

        return http.Response.fromStream(response)
            .then((response) {
          return response.body;
        }).then((body) {
          return json.decode(body);
        })
            .catchError((e) {
          return {'mssg': 'Got error: $e'};
        });

      }catch(e){
        print('qqqqqqqqqqqqq' + e.toString());
      }
    } else {
      throw HttpRequestException();
    }
  }


}