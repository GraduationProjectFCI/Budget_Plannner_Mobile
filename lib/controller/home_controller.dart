import 'package:get/get.dart';

import '../helper/http_helper.dart';

class HomeController extends GetxController {
  // late TextEditingController codeTextController;

  // GlobalKey<FormState> formKey = GlobalKey<FormState>();

  test() async {
    print('helllllo Home');
    var res = await Http.getHomeData(
        id: '64543ef6ae79fe64a4a01094',
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDU0M2VmNmFlNzlmZTY0YTRhMDEwOTQiLCJuYW1lIjoiQWJkYWxsYWgiLCJpYXQiOjE2ODM0MDU4OTMsImV4cCI6MTY4MzQ5MjI5M30.KQZCbO7x0rPILe5khiav2LnLGi8-SdBiBHCimZnmyK8');

    print('Home controllrer = $res');
    // update();
  }
}
