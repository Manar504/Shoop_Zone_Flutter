import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_zone/Modules/LoginScreen/LoginCubit/cubit.dart';
import 'package:shop_zone/Modules/OnBoarding/On_Boarding.dart';
import 'package:shop_zone/Network/Remoatly/Dio_Helper.dart';

import 'Modules/SettingsScreen/Settings_Screen.dart';

void main() {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoarding(),
      ),
    );
  }
}
