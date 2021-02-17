import 'package:flutter/material.dart';
import 'package:roboclub_flutter/widgets/appBar.dart';
import 'package:roboclub_flutter/widgets/contribution_card.dart';
import 'package:roboclub_flutter/widgets/drawer.dart';
import '../helper/dimensions.dart';

class ContributorScreen extends StatefulWidget {
  @override
  _ContributorScreenState createState() => _ContributorScreenState();
}

class _ContributorScreenState extends State<ContributorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var vpH = getViewportHeight(context);
    var vpW = getViewportWidth(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: appdrawer(context, page: "Contributors"),
        appBar: appBar(
          context,
          strTitle: "CONTRIBUTORS",
          isDrawer: true,
          isNotification: false,
          scaffoldKey: _scaffoldKey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
               Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  height: vpH * 0.28,
                  width: vpW * 0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[200],
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.75)
                      ),
                      ],
                    ),
                    child: Column( 
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Padding(padding: EdgeInsets.all(12.0),
                        child: Text("We are because of you!!", style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFF9C01),fontSize:vpH*0.028)),
                        ),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal:10.0),
                          child:Container(
                          height:vpH* 0.002,
                          width:vpW*2.0,
                          color:Color(0xFFFF9C01),),
                          ),
                        Row(children: [
                          Expanded(child: 
                            Padding(padding: EdgeInsets.symmetric(horizontal:vpW *0.028, vertical:vpH* 0.015),
                            child: Text("Thank you for all the people who contributed in making AMURoboclub what it is today.We couldn't have reached this place without your support.",style:TextStyle(fontWeight: FontWeight.bold,fontSize: vpH*0.018)),
                            ),
                            ),
                          Expanded(child: 
                            Padding(padding: EdgeInsets.all(5.0),
                            child:Image.asset('assets/img/contri.png'))
                          ),
                          ])   
                        ]),
                    
                  ),
                ),
              SizedBox(
                height: vpH * 0.005,
                
              ),
              Container(
                height: vpH *0.6,
                width: vpW,
                child: true
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ContriCard();
                        },  
                      )
                    : Center(
                        child: Text('No Contributions Yet'),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
