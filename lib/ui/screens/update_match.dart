import 'package:flutter/material.dart';
import 'package:valopros/core/constant/app_colors.dart';
import 'package:valopros/core/constant/app_style.dart';
import 'package:valopros/core/constant/sizeconfig.dart';
import 'package:valopros/ui/widgets/custom_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateMatch extends StatefulWidget {
  const UpdateMatch({Key? key}) : super(key: key);

  @override
  _UpdateMatchState createState() => _UpdateMatchState();
}

class _UpdateMatchState extends State<UpdateMatch> {
  bool isLoading = false;
  String tournament = '';
  List<String> tournamentList = [];
  List<dynamic> teamList = [];
  CollectionReference tournaments =
      FirebaseFirestore.instance.collection('Tournaments');
  CollectionReference teams = FirebaseFirestore.instance.collection('Teams');
  CollectionReference players =
      FirebaseFirestore.instance.collection('Players');
  String teama = '';
  String teamb = '';
  List teamAMembers = [];
  List teamBMembers = [];
  TextEditingController totalA = TextEditingController();
  TextEditingController totalB = TextEditingController();
  List<List<TextEditingController>> list = [];
  List<List<TextEditingController>> listB = [];
  Future fetchTournament() async {
    setState(() {
      isLoading = true;
    });
    await tournaments.get().then((value) async {
      for (int i = 0; i < value.size; i++) {
        tournamentList.add(value.docs.elementAt(i).get('tournamentName'));
      }
    });
    tournament = tournamentList[0];
    getTeams(tournament);
    setState(() {
      isLoading = false;
    });
  }

  void getTeams(String tournamentName) async {
    setState(() {
      isLoading = true;
    });
    await tournaments
        .where('tournamentName', isEqualTo: tournamentName)
        .get()
        .then((value) async {
      teamList = value.docs.elementAt(0).get('teams');
    });
    teama = teamList[0] ?? 'no teams';
    teamb = teamList[1] ?? 'no teams';
    setState(() {
      isLoading = false;
    });
  }

  Future getTeamMembers(String teamAName, String teamBName) async {
    setState(() {
      isLoading = true;
    });
    await teams.where('teamName', isEqualTo: teamAName).get().then((val) async {
      teamAMembers = val.docs.elementAt(0).get('players');
    });
    await teams.where('teamName', isEqualTo: teamBName).get().then((val) async {
      teamBMembers = val.docs.elementAt(0).get('players');
    });
    getTextFields();

    setState(() {
      isLoading = false;
    });
  }

  void getTextFields() {
    for (int i = 0; i < teamAMembers.length; i++) {
      List<TextEditingController> pname = [];
      var name_k = TextEditingController();
      var name_d = TextEditingController();
      var name_a = TextEditingController();
      var name_acs = TextEditingController();
      pname.addAll([name_k, name_d, name_a, name_acs]);
      list.add(pname);
    }
    for (int i = 0; i < teamBMembers.length; i++) {
      List<TextEditingController> pname = [];
      var name_k = TextEditingController();
      var name_d = TextEditingController();
      var name_a = TextEditingController();
      var name_acs = TextEditingController();
      pname.addAll([name_k, name_d, name_a, name_acs]);
      listB.add(pname);
    }
  }

  @override
  void initState() {
    fetchTournament();
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
          title: 'UPDATE MATCH',
        ),
        preferredSize: Size.fromHeight(SizeConfig.screenHeight! * 0.06),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                height: SizeConfig.screenHeight!,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/bg2.jpg'))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: AppColors.white,
                      width: SizeConfig.screenWidth! * 0.8,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: tournament,
                        items: tournamentList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            tournament = val!;
                            getTeams(tournament);
                          });
                        },
                        hint: const Text("Select Tournament"),
                      ),
                    ),
                    Container(
                      color: AppColors.white,
                      width: SizeConfig.screenWidth! * 0.8,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<dynamic>(
                        isExpanded: true,
                        value: teama,
                        items: teamList.map((dynamic value) {
                          return DropdownMenuItem<dynamic>(
                            value: value.toString(),
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            teama = val!;
                          });
                        },
                        hint: const Text("Select Team A"),
                      ),
                    ),
                    Container(
                      color: AppColors.white,
                      width: SizeConfig.screenWidth! * 0.8,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<dynamic>(
                        isExpanded: true,
                        value: teamb,
                        items: teamList.map((dynamic value) {
                          return DropdownMenuItem<dynamic>(
                            value: value.toString(),
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            teamb = val!;
                          });
                        },
                        hint: const Text("Select Team A"),
                      ),
                    ),
                    InkWell(
                      onTap: () => getTeamMembers(teama, teamb),
                      child: Container(
                        width: SizeConfig.screenWidth! * 0.15,
                        height: SizeConfig.screenHeight! * 0.05,
                        color: AppColors.white,
                        child: Center(
                            child: Text(
                          'Ok',
                          style: AppStyles.blackNormal18,
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.screenHeight! * 0.0001),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: ExpansionTile(
                        childrenPadding: EdgeInsets.all(10),
                        initiallyExpanded: false,
                        backgroundColor: Colors.green,
                        collapsedBackgroundColor: Colors.green,
                        title: Text(
                          teama,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 21),
                        ),
                        children: <Widget>[
                          Container(
                            color: Colors.green.shade200,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Player',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'Agent',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'Kills/Deaths/Assist',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'ACS',
                                  style: AppStyles.blackSmall14,
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: teamAMembers.length,
                              itemBuilder: (context, index) {
                                var name = teamAMembers[index].toString();
                                return Container(
                                  color: AppColors.tomato,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          teamAMembers[index],
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          'Boro',
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Row(
                                          children: [
                                            Container(
                                                color: AppColors.white,
                                                width: 20,
                                                height: 20,
                                                child: TextField(
                                                  controller: list[index][0],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    isCollapsed: true,
                                                    fillColor: AppColors.white,
                                                    focusColor: AppColors.white,
                                                    hoverColor: AppColors.white,
                                                  ),
                                                )),
                                            Text('/'),
                                            Container(
                                                color: AppColors.white,
                                                width: 20,
                                                height: 20,
                                                child: TextField(
                                                  controller: list[index][1],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    isCollapsed: true,
                                                    fillColor: AppColors.white,
                                                    focusColor: AppColors.white,
                                                    hoverColor: AppColors.white,
                                                  ),
                                                )),
                                            Text('/'),
                                            Container(
                                                color: AppColors.white,
                                                width: 20,
                                                height: 20,
                                                child: TextField(
                                                  controller: list[index][2],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    isCollapsed: true,
                                                    fillColor: AppColors.white,
                                                    focusColor: AppColors.white,
                                                    hoverColor: AppColors.white,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          color: AppColors.white,
                                          width: 30,
                                          height: 20,
                                          child: TextField(
                                            controller: list[index][3],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              fillColor: AppColors.white,
                                              focusColor: AppColors.white,
                                              hoverColor: AppColors.white,
                                            ),
                                          )),
                                    ],
                                  ),
                                );
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Total Score',
                                style: AppStyles.blackSmall14,
                              ),
                              SizedBox(
                                width: 50,
                                child: Container(
                                    color: AppColors.white,
                                    height: 20,
                                    child: TextField(
                                      controller: totalA,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        isCollapsed: true,
                                        fillColor: AppColors.white,
                                        focusColor: AppColors.white,
                                        hoverColor: AppColors.white,
                                      ),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: ExpansionTile(
                        childrenPadding: EdgeInsets.all(10),
                        initiallyExpanded: false,
                        backgroundColor: Colors.green,
                        collapsedBackgroundColor: Colors.green,
                        title: Text(
                          teamb,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 21),
                        ),
                        children: <Widget>[
                          Container(
                            color: Colors.green.shade200,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Player',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'Agent',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'Kills/Deaths/Assist',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'ACS',
                                  style: AppStyles.blackSmall14,
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: teamBMembers.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  color: AppColors.tomato,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          teamBMembers[index],
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          'Boro',
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Row(
                                          children: [
                                            Container(
                                                color: AppColors.white,
                                                width: 20,
                                                height: 20,
                                                child: TextField(
                                                  controller: listB[index][0],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    isCollapsed: true,
                                                    fillColor: AppColors.white,
                                                    focusColor: AppColors.white,
                                                    hoverColor: AppColors.white,
                                                  ),
                                                )),
                                            Text('/'),
                                            Container(
                                                color: AppColors.white,
                                                width: 20,
                                                height: 20,
                                                child: TextField(
                                                  controller: listB[index][1],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    isCollapsed: true,
                                                    fillColor: AppColors.white,
                                                    focusColor: AppColors.white,
                                                    hoverColor: AppColors.white,
                                                  ),
                                                )),
                                            Text('/'),
                                            Container(
                                                color: AppColors.white,
                                                width: 20,
                                                height: 20,
                                                child: TextField(
                                                  controller: listB[index][2],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    isCollapsed: true,
                                                    fillColor: AppColors.white,
                                                    focusColor: AppColors.white,
                                                    hoverColor: AppColors.white,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          color: AppColors.white,
                                          width: 30,
                                          height: 20,
                                          child: TextField(
                                            controller: listB[index][3],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              fillColor: AppColors.white,
                                              focusColor: AppColors.white,
                                              hoverColor: AppColors.white,
                                            ),
                                          )),
                                    ],
                                  ),
                                );
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Total Score',
                                style: AppStyles.blackSmall14,
                              ),
                              SizedBox(
                                width: 50,
                                child: Container(
                                    color: AppColors.white,
                                    height: 20,
                                    child: TextField(
                                      controller: totalB,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        isCollapsed: true,
                                        fillColor: AppColors.white,
                                        focusColor: AppColors.white,
                                        hoverColor: AppColors.white,
                                      ),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        for (int i = 0; i < list.length; i++) {
                          await players
                              .where('playerName', isEqualTo: teamAMembers[i])
                              .get()
                              .then((value) async {
                            var docID = value.docs.elementAt(0).id;
                            await players.doc(docID).update({
                              'kills': list[i][0].text,
                              'deaths': list[i][1].text,
                              'assists': list[i][2].text,
                              'acs': list[i][3].text
                            });
                          });
                        }
                        // for (int i = 0; i < listB.length; i++) {
                        //   for (int j = 0; j < listB[i].length; j++) {
                        //     print(listB[i][j].text);
                        //   }
                        // }
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
