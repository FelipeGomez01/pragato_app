import 'package:go_router/go_router.dart';
import 'package:pragato_app/navigation/routes/detail_routes.dart';
import 'package:pragato_app/screens/searcher/search_screen.dart';

abstract class SearchRouter {
  static const searcher = '/searcher';

  static final List<GoRoute> routes = [
    GoRoute(
      path: searcher,
      builder: (context, __) => SearchScreen(
        navToDetail: (catDetail) => context.push(
          DetailRouter.detail,
          extra: catDetail
        )
      )
    )
  ];
}