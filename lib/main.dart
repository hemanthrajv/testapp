import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart';

import 'app_store.dart';
import 'views.dart';

void main() {
  final Store<TestAppState,TestAppStateBuilder,TestAppActions> store =
      new Store<TestAppState, TestAppStateBuilder, TestAppActions>(
    reducerBuilder.build(),
    new TestAppState(),
    new TestAppActions(),
  );

  runApp(new App(store: store));
}
