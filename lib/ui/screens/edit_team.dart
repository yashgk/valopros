import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/widgets/custom_add_box.dart';
import 'package:valopros/ui/widgets/custom_appbar.dart';
import 'package:valopros/ui/widgets/custom_container.dart';
import 'package:valopros/ui/widgets/custom_list_tile.dart';

class EditTeam extends StatefulWidget {
  const EditTeam({Key? key}) : super(key: key);

  @override
  _EditTeamState createState() => _EditTeamState();
}

class _EditTeamState extends State<EditTeam> {
  TextEditingController teamNameCtrl = TextEditingController();
  TextEditingController ownerCtrl = TextEditingController();
  TextEditingController sponserCtrl = TextEditingController();
  List<String> regionList = [
    'India',
    'US',
    'Europe',
    'British',
    'Austrelia',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'EDIT TEAM',
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
                    child: Text(
                      'LOGO',
                      style: AppStyles.blackHeader24
                          .copyWith(color: AppColors.tomato.withRed(180)),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: SizeConfig.screenWidth! / 2.5,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.white),
                            child: const Icon(Icons.add)),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(
                      width: SizeConfig.screenWidth! * 0.5,
                      child: TextField(
                        controller: teamNameCtrl,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Team Name',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      )),
                  CustomContainer(
                      width: SizeConfig.screenWidth! * 0.5,
                      child: TextField(
                        controller: ownerCtrl,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Owner',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      )),
                  CustomContainer(
                      width: SizeConfig.screenWidth! * 0.5,
                      child: TextField(
                        controller: sponserCtrl,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Sponsers',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      )),
                  CustomeAddBox(
                    onTap: () {},
                    lable: Text(
                      'Players',
                      style: AppStyles.blackSmall14
                          .copyWith(color: AppColors.tomato),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: regionList.length,
                      itemBuilder: (context, index) => CustomListTile(
                          onTap: () {},
                          textStyle: AppStyles.blackSmall14,
                          value: regionList[index]),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.1,
                  )
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
