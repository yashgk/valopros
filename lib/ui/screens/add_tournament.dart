import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/widgets/custom_add_box.dart';
import 'package:valopros/ui/widgets/custom_appbar.dart';
import 'package:valopros/ui/widgets/custom_container.dart';
import 'package:valopros/ui/widgets/custom_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTournament extends StatefulWidget {
  const AddTournament({Key? key}) : super(key: key);

  @override
  _AddTournamentState createState() => _AddTournamentState();
}

class _AddTournamentState extends State<AddTournament> {
  TextEditingController tournamentCtrl = TextEditingController();
  TextEditingController prizeCtrl = TextEditingController();
  TextEditingController sponserCtrl = TextEditingController();
  String region = 'India';
  List<String> regionList = [
    'India',
    'US',
    'Europe',
    'British',
    'Australia',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'ADD TOURNAMENT',
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
            Container(
              height: SizeConfig.screenHeight! * 0.2,
              width: SizeConfig.screenWidth!,
              color: AppColors.background,
              child: Stack(
                children: [
                  Center(
                    child: Text('BANNER',
                        style: AppStyles.header48.copyWith(
                            color: AppColors.tomato.withOpacity(0.5))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.white),
                            child: const Icon(Icons.add_circle_outline)),
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
                        controller: tournamentCtrl,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Tournament Name',
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
                        controller: prizeCtrl,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Prize Pool',
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
                  Container(
                      padding: const EdgeInsets.only(left: 15),
                      width: SizeConfig.screenWidth! * 0.5,
                      height: SizeConfig.screenHeight! * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Team',
                            style: AppStyles.blackSmall14
                                .copyWith(color: AppColors.tomato),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.33,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(
                                      Icons.remove,
                                      color: AppColors.white,
                                    )),
                                CustomContainer(
                                    width: SizeConfig.screenWidth! * 0.08,
                                    child: const Center(child: Text('18'))),
                                IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(
                                      Icons.add,
                                      color: AppColors.white,
                                    )),
                              ],
                            ),
                          )
                        ],
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
                    lable: const Text(
                      'Add Teams',
                      style: AppStyles.blackSmall14,
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
              child:  Center(
                child: FlatButton(
                  onPressed: () {
                    Map<String, dynamic> data = {
                      "Tourname-Name": tournamentCtrl.text,
                      "Prize-Pool": prizeCtrl.text,
                      "Country": region.toString(),
                      "Sponsers": sponserCtrl.text
                    };
                    FirebaseFirestore.instance.collection("ADD-TOURNAMENT").add(data);
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
