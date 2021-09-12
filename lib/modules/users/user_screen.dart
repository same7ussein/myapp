import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/user/user_model.dart';
class UserScreen extends StatelessWidget {
   List<usermodel>users=[
    usermodel(
         id:1,
         name:'sameh',
         phone:'01205716153',

        ),
     usermodel(
       id:1,
       name:'ahmed',
       phone:'01205716153',
     ),
     usermodel(
       id:1,
       name:'mohamed',
       phone:'01205716153',
     ),
     usermodel(
       id:1,
       name:'ali',
       phone:'01205716153',
     ),
     usermodel(
       id:1,
       name:'abdo',
       phone:'01205716153',
     ),
     usermodel(
       id:1,
       name:'yara',
       phone:'01205716153',
     ),
     usermodel(
       id:1,
       name:'alaa',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'sameh',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'ahmed',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'mohamed',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'ali',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'abdo',
       phone:'01205716153',
     ),
     usermodel(
       id:1,
       name:'yara',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'alaa',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'sameh',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'ahmed',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'mohamed',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'ali',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'abdo',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'yara',
       phone:'01205716153',

     ),
     usermodel(
       id:1,
       name:'alaa',
       phone:'01205716153',

     ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user'
        ),
      ),
      body:ListView.separated(
          itemBuilder: (context,index)=>BuildUserItem(users[index]),
          separatorBuilder:(context,index)=>Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.00
            ),
            child: Container(
              width:double.infinity,
              height: 1.0,
              color:Colors.grey[300],
            ),
          ),
          itemCount:users.length),

    );
  }
  Widget BuildUserItem(usermodel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.00,
          child:Text('${user.id}'
            ,style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 25.00,
            ),),
        ),
        SizedBox(
          width: 20.00,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${user.name}'
              ,style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 25.00,
              ),),
            Text('${user.phone}'
              ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
              ),),
          ],
        )
      ],
    ),
  );
}
