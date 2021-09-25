import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';

class CustomListTile extends StatelessWidget {
  final String value;
  final TextStyle textStyle;
  final VoidCallback onTap;
  const CustomListTile(
      {required this.onTap,
      required this.textStyle,
      required this.value,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.45,
      height: SizeConfig.screenHeight! * 0.03,
      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
      margin: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.tileBg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: textStyle,
          ),
          InkWell(onTap: onTap, child: Icon(Icons.remove))
        ],
      ),
    );
  }
}
