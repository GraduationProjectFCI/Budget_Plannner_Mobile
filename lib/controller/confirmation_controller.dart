import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/register_controller.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class ConfirmationController extends GetxController {
  late TextEditingController codeTextController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool state = true.obs;

  @override
  confirm() async {
    print('helllllo confirm');
    if (formKey.currentState!.validate()) {
      state = false.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
      await Http.confirmation(
        code: codeTextController.text,
      ).then((value) async {
        print('value form confirm controller $value');
        state = true.obs;
        if (value['token'] != null) {
          toast(msg: '${value['msg']}', color: Colors.green);
          goToBottonNavagation();
        } else {
          print('status=error');
          print(value);
          toast(msg: value['msg']);
        }
      });
      update();
    }
  }

  @override
  goToBottonNavagation() {
    Get.offNamed(AppRoutes.bottomNavigationBar);
  }

  @override
  void onInit() {
    codeTextController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    codeTextController.dispose();
    super.dispose();
  }
}
