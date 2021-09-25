import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/widgets/custom_appbar.dart';
import 'package:valopros/ui/widgets/custom_container.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({Key? key}) : super(key: key);

  @override
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  TextEditingController ignCtrl = TextEditingController();
  TextEditingController playerNameCtrl = TextEditingController();
  String nationality = 'Nationality';
  String agent1 = 'Agent 1';
  String agent2 = 'Agent 2';
  List<String> nationalityList = [
    'India',
    'US',
    'Europe',
    'British',
    'Austrelia',
  ];
  List<String> agent1List = ['A', 'B', 'C', 'D', 'E'];
  List<String> agent2List = ['a', 'b', 'c', 'd', 'e'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'ADD PLAYER',
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
                    child: Image.asset(
                      'assets/images/userStock.png',
                    ),
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
            SizedBox(
              height: SizeConfig.screenHeight! * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(
                      width: SizeConfig.screenWidth! * 0.5,
                      child: TextField(
                        controller: ignCtrl,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'IGN',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      )),
                  CustomContainer(
                      width: SizeConfig.screenWidth! * 0.5,
                      child: DropdownButton<String>(
                        items: nationalityList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      )),
                  CustomContainer(
                      width: SizeConfig.screenWidth! * 0.5,
                      child: TextField(
                        controller: playerNameCtrl,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Player Name',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      )),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                            width: SizeConfig.screenWidth! * 0.2,
                            child: DropdownButton<String>(
                              items: agent1List.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            )),
                        CustomContainer(
                            width: SizeConfig.screenWidth! * 0.2,
                            child: DropdownButton<String>(
                              items: agent2List.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            )),
                      ],
                    ),
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
