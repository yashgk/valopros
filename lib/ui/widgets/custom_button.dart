import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';

class CustomButton extends StatelessWidget {
  final String? lable;
  final VoidCallback? onTap;
  const CustomButton({required this.lable, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth! * 0.4,
        height: SizeConfig.screenHeight! * 0.04,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.tomato,
        ),
        child: Center(
            child: Text(
          lable ?? "",
          style: AppStyles.blackSmall14,
        )),
      ),
    );
  }
}
