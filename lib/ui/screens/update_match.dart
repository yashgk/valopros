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
  String tnt = 'Tournament';
  final List<String> tournamentList = ['Add-Player', 'Add-Team'];
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
                fit: BoxFit.cover, image: AssetImage('assets/images/bg2.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.screenHeight! * 0.01),
                ),
                 const ClipRRect(
                   borderRadius: BorderRadius.all(Radius.circular(20)),

                  child: Card(
                    child: ExpansionTile(
                      leading: Icon(Icons.laptop),
                      // backgroundColor: Colors.red,
                      //collapsedBackgroundColor: Colors.yellow,
                      title: Text(
                        'Tournament',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.normal),
                      ),
                      children: <Widget>[
                        Text('Tournament-1'),
                        Text('Tournament-2'),
                        Text('Tournament-3'),

                      ],

                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.screenHeight! * 0.02),
                ),

                select_team,
                const ClipRRect(

                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Card(
                    child: ExpansionTile(
                      leading: Icon(Icons.supervised_user_circle),
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: Colors.lightGreen,
                      title: Text(
                        '-Team 1-',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 21),
                      ),
                      children: <Widget>[
                        Text('Select Team-1', textAlign: TextAlign.left,),
                        Text('Select Team-2'),
                        Text('Select Team-3'),
                      ],
                    ),
                  ),
                ),
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Card(
                    child: ExpansionTile(
                      leading: Icon(Icons.supervised_user_circle),
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: Colors.lightGreen,
                      title: Text(
                        '-Team 2-',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 21),
                      ),
                      children: <Widget>[
                        Text('Select Team-1', textAlign: TextAlign.left,),
                        Text('Select Team-2'),
                        Text('Select Team-3'),
                      ],
                    ),
                  ),
                ),
                IconButton(onPressed:  () => {}, icon: const Icon(Icons.check_box, color: Colors.blue,),),
                Padding(
                  padding:
                  EdgeInsets.only(top: SizeConfig.screenHeight! * 0.0001),
                ),


                 ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Card(
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      backgroundColor: Colors.grey,
                      collapsedBackgroundColor: Colors.blueAccent,
                      title: const Text(
                        '-Global E-Sports-',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 21),
                      ),
                      children: <Widget>[

                  Container(
                    padding: EdgeInsets.all(10),
                    child:Table(
                      border: TableBorder.all(width:1.5, color:Colors.pinkAccent), //table border
                      children: const [

                        TableRow(
                            children: [
                              TableCell(child: Text("Player")),
                              TableCell(child: Text("Agent")),
                              TableCell(child: Text("Kills/Death/Assists")),
                              TableCell(child: Text("ACS"))
                            ]
                        ),

                        TableRow(
                            children: [
                              TableCell(child: Text("sk Rossi.")),
                              TableCell(child: Text("Krishna Karki")),
                              TableCell(child: Text("3, 40, 20")),
                              TableCell(child: Text("2000"))
                            ]
                        ),

                        TableRow(
                            children: [
                              TableCell(child: Text("Kill Joy.")),
                              TableCell(child: Text("John Wick")),
                              TableCell(child: Text("30,60,99")),
                              TableCell(child: Text("1000"))
                            ]
                        ),

                        TableRow(
                            children: [
                              TableCell(child: Text("Michael")),
                              TableCell(child: Text("Fedrick May")),
                              TableCell(child: Text("22,11,65")),
                              TableCell(child: Text("500"))
                            ]
                        ),

                      ],)
                  )],
                    ),
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
                ),




              ],

            ),
          ],

        ),

      ),
    );


  }
  var phoneNumber =  
  
  Row(
    mainAxisSize: MainAxisSize.min,
    children: const <Widget>[
      SizedBox(
        width: 30,
      ),
       Padding(
            padding: EdgeInsets.all(10),
            child: Text("hello", textAlign: TextAlign.left,),
          ),


      Padding(
        padding: EdgeInsets.all(10),
          child: Text("okay", textAlign: TextAlign.right,),
        ),

    ],
  );

  var select_team =  RichText(
    text:  const TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style:  TextStyle(
        fontSize: 30.0,
        color: Colors.red,
      ),
      children: <TextSpan>[
         TextSpan(text: 'Select'),
         TextSpan(text: 'Teams', style:  TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );

}
