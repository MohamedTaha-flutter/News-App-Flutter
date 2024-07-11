abstract class NewsState {}

class InitialState extends NewsState {}

class BottomNavBarChange extends NewsState {}

class NewsBusinessDataSuccessState extends NewsState {}

class NewsBusinessDataErrorState extends NewsState {}

class NewsBusinessDataLoadingState extends NewsState {}

class NewsSportsDataErrorState extends NewsState {}

class NewsSportsDataSuccessState extends NewsState {}

class NewsSportsDataLoadingState extends NewsState {}

class NewsScienceDataErrorState extends NewsState {}

class NewsScienceDataSuccessState extends NewsState {}

class NewsScienceDataLoadingState extends NewsState {}
class ChangeThemeModeStat extends NewsState {}
class NewsSearchDataErrorState extends NewsState {}

class NewsSearchDataSuccessState extends NewsState {}

class NewsSearchDataLoadingState extends NewsState {}