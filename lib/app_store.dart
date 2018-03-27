library store;

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';

part 'app_store.g.dart';


// TestApp State
abstract class TestAppState
    implements Built<TestAppState, TestAppStateBuilder> {
  factory TestAppState() => _$TestAppState._(
        useCaseTwoPageState: 0,
        useCaseThreeText: "",
        useCaseThreeLockStatus: false,
        useCaseFourRouteIndex: 0,
      );

  TestAppState._();

  // use case two page state
  int get useCaseTwoPageState;

  // use case three textfield state
  String get useCaseThreeText;

  // use case three lock state
  bool get useCaseThreeLockStatus;

  // use case four route state
  int get useCaseFourRouteIndex;

  // use case five loading status
  @nullable
  bool get useCaseFiveStatus;

  // use case five data
  @nullable
  BuiltList get useCaseFiveData;
}

// TestApp Actions
abstract class TestAppActions extends ReduxActions {
  factory TestAppActions() => new _$TestAppActions();

  TestAppActions._();

  ActionDispatcher<int> get useCaseSetPage;

  ActionDispatcher<String> get useCaseThreeSetText;

  ActionDispatcher<bool> get useCaseThreeSetLock;

  ActionDispatcher<int> get useCaseFourSetRouteIndex;

  ActionDispatcher<Null> get useCaseFiveFetchData;

  ActionDispatcher<List<String>> get useCaseFiveSetData;
}


// TestApp reducers
ReducerBuilder<TestAppState, TestAppStateBuilder> reducerBuilder =
    new ReducerBuilder<TestAppState, TestAppStateBuilder>()
      ..add(TestAppActionsNames.useCaseSetPage,
          (s, a, b) => b.useCaseTwoPageState = a.payload)
      ..add(TestAppActionsNames.useCaseThreeSetText,
          (s, a, b) => b.useCaseThreeText = a.payload)
      ..add(TestAppActionsNames.useCaseThreeSetLock,
          (s, a, b) => b.useCaseThreeLockStatus = a.payload)
      ..add(TestAppActionsNames.useCaseFourSetRouteIndex,
          (s, a, b) => b.useCaseFourRouteIndex = a.payload)
      ..add(TestAppActionsNames.useCaseFiveFetchData,
          (s, a, b) => b..useCaseFiveStatus = true)
      ..add(
          TestAppActionsNames.useCaseFiveSetData,
          (s, a, b) => b
            ..useCaseFiveStatus = false
            ..useCaseFiveData = new BuiltList<String>(a.payload));
