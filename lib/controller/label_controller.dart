import 'dart:convert';

import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/models/label_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';
import '../constants/endpoint.dart';
import '../helper/http_helper.dart';

class LabelController extends GetxController {
  late TextEditingController labelTextController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool state = true.obs;

  addLabel() async {
    print('helllllo label');

    if (formKey.currentState!.validate()) {
      state = false.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
      Http.postData(
              map: {'label': labelTextController.text},
              endpoint: Endpoint.labelDataPost,
              token: CacheHelper.prefs?.getString('token'))
          .then(
        (value) {
          print(value);
          if (value['msg'] == 'Label Added Successfully') {
            toast(msg: '${value['msg']}', color: AppColor.buttonColor);
            Constant.labelsList.add(value['data']['label']);
            labelTextController.clear();
            state = true.obs;
            WidgetsFlutterBinding.ensureInitialized();
            update();
          } else {
            toast(msg: '${value['msg']}');
            labelTextController.clear();
            state = true.obs;
            WidgetsFlutterBinding.ensureInitialized();
            update();
          }
        },
      );
      update();
    }
  }

  getLabels() async {
    print('helllllo get label');

    if (formKey.currentState!.validate()) {
      state = false.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
      Http.getData(
              url: Endpoint.labelData,
              token: CacheHelper.prefs?.getString('token'))
          .then(
        (value) async {
          print(value);

          if (value['data'].length > 0) {
            print('success!!');
            LabelModel labelModel = await LabelModel.fromJson(value);
            toast(msg: '${value['msg']}', color: AppColor.buttonColor);
            // for (var i = 0; i < labelModel.data!.length; i++) {
            //   Constant.labelsList.add(labelModel.data![i]);
            // }
            String labels = await jsonEncode(value);
            await CacheHelper.prefs?.setString('labels', labels);
            String? a = await CacheHelper.prefs?.getString('labels');
            Map<String, dynamic> labels1 = await jsonDecode(a!);
            LabelModel labelModel1 = await LabelModel.fromJson(labels1);
            print(labelModel1.data![0].label);
            // Constant.labelsList.add(labelModel1.data);
            // print(' ########## ${Constant.labelsList[0]}');
            state = true.obs;
            WidgetsFlutterBinding.ensureInitialized();
            update();
          } else {
            print('error');
            toast(msg: '${value['msg']}');
            state = true.obs;
            WidgetsFlutterBinding.ensureInitialized();
            update();
          }
        },
      );
      update();
    }
  }

  deleteLabel(String labelUrl) async {
    print('hello delete label ');

    if (formKey.currentState!.validate()) {
      state = false.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
      Http.delete(
              url: '${Endpoint.labelData}/$labelUrl',
              token: CacheHelper.prefs?.getString('token'))
          .then(
        (value) {
          print(value);
          if (value['msg'] == 'Labels Fetched Successfullyy') {
            toast(msg: '${value['msg']}', color: AppColor.buttonColor);
            state = true.obs;
            WidgetsFlutterBinding.ensureInitialized();
            update();
          } else {
            toast(msg: '${value['msg']}');
            state = true.obs;
            WidgetsFlutterBinding.ensureInitialized();
            update();
          }
        },
      );
      update();
    }
  }

  @override
  void onInit() {
    labelTextController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    labelTextController.dispose();
    super.dispose();
  }
}
