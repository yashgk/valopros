import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/sizeconfig.dart';

class CustomeAddBox extends StatelessWidget {
  final Widget lable;
  final Widget child;
  final VoidCallback onTap;
  const CustomeAddBox(
      {required this.onTap, required this.lable, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                lable,
                InkWell(
                  onTap: onTap,
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
            height: SizeConfig.screenHeight! * 0.12,
            width: SizeConfig.screenWidth! * 0.5,
            child: child,
          ),
        ],
      ),
    );
  }
}
