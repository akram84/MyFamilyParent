import 'package:flutter/material.dart';
import 'package:my_family/core/constants.dart';


void pop(BuildContext context)=>  Navigator.pop(context);
void openDrawer(BuildContext context)=>  Scaffold.of(context).openDrawer();

void pushPage(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
  );
}

void popALlAndPushPage(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
    (Route<dynamic> route) => false,
  );
}

void
popAllAndPushName(
  BuildContext context,
  String widget, {
  RoutePredicate? condition,
  Object? arguments,
}) {
  Navigator.of(context).pushNamedAndRemoveUntil(widget, condition ?? (Route<dynamic> route) => false, arguments: arguments);
}

Future<dynamic> pushName(BuildContext context, String route, {dynamic arguments}) {
  return Navigator.of(context).pushNamed(route, arguments: arguments);
}

Future<dynamic> pushNameForResult(BuildContext context, String route) {
  return Navigator.of(context).pushNamed(route);
}

Future<dynamic> pushNameWithArgumentsForResult(BuildContext context, String route, dynamic argument) {
  return Navigator.of(context).pushNamed(route, arguments: argument);
}

void pushNameWithArguments(BuildContext context, String route, dynamic argument) {
  Navigator.of(context).pushNamed(route, arguments: argument);
}

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
  FocusScope.of(context).requestFocus(FocusNode());
}

void pushNameReplacement(BuildContext context, String route, {dynamic arguments}) {
  Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
}
void pushPageReplacement(BuildContext context, Widget widget, {dynamic arguments}) {
  Navigator.of(context).pushReplacement(MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
  );
}

void pushPageRoute<T>(BuildContext context, Route<T> route) {
  Navigator.of(context).push(route);
}

void popAllAndPushNamesWOContext(String route, {condition, arguments}){
  Const.navigatorKey.currentState?.pushNamedAndRemoveUntil(route, condition ?? (Route<dynamic> route) => false, arguments: arguments);

}
void pushNameWOContext(String route, {arguments}) => Const.navigatorKey.currentState?.pushNamed(route, arguments: arguments);
void pushPageWOContext(Widget widget, {arguments}) => Const.navigatorKey.currentState?.push(MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget));
