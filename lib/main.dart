import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  String? token = await CacheHelper.prefs?.getString('token');
  print(token);
  runApp(MyApp(token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp(this.token, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'budget planner',
      theme: ThemeData(
        primarySwatch: AppColor.primaryColor,
      ),

      // initialRoute: AppRoutes.confirmation,
      initialRoute:
          token != null ? AppRoutes.bottomNavigationBar : AppRoutes.login,
      routes: routes,
    );
  }
}


// expense_screen edit
// 

//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDVjYjcwN2ZiMzEyMzlmMjA3YTYwMTgiLCJuYW1lIjoiYWxpIiwiaWF0IjoxNjg0MTE4NDMzLCJleHAiOjE2ODQyMDQ4MzN9.gCz_6u17Jj1Ma0bEXpJcIJmkGdeJZNMWxAPqxvfhODk

// af53cdabf1@fireboxmail.lol

//mohassen011@gmail.com
//123456@Aa

// sinajul.mudige@rungel.net

// sinajul.mudige@rungel.net

// mohassen011@gmail.com
// .
// kikew92415@in2reach.com
// 123456789@Aa
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDU0M2VmNmFlNzlmZTY0YTRhMDEwOTQiLCJuYW1lIjoiQWJkYWxsYWgiLCJpYXQiOjE2ODM4Mjg0NzYsImV4cCI6MTY4MzkxNDg3Nn0.YtrD2P11Lz6IsUA8MOC2Wr6neiZgqUBinxoof9fLMa0