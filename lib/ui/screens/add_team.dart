import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool isLoading = false;
  TextEditingController teamNameCtrl = TextEditingController();
  TextEditingController ownerCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();
  TextEditingController sponserCtrl = TextEditingController();
  List<String> sPlayers = [];
  List<String> selectedPlayers = [];
  String region = 'Asia';
  List<String> regionList = [
    'Asia',
    'North America',
    'South America',
    'Europe',
    'Africa',
    'Australia'
  ];

  CollectionReference players =
      FirebaseFirestore.instance.collection('Players');

  CollectionReference teams = FirebaseFirestore.instance.collection('Teams');
  void getPlayers() async {
    setState(() {
      isLoading = true;
    });
    await players.get().then((value) async {
      for (int i = 0; i < value.docs.length; i++) {
        sPlayers.add(value.docs.elementAt(i).get('playerName'));
      }
    });
    setState(() {
      isLoading = false;
    });
    print(sPlayers);
  }

  @override
  void initState() {
    getPlayers();
    super.initState();
  }

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
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.screenHeight! * 0.05),
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
                                      shape: BoxShape.circle,
                                      color: AppColors.white),
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
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: sPlayers.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height:
                                                SizeConfig.screenHeight! * 0.05,
                                            width:
                                                SizeConfig.screenWidth! * 0.4,
                                            color: AppColors.tomato,
                                            child: InkWell(
                                              onTap: () {
                                                selectedPlayers
                                                    .add(sPlayers[index]);
                                                sPlayers
                                                    .remove(sPlayers[index]);
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                sPlayers[index],
                                                style: AppStyles.blackNormal18
                                                    .copyWith(
                                                        color: AppColors.white),
                                              ),
                                            ),
                                          );
                                        }),
                                  );
                                });
                          },
                          lable: Text(
                            'Players',
                            style: AppStyles.blackSmall14
                                .copyWith(color: AppColors.tomato),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: selectedPlayers.length,
                            itemBuilder: (context, index) => CustomListTile(
                                onTap: () {
                                  setState(() {
                                    sPlayers.add(selectedPlayers[index]);
                                    selectedPlayers
                                        .remove(selectedPlayers[index]);
                                  });
                                },
                                textStyle: AppStyles.blackSmall14,
                                value: selectedPlayers[index]),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await teams
                          .where('teamName', isEqualTo: teamNameCtrl.text)
                          .get()
                          .then((value) async {
                        if (value.size == 0) {
                          await teams.add({
                            'teamName': teamNameCtrl.text,
                            'owner': ownerCtrl.text,
                            'region': region,
                            'country': countryCtrl.text,
                            'sponser': sponserCtrl.text,
                            'players': selectedPlayers
                          }).then((value) {
                            setState(() {
                              isLoading = false;
                              Navigator.pop(context);
                            });
                          });
                        }
                      });
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Container(
                      height: SizeConfig.screenHeight! * 0.05,
                      color: AppColors.tomato,
                      child: const Center(
                        child: Text(
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
