import 'package:flutter/material.dart';

class NavigationService{
  GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService(){
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _rn){
    return navigationKey.currentState.push(_rn);
  }

  Future<dynamic> pushAndRemoveUntil(MaterialPageRoute _rn){
    return navigationKey.currentState.pushAndRemoveUntil(_rn, (route) => route.isFirst);
  }




  goback(){
    return navigationKey.currentState.pop();

  }
}