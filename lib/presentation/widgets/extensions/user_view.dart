import 'package:flutter/material.dart';
import '../../../config/theme.dart';
import '../../../data/model/userData.dart';

extension View on UserData {
  Widget getListView(
      {@required BuildContext context,}
      )
  {
     return
       Stack(
         alignment: Alignment.center,
         children: <Widget>[
           Padding(
             padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.075),
             child: Container(
               width: MediaQuery.of(context).size.width * 0.675,
               height: MediaQuery.of(context).size.width * 0.22,

               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(40) ,
                   bottomLeft: Radius.circular(40) ,
                 ),
                 boxShadow: [
                   BoxShadow(
                     color: AppColors.colorPrimaryDark,
                     offset: Offset(0.0, 1.0), //(x,y)
                     blurRadius: 6.0,
                   ),
                 ],
               ),
               child:Align(
                 alignment: Alignment.center,
                 child:Text(first_name + " " + last_name, textAlign: TextAlign.center, style: TextStyle(fontSize: 15,
                     fontFamily: 'Iransans',
                     color: AppColors.colorPrimaryDark),
                 ),
               ),
             ),
           ),
           Align(
             alignment: Alignment.centerRight,
             child:
             Card(
                 elevation: 4,
                 clipBehavior: Clip.antiAlias,
                 shape: CircleBorder(side: BorderSide(color: AppColors.colorPrimaryBack, width: 5)),
                 child:
                 Image.network(avatar,
                   fit: BoxFit.scaleDown,
                   width: MediaQuery.of(context).size.width * 0.25,
                   height: MediaQuery.of(context).size.width * 0.25,
                 )
             ),
           ),
         ],
       );
  }

}