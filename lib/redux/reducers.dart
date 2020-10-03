import 'package:flutter_ecommerce/models/app_state.dart';
import 'package:flutter_ecommerce/redux/actions.dart';

AppState appReducer(state,action){

  return AppState(
      user: userReducer(state.user,action)

  );
}

userReducer(user,action){
  if (action is GetUserAction){
    // return user from action
    return action.User;
  }
  return user;
}