import 'package:chat_gpt_app/routing/routes.dart';
import 'package:chat_gpt_app/ui/home/home.dart';
import 'package:chat_gpt_app/ui/started/started.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.staringScreen:
        return MaterialPageRoute(
          builder: (_) => /*BlocProvider(
            create: (context) => UserBloc(userRepository: UserRepository()),
            child:*/ const Starting()
          );
      case Routes.homeScreen:
        //final user = settings.arguments as User; 
        return MaterialPageRoute(
          builder: (_) =>const Home());/* BlocProvider(
            create: (context) => UserBloc(userRepository: UserRepository()),
            child: UserDetails(user: user)*/ 
        
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Route found for this settings"),
            ),
          ),
        );
    }
  }
}
