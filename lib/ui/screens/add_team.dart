import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/widgets/custom_add_box.dart';
import 'package:valopros/ui/widgets/custom_appbar.dart';
import 'package:valopros/ui/widgets/custom_container.dart';
import 'package:valopros/ui/widgets/custom_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({Key? key}) : super(key: key);

  @override
  _AddTeamState createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  TextEditingController teamNameCtrl = TextEditingController();
  TextEditingController ownerCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();
  TextEditingController sponserCtrl = TextEditingController();
  String region = 'India';
  List<String> regionList = [
    'India',
    'US',
    'Europe',
    'Britain',
    'Australia',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'ADD TEAM',
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
                      style: AppStyles.blackNormal18
                          .copyWith(color: AppColors.text),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownButton<String>(
                          value: region,
                          isExpanded: true,
                          items: regionList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              region = val!;
                            });
                          },
                          hint: const Text("Nationality"),
                        ),
                      )),
                  CustomContainer(
                      width: SizeConfig.screenWidth! * 0.5,
                      child: TextField(
                        controller: countryCtrl,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Country',
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
                  )
                ],
              ),
            ),
            Container(
              height: SizeConfig.screenHeight! * 0.05,
              color: AppColors.tomato,
              child: Center(
                child: FlatButton(
                  onPressed: () {
                    Map<String, dynamic> data = {
                      "Team-Name": teamNameCtrl.text,
                      "Owner": ownerCtrl.text,
                      "Nationality" : region.toString(),

                      "Country": countryCtrl.text,
                      "Sponsers": sponserCtrl.text
                    };
                    FirebaseFirestore.instance.collection("ADD-TEAM").add(data);
                  },
                  child: const Text(
                    'SUBMIT',
                    style: AppStyles.blackNormal18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
