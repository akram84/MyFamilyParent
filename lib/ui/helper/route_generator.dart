import 'package:flutter/material.dart';
import 'package:my_family/ui/screens/auth/create_account/create_account_screen.dart';
import 'package:my_family/ui/screens/auth/login_screen.dart';
import 'package:my_family/ui/screens/boarding_screen.dart';
import 'package:my_family/ui/screens/entertainment/add_entertainment.dart';
import 'package:my_family/ui/screens/entertainment/entertainments_screen.dart';
import 'package:my_family/ui/screens/home/home_screen.dart';
import 'package:my_family/ui/screens/settings/settings/settings_screen.dart';
import 'package:my_family/ui/screens/study/add_study_screen.dart';

import '../resources/app_routes.dart';
import '../screens/do_list/add_todo_screen.dart';
import '../screens/do_list/todo_list_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/study/study_screen.dart';

class RouteGenerator{
  static Route? generateRoute(RouteSettings settings){
    // final dynamic args = settings.arguments;

    switch (settings.name){

      case AppRoutes.splash:
        return _screenRedirect(const SplashScreen());
      case AppRoutes.boarding:
        return _screenRedirect(BoardingScreen());

      case AppRoutes.login:
        return _screenRedirect(LoginScreen());
      case AppRoutes.createAccount:
        return _screenRedirect(CreateAccountScreen());

      case AppRoutes.home:
        return _screenRedirect(const HomeScreen());

      case AppRoutes.entertainments:
        return _screenRedirect(EntertainmentsScreen());
      case AppRoutes.addEntertainments:
        return _screenRedirect(const AddEntertainmentScreen());

      case AppRoutes.todoList:
        return _screenRedirect(TodoListScreen());
      // case AppRoutes.childTodo:
      //   return _screenRedirect(ChildTodo());
      case AppRoutes.addTodo:
        return _screenRedirect(AddTodoScreen());

      case AppRoutes.study:
        return _screenRedirect(StudyScreen());
      // case AppRoutes.subjects:
      //   return _screenRedirect(SublectsScreen());
      case AppRoutes.addStudy:
        return _screenRedirect(AddStudyScreen());
      // case AppRoutes.assignments:
      //   return _screenRedirect(const AssignmentsScreen());
      // case AppRoutes.assignment:
      //   return _screenRedirect(const AssignmentScreen());

      case AppRoutes.settings:
        return _screenRedirect(SettingsScreen());


      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute<dynamic> _screenRedirect(Widget screen) {
    return MaterialPageRoute<dynamic>(builder: (_) => screen);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      );
    });
  }
}
