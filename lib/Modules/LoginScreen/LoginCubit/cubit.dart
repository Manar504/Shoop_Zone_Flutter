
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_zone/Models/Login_Model.dart';
import 'package:shop_zone/Modules/LoginScreen/LoginCubit/states.dart';
import 'package:shop_zone/Network/Remoatly/Dio_Helper.dart';
import 'package:shop_zone/Shared/Constants/Constants.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(): super (InitialLoginState());
  static LoginCubit get(context)=>BlocProvider.of(context);

  bool isPasswordShown = false ;
  void changePasswordVisibility(){

    isPasswordShown = !isPasswordShown ;
    emit(ChangeVisibilityPasswordState()
    );

  }

  LoginModel model;

  void userLogin(
      String email,
      String password,
      ){
    DioHelper.postData(url: LOGIN, data: {
      'email':email,
      'password':password,
    }).then((value){
      model = LoginModel.fromjson(value.data);
      emit(SuccessLoginState());
    }).catchError((error){
      emit(ErrorLoginState());
    });
  }




}