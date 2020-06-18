
import 'dart:async';
import 'dart:convert';

import 'package:chuck_norris/models/detail.dart';
import 'package:flutter/services.dart';

class DetailBloc {

  final network = MethodChannel('flutter.native/request');

  final _controller = StreamController<Detail>();
  Stream<Detail> get output => _controller.stream;
  Sink<Detail> get input => _controller.sink;

  DetailBloc(String value){
    _getDetail(value);
  }

  _getDetail(String value) async {
    final String json = await network.invokeMethod('getRandomByCategories', value);
    Map<String, dynamic> response = jsonDecode(json);
    input.add(Detail.fromMap(response));
  }

  dispose() {
    _controller.close();
  }


}