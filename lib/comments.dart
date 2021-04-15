//* --------------------- // Simple navigation in button --------------------- *//
//ElevatedButton(
// child: Text('it`s my start home page'),
// onPressed: () {
//   Navigator.of(context)
//       .push(MaterialPageRoute(builder: (BuildContext context) {
//     return View();
//* or (If got Route)
// ElevatedButton(
// child: Text(
//   'it`s my start home page',
//   style: TextStyle(fontSize: 40),
// ),
// onPressed: () {
//   Navigator.of(context).pushNamed('/View');
// }),

/* -------------------------------------------------------------------------- */
//*                      automaticallyImplyLeading: false,                   *//
/*                        Убирает стрелку назад в AppBar                      */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
//?                             Добовляем Route                              *//
/* -------------------------------------------------------------------------- */
//  initialRoute: '/',
//       onUnknownRoute: (RouteSettings settings) {
//         return MaterialPageRoute(builder: (BuildContext context) {
//           return NotFound();
//         });
//       },
//       routes: {
//         '/': (BuildContext context) => HomePage(),
//         '/View': (BuildContext context) => View(),
//         '/MyBlog': (BuildContext context) => MyBlog(),
//       },
/** 
//TODO onGenerateRoute 
// onGenerateRoute: (RouteSettings settings) {
//         switch (settings.name) {
//           case HomePage.routeName:
//             return MaterialPageRoute(builder: (BuildContext context) {
//               return HomePage();
//             });
//           case View.routeName:
//             return MaterialPageRoute(builder: (BuildContext context) {
//               return View();
//             });
//           case MyBlog.routeName:
//             return MaterialPageRoute(builder: (BuildContext context) {
//               return MyBlog();
//             });
//             break;
//           default:
//             return MaterialPageRoute(builder: (BuildContext context) {
//               return NotFound();
//             });
// }
*/
/** 
 * !onGenerateRoute with arguments
 * onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            });
          case View.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            // MaterialPageRoute(builder: (BuildContext context) {});
            return MaterialPageRoute(builder: (BuildContext context) {
              if (args != null && args.containsKey('id')) {
                return View(id: args['id']);
              }
              return View();
            });
          case MyBlog.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return MyBlog();
            });
            break;
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return NotFound();
            });
        }
 * 
 */
/**
 *? PageRouteBuilder - castom animation
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
 */
