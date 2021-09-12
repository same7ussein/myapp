import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';
class HomeLayout extends StatelessWidget {
  var scaffoldKey=GlobalKey<ScaffoldState>();
  var formKey=GlobalKey<FormState>();
  var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();
  @override
  Widget build(BuildContext context) {
  return BlocProvider(
    create: (BuildContext context)=>appCubit()..createDatabase(),
    child: BlocConsumer<appCubit,appStates>(
      listener: (context,state) {
        if(state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
      },
      builder: (BuildContext context, state)
        {
          appCubit cubit=appCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title:Text(
                  cubit.titles[cubit.CurrentIndex]
              ),

            ),
           body: ConditionalBuilder(
            condition: state is! AppGetDatabaseLoadingState,
            builder: (context) => cubit.Screens[cubit.CurrentIndex],
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                if(cubit.isBottomSheetShown)
                {
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text
                    );
                  }
                }
                else{
                  scaffoldKey.currentState!.showBottomSheet((context) => Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20.00),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                        [
                          defaultFormField(controller:titleController,
                            type: TextInputType.text,
                            validate: ( value){
                              if(value.isEmpty){
                                return 'title must not be empty';
                              }
                              return null;
                            }
                            ,
                            label: '  Task Title ',
                            prefix: Icons.title,
                          ),
                          SizedBox(
                            height: 15.00,
                          ),
                          defaultFormField(controller:timeController,
                            type: TextInputType.datetime,
                            onTap: (){

                              showTimePicker(context: context, initialTime:
                              TimeOfDay.now(),
                              ).then((value){
                                timeController.text=value!.format(context);
                              });
                            },
                            validate: ( value){
                              if(value.isEmpty){
                                return 'time must not be empty';
                              }
                              return null;
                            }
                            ,
                            label: '  Task Time',

                            prefix: Icons.watch_later_outlined,
                          ),
                          SizedBox(
                            height: 15.00,
                          ),
                          defaultFormField(controller:dateController,
                            type: TextInputType.datetime,
                            onTap: ()
                            {
                              showDatePicker(context: context,
                                initialDate:DateTime.now() ,
                                firstDate:DateTime.now()  ,
                                lastDate:DateTime.parse('2021-10-03'),
                              ).then((value){
                                dateController.text=DateFormat.yMMMd().format(value!);
                              });
                            },
                            validate: ( value){
                              if(value.isEmpty){
                                return 'data must not be empty';
                              }
                              return null;
                            }
                            ,
                            label: '  Task Data',
                            prefix: Icons.calendar_today,
                          )
                        ],
                      ),
                    ),
                  ),
                    elevation:20.00,
                  ).closed.then((value){
                    cubit.ChangeBottomSheetState(isShow:false, icon:Icons.edit);
                  });
                  cubit.ChangeBottomSheetState(isShow:true, icon:Icons.add);
                }
              },
              child: Icon(
               cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.CurrentIndex,
              onTap: (index){
               cubit.changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label:'Tasks'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outlined),
                    label:'done'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined),
                    label:'archived'
                ),
              ],
            ),
          );
        }

    ),
  );
  }
}