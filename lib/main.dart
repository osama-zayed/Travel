import 'package:bilqis/blocs/airport_bloc.dart';
import 'package:bilqis/blocs/login_bloc.dart';
import 'package:bilqis/repositories/airport_repository.dart';
import 'package:bilqis/repositories/login_repository.dart';
import 'package:bilqis/repositories/my_trips_repository.dart';
import 'package:bilqis/repositories/news_repository.dart';
import 'package:bilqis/repositories/plane_repository.dart';
import 'package:bilqis/repositories/route_repository.dart';
import 'package:bilqis/repositories/user_repository.dart';
import 'package:bilqis/screen/choose_passenger.dart';
import 'package:bilqis/screen/loginsignup/login_signup.dart';
import 'package:bilqis/screen/main_screen.dart';
import 'package:bilqis/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'blocs/my_trips_bloc.dart';
import 'blocs/news_bloc.dart';
import 'blocs/plane_bloc.dart';
import 'blocs/route_bloc.dart';
import 'blocs/user_bloc.dart';
import 'localization/changelocal.dart';
import 'localization/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(LoginSignupUI());
}
class LoginSignupUI extends StatelessWidget {
  const LoginSignupUI({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NewsBloc(repository: NewsRepository())..add(LoadData()),
        ),
        BlocProvider(
          create: (_) => LoginBloc(repository: LoginRepository())..add(LoadLoginData()),
        ),
        BlocProvider(
          create: (_) => UserBloc(repository: UserRepository())..add(LoadUserData()),
        ),
        BlocProvider(
          create: (_) => MyTripsBloc(repository: MyTripsRepository())..add(LoadTripsData()),
        ),
        BlocProvider(
          create: (_) => RouteBloc(repository: RouteRepository())..add(LoadRouteData()),
        ),
        BlocProvider(
          create: (_) => PlaneBloc(repository: PlaneRepository())..add(LoadPlaneData()),
        ),
        BlocProvider(
          create: (_) => AirportBloc(repository: AirportRepository())..add(LoadAirportData()),
        ),
      ],
      child: GetMaterialApp(
        initialRoute: '/',
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        title: "Login Signup UI",
        locale: controller.language,

        // home: SeatLevel(),

        routes: {
          '/' : (context) => const  MainScreen (),
          '/profile' : (context) =>  LoginSignupScreen(),
        },
    ),
    );
  }
}