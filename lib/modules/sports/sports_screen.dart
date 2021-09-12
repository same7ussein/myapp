import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/new_app/cubit/cubit.dart';
import 'package:untitled/layout/new_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class  SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
        listener: (context,state){},
        builder: (context,state){
          var list=NewsCubit.get(context).Sports;
          return  articlebuilder(list,context);
        }
    );
  }
}
