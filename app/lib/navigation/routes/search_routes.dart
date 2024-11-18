import 'package:go_router/go_router.dart';
import 'package:pragato_app/navigation/routes/detail_routes.dart';
import 'package:pragato_app/screens/home/home_screen.dart';

abstract class HomeRouter {
  static const home = '/';

  static final List<GoRoute> routes = [
    GoRoute(
      path: home,
      builder: (context, state) => HomeScreen(
        navToDetail: (catDetail) => context.push(
          DetailRouter.detail,
          extra: catDetail
        )
      )
    )
  ];
}