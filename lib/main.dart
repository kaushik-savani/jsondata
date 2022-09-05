import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsondata/buynow.dart';
import 'package:jsondata/drawer.dart';
import 'package:jsondata/loadimage.dart';
import 'package:jsondata/tabbar.dart';
import 'package:jsondata/urlauncer.dart';
import 'package:jsondata/webview.dart';

void main(){
  runApp(MaterialApp(home: demo()));
}
class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    l = jsonDecode(response.body);
    status = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: status
              ? ListView.builder(
                  itemCount: l.length,
                  itemBuilder: (context, index) {
                    media m=media.fromJson(l[index]);
                    return ListTile(
                      title: Text("${m.title}"),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}

class media {
  int? userId;
  int? id;
  String? title;
  String? body;

  media({this.userId, this.id, this.title, this.body});

  media.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
