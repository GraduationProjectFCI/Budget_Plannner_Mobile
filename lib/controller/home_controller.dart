import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/models/home_model.dart';
import 'package:budget_planner_app/models/limits_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/http_helper.dart';
import '../view/widgets/toast.dart';

class HomeController extends GetxController {
  RxBool state = true.obs;
  HomeModel? homeModel;
  Future<void> getHomeData() async {
    print('helllllo Home');
    state = false.obs;
    Http.getHomeData(
            endPoints: Endpoint.homeData,
            token: CacheHelper.prefs!.getString('token').toString())
        .then((value) {
      print('sucess');
      print('Home controllrer = $value');
      homeModel = HomeModel.fromJson(value);
      state = true.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
    });

    update();
  }

  bool flagGetLimit = true;
  RxBool state2 = true.obs;
  LimitsModel? limitsModel;
  Future<void> getLimitsData() async {
    print('helllllo getLimitsData');
    state2 = false.obs;
    Http.getHomeData(
            endPoints: Endpoint.limits,
            token: CacheHelper.prefs!.getString('token').toString())
        .then((value) async {
      print('sucess');
      print('limits controllrer = $value');
      limitsModel = await LimitsModel.fromJson(value);
      print(' @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n\n\n\n${limitsModel}');
      flagGetLimit = true;
      state2 = true.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
    });

    update();
  }

//delete

  RxBool deleteState = true.obs;
  Future<void> deleteLimit({required String limitUrl}) async {
    print('helllllo deleteLimit');
    deleteState = false.obs;
    WidgetsFlutterBinding.ensureInitialized();
    update();
    await Http.delete(
            url: '${Endpoint.limitsDelete}$limitUrl',
            token: CacheHelper.prefs?.getString('token'))
        .then(
      (value) async {
        print(value);
        if (value['msg'] == 'Limit Deleted Successfully') {
          await getLimitsData();
          toast(msg: '${value['msg']}', color: AppColor.buttonColor);
          deleteState = true.obs;
          WidgetsFlutterBinding.ensureInitialized();
          update();
        } else {
          toast(msg: '${value['msg']}');
          deleteState = true.obs;
          WidgetsFlutterBinding.ensureInitialized();
          update();
        }
      },
    );
    update();
  }

//update
  bool updateState = true;
  TextEditingController limitUpdateController = TextEditingController();
  Future<void> updateLimit({
    required String limitValue,
    required String limitUrl,
  }) async {
    print('helllllo updateLimit');
    WidgetsFlutterBinding.ensureInitialized();
    update();
    Http.updateData(
            endpoint: '${Endpoint.limitsDelete}/$limitUrl',
            map: {"limit": limitValue},
            token: CacheHelper.prefs?.getString('token'))
        .then(
      (value) async {
        print(value);
        if (value['msg'] == 'Limit Updated Successfully') {
          await getLimitsData();
          toast(msg: '${value['msg']}', color: AppColor.buttonColor);
          limitUpdateController.clear();
          updateState = true;
          WidgetsFlutterBinding.ensureInitialized();
          update();
        } else {
          toast(msg: '${value['msg']}');
          updateState = true;
          WidgetsFlutterBinding.ensureInitialized();
          update();
        }
      },
    );
    update();
  }

  @override
  void onInit() {
    getLimitsData();
    getHomeData();

    super.onInit();
  }

//post
  bool addstate = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController limitController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  addLimit() async {
    if (formKey.currentState!.validate()) {
      addstate = false;
      WidgetsFlutterBinding.ensureInitialized();
      update();
      Map<String, dynamic> map = {
        "label": limitController.text,
        "limit": valueController.text,
      };
      String? token = CacheHelper.prefs!.getString('token');
      Http.postData(
        endpoint: Endpoint.limits,
        map: map,
        token: token,
      ).then((value) async {
        valueController.clear();
        addstate = true;
        toast(msg: value['msg'].toString(), color: Colors.green);
        // getHomeData();
        update();
      });
    }
  }
}
