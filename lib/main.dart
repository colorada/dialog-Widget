// ignore_for_file: unnecessary_new, prefer_const_constructors, deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyDialog(),
  ));
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

enum DialogAction{
  yes,
  no
}

class _MyDialogState extends State<MyDialog> {
  String _inputValue = "";

  void _alertResult(DialogAction action){
    print("Tu seleccion fue $action");
  }

  void _showAlert(String value) {
    AlertDialog dialog = new AlertDialog(
      content: new Text(value),
      actions: <Widget>[
        new FlatButton(onPressed: {_alertResult(DialogAction.yes);}, child: new Text("Si"),),
        new FlatButton(onPressed: {_alertResult(DialogAction.no);}, child: new Text("No"),),

      ],
    );

    showDialog(context: context, builder: dialog);
  }

  void _onChanged(String value) {
    setState(() {
      _inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Demo Alert Dialog"),
        ),
        body: new Container(
            child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: "ingrese el texto"),
                onChanged: (String value) {
                  _onChanged(value);
                },
              ),
              new RaisedButton(
                child: new Text("ver Alerta"),
                onPressed: () {
                  _showAlert(_inputValue);
                },
              ),
            ],
          ),
        )));
  }
}
