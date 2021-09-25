import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';

class CustomAppBar extends StatefulWidget {
  final String? title;
  final VoidCallback onTap;
  const CustomAppBar({required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title ?? "", style: AppStyles.blackNormal18),
      centerTitle: true,
      backgroundColor: AppColors.tomato,

      elevation: 0,
      leading: InkWell(
          onTap: widget.onTap,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
          )),
      shape: const RoundedRectangleBorder(
        
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
    );
  }
}
