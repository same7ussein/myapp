import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget
{
@override
  Widget build(BuildContext context)
{
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      leading:Icon(
        Icons.menu,
      ),
        title:Text('first app'
        ),
        actions: [
          IconButton(onPressed: (){
            print('notifcations clicked');
          }, icon:Icon(
            Icons.notifications,

          )),
          IconButton(onPressed:(){
            print('search clicked');
          }, icon: Icon(
            Icons.search,

          ))

        ],
      ),
      body:Container(
        width:double.infinity,
        color: Colors.white,
        child: Column(

          children: [

            Image(image:NetworkImage(
                'https://i.pinimg.com/736x/4d/9d/65/4d9d6520c060af9487f73fdc83c27ee2.jpg',
            ),
            ),
          ],
        ),

      ) ,
    );
}

}