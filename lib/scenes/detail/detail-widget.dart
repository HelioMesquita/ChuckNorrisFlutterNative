import 'package:chuck_norris/models/detail.dart';
import 'package:chuck_norris/scenes/detail/detail-bloc.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {

  String category;

  DetailWidget(this.category);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    final _bloc = DetailBloc(widget.category);

    return Material(
      child: Scaffold(
        body: StreamBuilder<Detail>(
          stream: _bloc.output,
          builder: (context, snap) {
            if (snap.data == null) return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  snap.data.iconUrl,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    snap.data.value,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          }
        ),
        appBar: AppBar(
          title: Text("Chuck Norris"),
        ),
      ), 
    );
  }
}