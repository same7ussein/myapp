import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/cubit/cubit.dart';

Future<Widget> defaultButton(
    {
      required  double width,
      required  background,
      required  text,
      required  function,
    }
    ) async =>Container(
  color:background,
  width:width,
  child: MaterialButton(onPressed:function,
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 25.00,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
Widget defaultFormField(
{
  required controller,
  required  type,
  onSubmitt,
  onChange,
  onTap,
  bool isclickable= true,
  bool isPassword=false,
  required validate,
  required label,
  required prefix,
  suffix,
  suffixpressed,
}
)=>TextFormField(
keyboardType:type,
controller: controller,
onFieldSubmitted: onSubmitt,
obscureText: isPassword,
onChanged: onChange
,validator:validate,
onTap: onTap,
enabled: isclickable,
decoration: InputDecoration(
labelText:label,
    prefixIcon: Icon(
    prefix,
    ),
  suffixIcon: suffix!=null?IconButton(
    onPressed: suffixpressed ,
      icon: Icon(suffix)):null,
border: OutlineInputBorder(),
),
);
Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
            '${model['time']}',
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model['date']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(
          onPressed: ()
          {
            appCubit.get(context).UpdateData(
              status: 'done',
              id: model['id'],
            );
          },
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
          ),
        ),
        IconButton(
          onPressed: () {
            appCubit.get(context).UpdateData(
              status: 'archive',
              id: model['id'],
            );
          },
          icon: Icon(
            Icons.archive,
            color: Colors.black45,
          ),
        ),
      ],
    ),
  ),
  onDismissed: (direction)
  {

  },
);
Widget tasksBuilder({
  required List<Map> tasks,
}) => ConditionalBuilder(
  condition: tasks.length > 0,
  builder: (context) => ListView.separated(
    itemBuilder: (context, index)
    {
      return buildTaskItem(tasks[index], context);
    },
    separatorBuilder: (context, index) => mydivider(),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey,
        ),
        Text(
          'No Tasks Yet, Please Add Some Tasks',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);
Widget mydivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget BuildArticleItem(article,context)=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines:3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),),

            ],
          ),
        ),
      ),

    ],
  ),
);
Widget articlebuilder(list,context)=> ConditionalBuilder(
  condition:list.length>0,
  builder: (context)=> ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=>BuildArticleItem(list[index],context),
    separatorBuilder: (context,index)=>mydivider(),
    itemCount: list.length,
  ) ,
  fallback: (context)=>Center(child: CircularProgressIndicator()),
);