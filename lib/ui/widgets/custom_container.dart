import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/sizeconfig.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double width;
  const CustomContainer({required this.width, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: SizeConfig.screenHeight! * 0.05,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.background,
      ),
      child: child,
    );
  }
}
