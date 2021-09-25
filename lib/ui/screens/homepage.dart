import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/screens/add_player.dart';
import 'package:valopros/ui/screens/add_team.dart';
import 'package:valopros/ui/screens/add_tournament.dart';
import 'package:valopros/ui/screens/update_match.dart';
import 'package:valopros/ui/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                height: SizeConfig.screenHeight! * 0.4,
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
                            width: SizeConfig.screenWidth! * 0.28,
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
                          width: SizeConfig.screenWidth! * 0.02,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.1,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: SizeConfig.screenWidth! * 0.4,
                              height: SizeConfig.screenHeight! * 0.04,
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
                    CustomButton(
                      lable: 'ADD TEAM',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddTeam()));
                      },
                    ),
                    CustomButton(
                      lable: 'UPDATE MATCH',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateMatch()));
                      },
                    ),
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
