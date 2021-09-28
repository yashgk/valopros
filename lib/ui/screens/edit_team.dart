import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/widgets/custom_add_box.dart';
import 'package:valopros/ui/widgets/custom_appbar.dart';
import 'package:valopros/ui/widgets/custom_container.dart';
import 'package:valopros/ui/widgets/custom_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditTeam extends StatefulWidget {
  final String teamName;
  const EditTeam({required this.teamName, Key? key}) : super(key: key);

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
  List<dynamic> memberList = [];
  List<dynamic> playersList = [];
  bool isLoading = false;
  CollectionReference teams = FirebaseFirestore.instance.collection('Teams');
  CollectionReference players =
      FirebaseFirestore.instance.collection('Players');
  getDetails() async {
    setState(() {
      isLoading = true;
    });
    await teams
        .where('teamName', isEqualTo: widget.teamName)
        .get()
        .then((value) async {
      teamNameCtrl.text = value.docs.elementAt(0).get('teamName') ?? "";
      ownerCtrl.text = value.docs.elementAt(0).get('owner') ?? "";
      sponserCtrl.text = value.docs.elementAt(0).get('sponser') ?? "";
      memberList = value.docs.elementAt(0).get('players');
    });
    await players.get().then((value) async {
      for (int i = 0; i < value.docs.length; i++) {
        if (!memberList.contains(value.docs.elementAt(i).get('playerName'))) {
          playersList.add(value.docs.elementAt(i).get('playerName'));
        }
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getDetails();
    super.initState();
  }

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
                                        itemCount: playersList.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height:
                                                SizeConfig.screenHeight! * 0.05,
                                            width:
                                                SizeConfig.screenWidth! * 0.4,
                                            color: AppColors.tomato,
                                            child: InkWell(
                                              onTap: () {
                                                memberList
                                                    .add(playersList[index]);
                                                playersList
                                                    .remove(playersList[index]);
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                playersList[index],
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
                            itemCount: memberList.length,
                            itemBuilder: (context, index) => CustomListTile(
                                onTap: () {
                                  setState(() {
                                    playersList.add(memberList[index]);
                                    memberList.remove(memberList[index]);
                                  });
                                },
                                textStyle: AppStyles.blackSmall14,
                                value: memberList[index]),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.1,
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
                          .where('teamName', isEqualTo: widget.teamName)
                          .get()
                          .then((value) async {
                        var docId = value.docs.elementAt(0).id;
                        await teams.doc(docId).update({
                          'teamName': teamNameCtrl.text,
                          'owner': ownerCtrl.text,
                          'sponser': sponserCtrl.text,
                          'players': memberList,
                        }).then((value) => Navigator.pop(context));
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
