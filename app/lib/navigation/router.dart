import 'package:go_router/go_router.dart';
import 'package:pragato_app/navigation/routes/detail_routes.dart';
import 'package:pragato_app/navigation/routes/home_routes.dart';
import 'package:pragato_app/navigation/routes/search_routes.dart';

final appRouter = GoRouter(
  routes: [
    ...HomeRouter.routes,
    ...DetailRouter.routes,
    ...SearchRouter.routes
  ]
);