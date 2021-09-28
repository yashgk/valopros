import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/screens/add_player.dart';
import 'package:valopros/ui/screens/add_team.dart';
import 'package:valopros/ui/screens/add_tournament.dart';
import 'package:valopros/ui/screens/edit_team.dart';
import 'package:valopros/ui/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> teamList = [];
  CollectionReference teams = FirebaseFirestore.instance.collection('Teams');
  void getTeams() async {
    await teams.get().then((value) async {
      for (int i = 0; i < value.docs.length; i++) {
        teamList.add(value.docs.elementAt(i).get('teamName'));
      }
    });
  }

  @override
  void initState() {
    getTeams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/bg1.jpg'),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('WELCOME ADMIN', style: AppStyles.whiteHeader36),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.1,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      lable: 'ADD PLAYER',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPlayer()));
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: SizeConfig.screenWidth! * 0.32,
                            child: CustomButton(
                              lable: 'ADD TEAM',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddTeam()));
                              },
                            )),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.04,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.1,
                          child: InkWell(
                            onTap: () {
                              getTeams();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: teamList.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              height: SizeConfig.screenHeight! *
                                                  0.05,
                                              width:
                                                  SizeConfig.screenWidth! * 0.4,
                                              color: AppColors.tomato,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditTeam(
                                                                teamName:
                                                                    teamList[
                                                                        index],
                                                              )));
                                                },
                                                child: Text(
                                                  teamList[index],
                                                  style: AppStyles.blackNormal18
                                                      .copyWith(
                                                          color:
                                                              AppColors.white),
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  });
                            },
                            child: Container(
                              width: SizeConfig.screenWidth! * 0.4,
                              height: SizeConfig.screenHeight! * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.tomato,
                              ),
                              child: const Center(
                                  child: Icon(
                                Icons.edit,
                                color: AppColors.black,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      lable: 'ADD TOURNAMENT',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTournament()));
                      },
                    ),
                    // CustomButton(
                    //   lable: 'UPDATE MATCH',
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => UpdateMatch()));
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
