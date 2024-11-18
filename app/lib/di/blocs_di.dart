import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/auth/di/auth_di.dart';
import '../../modules/auth/presentation/bloc/auth_bloc.dart';
import '../../modules/home/di/home_di.dart';
import '../../modules/home/presentation/bloc/home_bloc.dart';
import '../../modules/services/di/services_di.dart';
import '../../modules/services/presentation/bloc/services_bloc.dart';

class BlocsDI {
  static get instance => [
    BlocProvider(
      create: (_) => AuthBloc(authUseCase: authDI.authUseCase)
    ),
    BlocProvider(
      create: (_) => HomeBloc(homeUseCase: homeDI.homeUseCase)
    ),
    BlocProvider(
      create: (_) => ServicesBloc(servicesUseCase: servicesDI.servicesUseCase)
    )
  ];
}