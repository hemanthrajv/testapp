// GENERATED CODE - DO NOT MODIFY BY HAND

part of store;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$TestAppState extends TestAppState {
  @override
  final int useCaseTwoPageState;
  @override
  final String useCaseThreeText;
  @override
  final bool useCaseThreeLockStatus;
  @override
  final int useCaseFourRouteIndex;
  @override
  final bool useCaseFiveStatus;
  @override
  final BuiltList<String> useCaseFiveData;

  factory _$TestAppState([void updates(TestAppStateBuilder b)]) =>
      (new TestAppStateBuilder()..update(updates)).build();

  _$TestAppState._(
      {this.useCaseTwoPageState,
      this.useCaseThreeText,
      this.useCaseThreeLockStatus,
      this.useCaseFourRouteIndex,
      this.useCaseFiveStatus,
      this.useCaseFiveData})
      : super._() {
    if (useCaseTwoPageState == null)
      throw new BuiltValueNullFieldError('TestAppState', 'useCaseTwoPageState');
    if (useCaseThreeText == null)
      throw new BuiltValueNullFieldError('TestAppState', 'useCaseThreeText');
    if (useCaseThreeLockStatus == null)
      throw new BuiltValueNullFieldError(
          'TestAppState', 'useCaseThreeLockStatus');
    if (useCaseFourRouteIndex == null)
      throw new BuiltValueNullFieldError(
          'TestAppState', 'useCaseFourRouteIndex');
  }

  @override
  TestAppState rebuild(void updates(TestAppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TestAppStateBuilder toBuilder() => new TestAppStateBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TestAppState) return false;
    return useCaseTwoPageState == other.useCaseTwoPageState &&
        useCaseThreeText == other.useCaseThreeText &&
        useCaseThreeLockStatus == other.useCaseThreeLockStatus &&
        useCaseFourRouteIndex == other.useCaseFourRouteIndex &&
        useCaseFiveStatus == other.useCaseFiveStatus &&
        useCaseFiveData == other.useCaseFiveData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, useCaseTwoPageState.hashCode),
                        useCaseThreeText.hashCode),
                    useCaseThreeLockStatus.hashCode),
                useCaseFourRouteIndex.hashCode),
            useCaseFiveStatus.hashCode),
        useCaseFiveData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TestAppState')
          ..add('useCaseTwoPageState', useCaseTwoPageState)
          ..add('useCaseThreeText', useCaseThreeText)
          ..add('useCaseThreeLockStatus', useCaseThreeLockStatus)
          ..add('useCaseFourRouteIndex', useCaseFourRouteIndex)
          ..add('useCaseFiveStatus', useCaseFiveStatus)
          ..add('useCaseFiveData', useCaseFiveData))
        .toString();
  }
}

class TestAppStateBuilder
    implements Builder<TestAppState, TestAppStateBuilder> {
  _$TestAppState _$v;

  int _useCaseTwoPageState;
  int get useCaseTwoPageState => _$this._useCaseTwoPageState;
  set useCaseTwoPageState(int useCaseTwoPageState) =>
      _$this._useCaseTwoPageState = useCaseTwoPageState;

  String _useCaseThreeText;
  String get useCaseThreeText => _$this._useCaseThreeText;
  set useCaseThreeText(String useCaseThreeText) =>
      _$this._useCaseThreeText = useCaseThreeText;

  bool _useCaseThreeLockStatus;
  bool get useCaseThreeLockStatus => _$this._useCaseThreeLockStatus;
  set useCaseThreeLockStatus(bool useCaseThreeLockStatus) =>
      _$this._useCaseThreeLockStatus = useCaseThreeLockStatus;

  int _useCaseFourRouteIndex;
  int get useCaseFourRouteIndex => _$this._useCaseFourRouteIndex;
  set useCaseFourRouteIndex(int useCaseFourRouteIndex) =>
      _$this._useCaseFourRouteIndex = useCaseFourRouteIndex;

  bool _useCaseFiveStatus;
  bool get useCaseFiveStatus => _$this._useCaseFiveStatus;
  set useCaseFiveStatus(bool useCaseFiveStatus) =>
      _$this._useCaseFiveStatus = useCaseFiveStatus;

  BuiltList<String> _useCaseFiveData;
  BuiltList<String> get useCaseFiveData => _$this._useCaseFiveData;
  set useCaseFiveData(BuiltList<String> useCaseFiveData) =>
      _$this._useCaseFiveData = useCaseFiveData;

  TestAppStateBuilder();

  TestAppStateBuilder get _$this {
    if (_$v != null) {
      _useCaseTwoPageState = _$v.useCaseTwoPageState;
      _useCaseThreeText = _$v.useCaseThreeText;
      _useCaseThreeLockStatus = _$v.useCaseThreeLockStatus;
      _useCaseFourRouteIndex = _$v.useCaseFourRouteIndex;
      _useCaseFiveStatus = _$v.useCaseFiveStatus;
      _useCaseFiveData = _$v.useCaseFiveData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestAppState other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$TestAppState;
  }

  @override
  void update(void updates(TestAppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TestAppState build() {
    final _$TestAppState _$result = _$v ??
        new _$TestAppState._(
            useCaseTwoPageState: useCaseTwoPageState,
            useCaseThreeText: useCaseThreeText,
            useCaseThreeLockStatus: useCaseThreeLockStatus,
            useCaseFourRouteIndex: useCaseFourRouteIndex,
            useCaseFiveStatus: useCaseFiveStatus,
            useCaseFiveData: useCaseFiveData);
    replace(_$result);
    return _$result;
  }
}

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$TestAppActions extends TestAppActions {
  factory _$TestAppActions() => new _$TestAppActions._();
  _$TestAppActions._() : super._();

  final ActionDispatcher<int> useCaseSetPage =
      new ActionDispatcher<int>('TestAppActions-useCaseSetPage');
  final ActionDispatcher<String> useCaseThreeSetText =
      new ActionDispatcher<String>('TestAppActions-useCaseThreeSetText');
  final ActionDispatcher<bool> useCaseThreeSetLock =
      new ActionDispatcher<bool>('TestAppActions-useCaseThreeSetLock');
  final ActionDispatcher<int> useCaseFourSetRouteIndex =
      new ActionDispatcher<int>('TestAppActions-useCaseFourSetRouteIndex');
  final ActionDispatcher<Null> useCaseFiveFetchData =
      new ActionDispatcher<Null>('TestAppActions-useCaseFiveFetchData');
  final ActionDispatcher<List<String>> useCaseFiveSetData =
      new ActionDispatcher<List<String>>('TestAppActions-useCaseFiveSetData');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    useCaseSetPage.setDispatcher(dispatcher);
    useCaseThreeSetText.setDispatcher(dispatcher);
    useCaseThreeSetLock.setDispatcher(dispatcher);
    useCaseFourSetRouteIndex.setDispatcher(dispatcher);
    useCaseFiveFetchData.setDispatcher(dispatcher);
    useCaseFiveSetData.setDispatcher(dispatcher);
  }
}

class TestAppActionsNames {
  static final ActionName<int> useCaseSetPage =
      new ActionName<int>('TestAppActions-useCaseSetPage');
  static final ActionName<String> useCaseThreeSetText =
      new ActionName<String>('TestAppActions-useCaseThreeSetText');
  static final ActionName<bool> useCaseThreeSetLock =
      new ActionName<bool>('TestAppActions-useCaseThreeSetLock');
  static final ActionName<int> useCaseFourSetRouteIndex =
      new ActionName<int>('TestAppActions-useCaseFourSetRouteIndex');
  static final ActionName<Null> useCaseFiveFetchData =
      new ActionName<Null>('TestAppActions-useCaseFiveFetchData');
  static final ActionName<List<String>> useCaseFiveSetData =
      new ActionName<List<String>>('TestAppActions-useCaseFiveSetData');
}
