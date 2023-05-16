import 'package:flutter/material.dart';

class StatisticsContainer extends StatelessWidget {
  StatisticsContainer({
    required this.label,
    required this.percentage,
    required this.money,
    super.key,
  });
  String? label;
  String percentage;
  String money;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            label!,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w300,
              height: 1,
              color: Color(0xff000000),
            ),
          ),
          Spacer(),
          Text(
            '${money} EGP ',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              height: 1,
              color: Colors.grey,
            ),
          ),
          Text(
            ' ${percentage} %',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w100,
              height: 1,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
