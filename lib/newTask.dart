import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Task'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Title'),
          TextFormField(),
          Text('Description'),
          TextFormField(),
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {

              },
              child: Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
