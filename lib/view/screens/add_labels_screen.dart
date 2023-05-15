import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/constant.dart';
import 'package:budget_planner_app/controller/label_controller.dart';
import 'package:budget_planner_app/functions/valid_input.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/custom_textformfield.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLabelsScreen extends StatelessWidget {
  AddLabelsScreen({super.key});
  LabelController controller = Get.put(LabelController());
  late MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    print('height ${(queryData.size.height) / 5}');
    print('width ${queryData.size.width}');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Constant.labelsList.length > 0 &&
              Constant.labelsList.length != null) {
            Get.offNamed(AppRoutes.bottomNavigationBar);
            toast(msg: 'Success!!', color: AppColor.buttonColor);
          } else {
            toast(msg: 'You must enter label!!');
          }
        },
        backgroundColor: AppColor.buttonColor,
        child: Text(
          '>',
          style: TextStyle(fontSize: 26),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'Add Label',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomTextFormField(
                  hintText: 'Enter label',
                  fieldType: TextInputType.name,
                  textController: controller.labelTextController,
                  validator: (value) {
                    return validInput(value!, 1, 20, '');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  textButton: 'Add',
                  onPressed: () async {
                    await controller.addLabel();
                  },
                ),
                GetBuilder<LabelController>(
                  builder: (controller) {
                    return Expanded(
                      child: SizedBox(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                            height: 5,
                            thickness: 0,
                          ),
                          itemCount: Constant.labelsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '${Constant.labelsList[index]}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
