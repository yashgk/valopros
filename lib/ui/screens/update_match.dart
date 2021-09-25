import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/widgets/custom_appbar.dart';

class UpdateMatch extends StatefulWidget {
  const UpdateMatch({Key? key}) : super(key: key);

  @override
  _UpdateMatchState createState() => _UpdateMatchState();
}

class _UpdateMatchState extends State<UpdateMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'UPDATE MATCH',
        ),
        preferredSize: Size.fromHeight(SizeConfig.screenHeight! * 0.06),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/images/bg1.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.05),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.tomato,
                    radius: SizeConfig.screenHeight! * 0.07,
                  ),
                  Positioned(
                      bottom: 0,
                      right: SizeConfig.screenWidth! / 2.5,
                      child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.white),
                          child: const Icon(Icons.add)))
                ],
              ),
            ),
            Container(
              height: SizeConfig.screenHeight! * 0.05,
              color: AppColors.tomato,
              child: const Center(
                child: Text(
                  'SUBMIT',
                  style: AppStyles.blackNormal18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
