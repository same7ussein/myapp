import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/new_app/cubit/cubit.dart';
import 'package:untitled/layout/new_app/cubit/states.dart';


class NewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness(),

      child: BlocConsumer<NewsCubit,NewStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'New APP',
              ),
              actions: [
                IconButton(onPressed:(){}, icon:Icon(
                  Icons.search,
                )),
                IconButton(
                    onPressed:(){
                  NewsCubit.get(context).changeAppMode();
                }, icon:Icon(
                  Icons.brightness_4_outlined,
                )),
              ],
            ),
            body: cubit.Sceens[cubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.CurrentIndex,
              onTap: (index){
                   cubit.changeBottomNavBar(index);
              },
              items: cubit.BottomItems ,),
          );
        },
      ),
    );
  }
}
