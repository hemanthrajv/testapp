import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart';

import 'app_store.dart';
import 'views.dart';

void main() {
  final store = new Store(
    reducerBuilder.build(),
    new TestAppState(),
    new TestAppActions(),
  );

  runApp(new App(store: store));
}
