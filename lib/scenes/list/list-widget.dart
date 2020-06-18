import 'package:chuck_norris/scenes/detail/detail-widget.dart';
import 'package:chuck_norris/scenes/list/list-bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    final _bloc = ListBloc();

    return Material(
      child: Scaffold(
        body: StreamBuilder<List<String>>(
          stream: _bloc.output,
          builder: (context, snap) {
            if (snap.data == null) return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
            if (snap.data.isEmpty) return Center(child: Text("Não encontramos"));

            return ListView.builder(
              itemCount: snap.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snap.data[index]),
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => DetailWidget(snap.data[index]))
                    );
                  })
                ;
              }
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
