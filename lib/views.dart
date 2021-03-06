import 'dart:async';

import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'app_store.dart';
import 'utils.dart';

// Main App component
class App extends StatelessWidget {
  final Store<TestAppState, TestAppStateBuilder, TestAppActions> store;

  App({this.store});

  @override
  Widget build(BuildContext context) {
    return new ReduxProvider(
      store: store,
      child: new MaterialApp(
        title: 'Test App',
        theme: new ThemeData(platform: TargetPlatform.iOS),
        routes: <String, WidgetBuilder>{
          '/': (_) => new HomePage(),
          '/navigationOne': (_) => start,
          '/navigationTwo': (_) => new NavigationTwo(),
          '/navigationThree': (_) => new NavigationThree(),
          '/navigationFour': (_) => new NavigationFour(),
          '/navigationFive': (_) => new NavigationFive(),
          '/navigationSix': (_) => new NavigationSix()
        },
      ),
    );
  }
}

// HomePage
class HomePage extends StatelessWidget {
  void _navigate(BuildContext context, int useCase) {
    switch (useCase) {
      case 1:
        Navigator.of(context).pushNamed('/navigationOne');
        break;
      case 2:
        Navigator.of(context).pushNamed('/navigationTwo');
        break;
      case 3:
        Navigator.of(context).pushNamed('/navigationThree');
        break;
      case 4:
        Navigator.of(context).pushNamed('/navigationFour');
        break;
      case 5:
        Navigator.of(context).pushNamed('/navigationFive');
        break;
      case 6:
        Navigator.of(context).pushNamed('/navigationSix');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarWithTitle('Home Page'),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              onPressed: () => _navigate(context, 1),
              child: const Text('Use Case 1'),
            ),
            new RaisedButton(
              onPressed: () => _navigate(context, 2),
              child: const Text('Use Case 2'),
            ),
            new RaisedButton(
              onPressed: () => _navigate(context, 3),
              child: const Text('Use Case 3'),
            ),
            new RaisedButton(
              onPressed: () => _navigate(context, 4),
              child: const Text('Use Case 4'),
            ),
            new RaisedButton(
              onPressed: () => _navigate(context, 5),
              child: const Text('Use Case 5'),
            ),
            new RaisedButton(
              onPressed: () => _navigate(context, 6),
              child: const Text('Use Case 6'),
            ),
          ],
        ),
      ),
    );
  }
}

/*____________________________________________________________________*/

// Use Case One Navigation Demo

typedef void ClickCallBack(BuildContext context);

// Flow Based navigation demo

final Widget start = new NavigationOneWidget(
  title: 'Screen A',
  body: 'Screen A',
  next: 'B',
  callBack: (BuildContext context) => Navigator.of(context).push(
        new MaterialPageRoute<Null>(
          builder: (BuildContext _) {
            return _screenB;
          },
          settings: const RouteSettings(name: '/screenB'),
        ),
      ),
);

final Widget _screenB = new NavigationOneWidget(
  title: 'Screen B',
  body: 'Screen B',
  next: 'C',
  callBack: (BuildContext context) => Navigator.of(context).push(
        new MaterialPageRoute<Null>(
          builder: (BuildContext _) {
            return _screenC;
          },
          settings: const RouteSettings(name: '/screenC'),
        ),
      ),
);

final Widget _screenC = new NavigationOneWidget(
  title: 'Screen C',
  body: 'Screen C',
  next: 'M',
  callBack: (BuildContext context) => Navigator.of(context).push(
        new MaterialPageRoute<Null>(
          builder: (BuildContext _) {
            return _modalM;
          },
          fullscreenDialog: true,
          settings: const RouteSettings(name: '/modalM'),
        ),
      ),
);

final Widget _modalM = new NavigationOneWidget(
  title: 'Modal M',
  body: 'Modal M',
  next: 'N',
  callBack: (BuildContext context) => Navigator.of(context).push(
        new MaterialPageRoute<Null>(
          builder: (_) {
            return _screenN;
          },
          maintainState: false,
          settings: const RouteSettings(name: '/screenN'),
        ),
      ),
);

final Widget _screenN = new NavigationOneWidget(
  title: 'Screen N',
  body: 'Screen N',
  next: 'D',
  callBack: (BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute<Null>(builder: (_) {
      return _screenD;
    }), ModalRoute.withName('/navigationOne'));
  },
);

const Widget _screenD = const NavigationOneWidget(
  title: 'Screen D',
  body: 'Screen D',
);

// Common widget used for Navigation Use Case One
class NavigationOneWidget extends StatelessWidget {
  final String title;
  final String body;
  final String next;
  final ClickCallBack callBack;

  const NavigationOneWidget({this.title, this.body, this.callBack, this.next});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarWithTitle(title),
      body: bodyWithText(body),
      floatingActionButton: callBack != null
          ? new FloatingActionButton(
              onPressed: () => callBack(context),
              child: new Text(next),
            )
          : null,
    );
  }
}

/*____________________________________________________________________*/

// Navigation UseCase Two
class NavigationTwo extends StatelessWidget {
  String _getName(int index) {
    if (index == 0) {
      return 'Screen A';
    }
    if (index == 1) {
      return 'Screen B';
    }
    return 'Screen C';
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnection<TestAppState, TestAppActions, int>(
      connect: (TestAppState state) => state.useCaseTwoPageState,
      builder: (BuildContext context, int s, TestAppActions a) => new Scaffold(
            appBar: appBarWithTitle('Use Case 2'),
            body: new Container(
                alignment: Alignment.center,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Flexible(
                      child: s == 2
                          ? new Icon(Icons.play_arrow)
                          : new RaisedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(
                                  new MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                    return new Scaffold(
                                      appBar: appBarWithTitle('Screen D'),
                                      body: const Center(
                                        child: const Text('Screen D'),
                                      ),
                                      floatingActionButton:
                                          new FloatingActionButton(
                                        onPressed: () {
                                          a.useCaseSetPage(s == 0 ? 1 : 0);
                                          Navigator.of(context).pop();
                                        },
                                        child: new Text(s == 0 ? 'B' : 'A'),
                                      ),
                                    );
                                  }),
                                );
                              },
                              icon: s == 0
                                  ? new Icon(Icons.home)
                                  : new Icon(Icons.star),
                              label: const Text('Screen D'),
                            ),
                    ),
                    new Flexible(
                      child: new Text(_getName(s)),
                    )
                  ],
                )),
            bottomNavigationBar: new BottomNavigationBar(
                currentIndex: s,
                onTap: (int index) => a.useCaseSetPage(index),
                items: <BottomNavigationBarItem>[
                  new BottomNavigationBarItem(
                      icon: new Icon(Icons.home),
                      title: const Text('Screen A')),
                  new BottomNavigationBarItem(
                      icon: new Icon(Icons.star),
                      title: const Text('Screen B')),
                  new BottomNavigationBarItem(
                      icon: new Icon(Icons.play_arrow),
                      title: const Text('Screen C'))
                ]),
          ),
    );
  }
}

/*____________________________________________________________________*/

// Use Case Three Navigation demo
class NavigationThree extends StatelessWidget {
  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return new StoreConnection<TestAppState, TestAppActions,
            Map<String, dynamic>>(
        connect: (TestAppState state) => <String, dynamic>{
              'status': state.useCaseThreeLockStatus,
              'text': state.useCaseThreeText
            },
        builder:
            (BuildContext context, Map<String, dynamic> s, TestAppActions a) {
          if (_controller == null) {
            _controller = new TextEditingController(text: s['text']);
            _controller
                .addListener(() => a.useCaseThreeSetText(_controller.text));
          }

          List<Widget> _children = <Widget>[
            new Scaffold(
              appBar: appBarWithTitle('Use Case 3', <Widget>[
                new IconButton(
                    icon: new Icon(Icons.lock_open),
                    onPressed: () => a.useCaseThreeSetLock(true))
              ]),
              body: new Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: new TextField(
                  controller: _controller,
                ),
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: Theme.of(context).canvasColor,
              child: new FloatingActionButton(
                onPressed: () => a.useCaseThreeSetLock(false),
                child: new Icon(Icons.lock),
              ),
            ),
          ];

          _children = s['status'] ? _children : _children.reversed.toList();

          return new Stack(
            children: _children,
          );
        });
  }
}

/*____________________________________________________________________*/

// Use Case Four Navigation demo
class NavigationFour extends StatelessWidget {
  Color _getColorForIndex(int index) {
    if (index == 0) {
      return const Color(0xffdf717e);
    }
    if (index == 1) {
      return const Color(0xfffff8a8);
    }
    return const Color(0xffddbd73);
  }

  Color _getColorForText(int index) {
    if (index == 0) {
      return const Color(0xffdc143c);
    }
    if (index == 1) {
      return const Color(0xff987847);
    }
    return const Color(0xff2a4390);
  }

  List<BottomNavigationBarItem> _getBottomBarForIndex(int index) {
    IconData one;
    IconData two;
    IconData three;
    String textOne;
    String textTwo;
    String textThree;

    if (index == 0) {
      one = Icons.settings;
      two = Icons.computer;
      three = Icons.warning;
      textOne = 'b1/t1';
      textTwo = 'b1/t2';
      textThree = 'b1/t3';
    } else if (index == 1) {
      one = Icons.contact_mail;
      two = Icons.folder;
      three = Icons.sort;
      textOne = 'b2/t1';
      textTwo = 'b2/t2';
      textThree = 'b2/t3';
    } else {
      one = Icons.home;
      two = Icons.headset_mic;
      three = Icons.file_upload;
      textOne = 'b3/t1';
      textTwo = 'b3/t2';
      textThree = 'b3/t3';
    }

    return <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: new Icon(one), title: new Text(textOne)),
      new BottomNavigationBarItem(
          icon: new Icon(two), title: new Text(textTwo)),
      new BottomNavigationBarItem(
          icon: new Icon(three), title: new Text(textThree))
    ];
  }

  final List<String> _imageAsstes = <String>[
    'assets/coffee_01.jpg',
    'assets/coffee_02.jpg',
    'assets/coffee_03.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return new StoreConnection<TestAppState, TestAppActions, int>(
        connect: (TestAppState state) => state.useCaseFourRouteIndex,
        builder: (BuildContext context, int s, TestAppActions a) {
          final Drawer _drawer = new Drawer(
            child: new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new DrawerHeader(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage(_imageAsstes[s]),
                          fit: BoxFit.fill),
                    ),
                    child: new Container(),
                  ),
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      a.useCaseFourSetRouteIndex(0);
                    },
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.code),
                        const Text(
                          ' Button 1',
                        ),
                      ],
                    ),
                  ),
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      a.useCaseFourSetRouteIndex(1);
                    },
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.palette),
                        const Text(
                          ' Button 2',
                        ),
                      ],
                    ),
                  ),
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      a.useCaseFourSetRouteIndex(2);
                    },
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.wb_sunny),
                        const Text(
                          ' Button 3',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );

          return new Scaffold(
            drawer: _drawer,
            appBar: appBarWithTitle(
                '',
                <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.location_on),
                    onPressed: () => null,
                    color: _getColorForIndex(s),
                  )
                ],
                _imageAsstes[s]),
            bottomNavigationBar: new Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: _getColorForIndex(s),
                  textTheme: Theme.of(context).textTheme.copyWith(
                      caption: new TextStyle(color: _getColorForText(s)))),
              child: new BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: _getColorForText(s),
                items: _getBottomBarForIndex(s),
              ),
            ),
          );
        });
  }
}

/*____________________________________________________________________*/

// Use Case Five Navigation demo
class NavigationFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnection<TestAppState, TestAppActions,
            Map<String, dynamic>>(
        connect: (TestAppState state) => <String, dynamic>{
              'loading': state.useCaseFiveStatus,
              'data': state.useCaseFiveData
            },
        builder:
            (BuildContext context, Map<String, dynamic> s, TestAppActions a) {
          if (s['loading'] == null) {
            new Future<void>.delayed(new Duration(seconds: 5), () {
              a.useCaseFiveSetData(const <String>['a', 'b', 'c']);
              Navigator.of(context).push(
                  new MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new Scaffold(
                  appBar: appBarWithTitle('Screen B'),
                );
              }));
            });
          }

          return new Scaffold(
              appBar: appBarWithTitle('Use Case 5'),
              body: s['loading'] == null || s['loading']
                  ? const Center(
                      child: const CircularProgressIndicator(),
                    )
                  : bodyWithText('Loading Done.'));
        });
  }
}

/*____________________________________________________________________*/

// Use Case Six Navigation demo
class NavigationSix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarWithTitle('Use Case 6'),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
              new MaterialPageRoute<Null>(
                builder: (_) => new Scaffold(
                      appBar: appBarWithTitle('Screen 6'),
                      body: const Center(
                        child: const TextField(
                          autofocus: true,
                        ),
                      ),
                    ),
              ),
            ),
        child: const Text('B'),
      ),
    );
  }
}
