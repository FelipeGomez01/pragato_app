import 'package:go_router/go_router.dart';
import 'package:pragato_app/screens/detail/detail_screen.dart';

abstract class DetailRouter {
  static const detail = '/detail';

  static final List<GoRoute> routes = [
    GoRoute(
      path: detail,
      builder: (_, __) => const DetailScreen()
    )
  ];
}