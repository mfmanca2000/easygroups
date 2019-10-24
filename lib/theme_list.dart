import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easygroups/new_theme.dart';
import 'package:flutter/material.dart';

import './model/record.dart';

class ThemeList extends StatefulWidget {
  final String title;

  ThemeList(this.title);

  @override
  _ThemeListState createState() => _ThemeListState();
}

class _ThemeListState extends State<ThemeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).pushNamed(
            NewThemeScreen.routeName,
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('themes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final List<IconData> iconData = <IconData>[
      Icons.call,
      Icons.school,
      Icons.battery_charging_full,
      Icons.brightness_7,
      Icons.build,
      Icons.business_center,
      Icons.cake,
      Icons.check_circle_outline,
      Icons.departure_board,
      Icons.directions_bike,
      Icons.directions_car
    ];
    final Random r = Random();

    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
            leading: Icon(iconData[r.nextInt(iconData.length)]),
            title: Text(record.name),
            trailing: Text(record.responsable),
            onTap: () => print(record),
          ),
        ),
      ),
    );
  }
}
