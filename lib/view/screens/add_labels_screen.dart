import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/constant.dart';
import 'package:budget_planner_app/controller/label_controller.dart';
import 'package:budget_planner_app/functions/valid_input.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/custom_textformfield.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDeleteLabelsScreen extends StatelessWidget {
  AddDeleteLabelsScreen({super.key});
  LabelController controller = Get.put(LabelController());
  late MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    CacheHelper.testSharedPreferences();
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
        child: const Text(
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
                ConditionalBuilder(
                  condition: controller.state.isTrue,
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (context) => CustomButton(
                    textButton: 'Add',
                    onPressed: () async {
                      // await controller.addLabel();
                      await controller.getLabels();
                    },
                  ),
                ),
                GetBuilder<LabelController>(
                  builder: (controller) {
                    return Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: Constant.labelsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  shadowColor: AppColor.buttonColor,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '   ${Constant.labelsList[index]}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      IconButton(
                                          // delete
                                          onPressed: () async {
                                            //

                                            //  await   controller.deleteLabel();
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ],
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
