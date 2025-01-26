import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get(String url) async {
    log('before await of API');
    http.Response response = await http.get(Uri.parse(url));
    log('after await of API');
    if (response.statusCode == 200) {
      log('status code of API 200');
      return jsonDecode(response.body);
    } else {
      log('status code of API not 200');
      throw Exception(
          "there is a problem in status code ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    // {
//       "title": "test",
//       "price": "13.5",
//       "description": "lorem ipsum set",
//       "image": "https://i.pravatar.cc",
//       "category": "electronic",
//     }
    if (token != null) {
      headers.addAll({'Authorization': "Bearer $token"});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "there is an error in status code ${jsonDecode(response.body)}");
    }
  }

  Future<dynamic> put(
      {required String url,
      required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    if (token != null) {
      headers.addAll({'Authorization': "Bearer $token"});
    }
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "there is an error in status code ${jsonDecode(response.body)}");
    }
  }
}
