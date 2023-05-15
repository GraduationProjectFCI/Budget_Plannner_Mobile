import 'package:budget_planner_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class BuildCustomListExpenses extends StatelessWidget {
  // model

  BuildCustomListExpenses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColor.buttonColor,
      height: 400,
      // child: Column(
      // children: [
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          // color: Colors.white,
          height: 5,
          thickness: 1,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'label',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'value \$',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // Text('data'),
      // ],
      // ),
    );

    // return Container(
    //   // // color: AppColor.hintTextColor,
    //   height: 400,
    //   // child: Column(
    //   // children: [
    //   child: ListView.builder(
    //     // separatorBuilder: (context, index) => const Divider(),
    //     itemCount: countList ?? 30,
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Text(
    //               '$label',
    //               style: const TextStyle(
    //                   fontSize: 20, fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               '$value \$',
    //               style: const TextStyle(
    //                   fontSize: 20, fontWeight: FontWeight.bold),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    //   // Text('data'),
    //   // ],
    //   // ),
    // );
  }
}
