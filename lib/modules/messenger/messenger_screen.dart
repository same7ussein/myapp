import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.00,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.00,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/4d/9d/65/4d9d6520c060af9487f73fdc83c27ee2.jpg'),
            ),
            SizedBox(
              width: 15.00,
            ),
            Text(
              'chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.00,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
        actions: [
          IconButton(onPressed: () {},
            icon: CircleAvatar(
              radius: 20.00,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 20.00,
                color: Colors.white,

              ),
            ),),
          IconButton(onPressed: () {},
            icon: CircleAvatar(
              radius: 20.00,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 20.00,
                color: Colors.white,

              ),
            ),),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: (
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      children:
                      [
                        Icon(
                            Icons.search
                        ),
                        Text('Search'),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.00,
                ),
                Container(
                  height: 100.00,
                  child: ListView.separated
                    (shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index)=> BuildStoryItem(),
                       separatorBuilder: (context, index)=> SizedBox(
                         width: 20.00,
                       ),
                    itemCount: 10,

                  ),
                ),
                SizedBox(
                  height: 20.00,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                      itemBuilder: (context, index)=> BuildChatItem(),
                      separatorBuilder: (context, index)=> SizedBox(
                        height: 20.00,
                      ),
                      itemCount: 20,

                  ),
              ],

          )
    ),
        ),

    ),
    );
  }

  Widget BuildChatItem() => Row(
        children:
        [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.00,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/4d/9d/65/4d9d6520c060af9487f73fdc83c27ee2.jpg'),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  top: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
          SizedBox(
            width: 8.0,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(
                  'Sameh Hussien ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.00,
                    fontWeight: FontWeight.bold,

                  ),),
                SizedBox(
                  height: 7.0,
                ),
                Row(
                  children:
                  [

                    Expanded(
                      child: (
                          Text(
                            'hello my name is sameh hussien ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text('02.00 pm'),

                  ],
                ),


              ],
            ),
          ),
        ],
      );

  Widget BuildStoryItem() => Container(
        width: 60.00,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.00,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/4d/9d/65/4d9d6520c060af9487f73fdc83c27ee2.jpg'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    top: 3.0,
                  ),
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.red,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Sameh Hussien ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,

              ),
            ),
          ],
        ),
      );
}
