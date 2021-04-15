import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            });
          case View.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            if (args != null && args.containsKey('id')) {
              return MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    return View(id: args['id']);
                  });
            }
            return MaterialPageRoute(builder: (BuildContext context) {
              return View();
            });
          case MyBlog.routeName:
            return PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation animation,
                  Animation secondaryAnimation) {
                return MyBlog();
              },
              transitionsBuilder: (BuildContext context, Animation animation,
                  Animation animation2, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );

            break;
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return NotFound();
            });
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  static const routeName = '/';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: Text(
                  'it`s my start home page',
                  style: TextStyle(fontSize: 40),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/View');
                }),
            ElevatedButton(
                child: Text(
                  'view wiyh arguments',
                  style: TextStyle(fontSize: 40),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/View', arguments: {'id': 5645});
                }),
            ElevatedButton(
                child: Text(
                  'Blog',
                  style: TextStyle(fontSize: 40),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return MyBlog();
                  }));
                }),
            ElevatedButton(
                child: Text(
                  'not found',
                  style: TextStyle(fontSize: 40),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/fdfdas');
                }),
          ],
        )));
  }
}

class View extends StatefulWidget {
  View({Key key, this.id}) : super(key: key);
  static const routeName = '/View';
  final int id;
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: widget.id != null
              ? Text(
                  'MyView ${widget.id}',
                  style: TextStyle(fontSize: 40),
                )
              : Text('MyView'),
        ));
  }
}

class MyBlog extends StatefulWidget {
  MyBlog({Key key}) : super(key: key);
  static const routeName = '/MyBlog';
  @override
  _MyBlogState createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('blog'))));
  }
}

class NotFound extends StatelessWidget {
  const NotFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text('satte'),
        ),
      ),
    );
  }
}
