// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:cozy1/model/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var urL = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
    var result = await http.get(urL);

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
