abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class GetBusinessNewsLoadingState extends NewsStates{}
class GetBusinessNewsSuccessState extends NewsStates{}
class GetBusinessNewsErrorState extends NewsStates{
  final String error;
  GetBusinessNewsErrorState(this.error);
}

class GetScienceNewsLoadingState extends NewsStates{}
class GetScienceNewsSuccessState extends NewsStates{}
class GetScienceNewsErrorState extends NewsStates{
  final String error;
  GetScienceNewsErrorState(this.error);
}

class GetSportsNewsLoadingState extends NewsStates{}
class GetSportsNewsSuccessState extends NewsStates{}
class GetSportsNewsErrorState extends NewsStates{
  final String error;
  GetSportsNewsErrorState(this.error);
}