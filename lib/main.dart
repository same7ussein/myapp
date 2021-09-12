import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/layout/new_app/cubit/cubit.dart';
import 'package:untitled/layout/new_app/cubit/states.dart';
import 'package:untitled/layout/new_app/news_app.dart';
import 'package:untitled/shared/bloc_observer.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark=CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}
class MyApp extends StatelessWidget {
 late final  bool isDark;
 MyApp(this.isDark);
  @override
  Widget build(BuildContext context){

    return BlocProvider(

      create: (BuildContext context)=>NewsCubit()..changeAppMode(
        formShared: isDark,
      ),
      child: BlocConsumer<NewsCubit,NewStates>(
        listener: (context,state){},
        builder: (context,state)
          {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
                 theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.white,
                    titleSpacing: 20.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness:Brightness.dark
                    ),
                    backwardsCompatibility: false,
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color:Colors.black,
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),iconTheme: IconThemeData(
                  color: Colors.black,
                )

                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                  backgroundColor: Colors.white,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                ),
              ),
              darkTheme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange,
                  ),
                  scaffoldBackgroundColor:HexColor('333739'),
                  appBarTheme: AppBarTheme(
                      titleSpacing: 20.0,
                      backgroundColor: HexColor('333739'),
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor:HexColor('333739'),
                          statusBarIconBrightness:Brightness.light
                      ),
                      backwardsCompatibility: false,
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                        color:Colors.white,
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                      ),iconTheme: IconThemeData(
                    color: Colors.white,
                  )

                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20.0,

                    backgroundColor: HexColor('333739'),
                  ),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  )


              ),
              themeMode:NewsCubit.get(context).isDark ? ThemeMode.dark :ThemeMode.light,
              home: NewLayout(),
            );
          }

      ),
    );
  }
}
