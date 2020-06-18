
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class ListBloc {

  final network = MethodChannel('flutter.native/request');

  final _controller = StreamController<List<String>>();
  Stream<List<String>> get output => _controller.stream;
  Sink<List<String>> get input => _controller.sink;

  ListBloc(){
    getCategories();
  }

  getCategories() async {
    try {
      final String json = await network.invokeMethod('getCategories');
      List<dynamic> response = jsonDecode(json);
      final values = List<String>.from(response);
      input.add(values);
    } on PlatformException catch (_) {
      input.add([]);
    }
  }

  dispose() {
    _controller.close();
  }


}