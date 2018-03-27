import 'package:flutter/material.dart';

AppBar appBarWithTitle(
        [String title, List<Widget> actions = const <Widget>[], String asset]) =>
    new AppBar(
      title: new Text(title),
      actions: actions,
      flexibleSpace: asset != null
          ? new Image.asset(
              asset,
              fit: BoxFit.fitWidth,
            )
          : null,
    );

Widget bodyWithText(String body) => new Container(
      alignment: Alignment.center,
      child: new Text(body),
    );
