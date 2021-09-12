abstract class NewStates{}
class NewInitialState extends NewStates{}
class NewBottomNavState extends NewStates{}
class NewGetBusinessLoadingState extends NewStates{}
class NewGetBusinessSuccessState extends NewStates{}
class NewGetBusinessErrorState extends NewStates{
  final String error;
  NewGetBusinessErrorState(this.error);
}
class NewGetSportsLoadingState extends NewStates{}
class NewGetSportsSuccessState extends NewStates{}
class NewGetSportsErrorState extends NewStates{
  final String error;
  NewGetSportsErrorState(this.error);
}

class NewGetScienceLoadingState extends NewStates{}
class NewGetScienceSuccessState extends NewStates{}
class NewGetScienceErrorState extends NewStates{
  final String error;
  NewGetScienceErrorState(this.error);
}
class NewChangeModeState extends NewStates{}
class ToggleDarkMode extends NewStates {}



