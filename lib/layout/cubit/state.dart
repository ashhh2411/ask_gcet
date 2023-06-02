abstract class AskPnuStates{}
class AskPnuInitialState extends AskPnuStates{}

class ChangeBottomNavState extends AskPnuStates{}

class GetUserLoadingState extends AskPnuStates{}

class GetUserSuccessState extends AskPnuStates{}

class GetUserErrorState extends AskPnuStates{
  final String error;

  GetUserErrorState(this.error);
}

class OpenTalabatLoadingState extends AskPnuStates{}

class OpenedTalabatSuccess extends AskPnuStates{}

class OpenedTalabatError extends AskPnuStates{}

class OpenUberLoadingState extends AskPnuStates{}

class OpenedOtaxiSuccess extends AskPnuStates{}

class OpenedOtaxiError extends AskPnuStates{}

class OpenCalenderLoadingState extends AskPnuStates{}

class OpenedCalenderSuccess extends AskPnuStates{}

class OpenedCalenderError extends AskPnuStates{}

class OpenPlaneLoadingState extends AskPnuStates{}

class OpenedPlaneSuccess extends AskPnuStates{}

class OpenedPlaneError extends AskPnuStates{}

class OpenWhatsAppLoadingState extends AskPnuStates{}

class OpenedWhatsAppSuccess extends AskPnuStates{}

class OpenedWhatsAppError extends AskPnuStates{}

class AppChangeBottomSheetState extends AskPnuStates {}

class GetPostsLoadingState extends AskPnuStates{}

class GetPostsSuccessState extends AskPnuStates{}

class GetPostsErrorState extends AskPnuStates{
  final String error;

  GetPostsErrorState(this.error);
}

class CreatePostLoadingState extends AskPnuStates{}

class CreatePostSuccessState extends AskPnuStates{}

class CreatePostErrorState extends AskPnuStates{}

class SendMessageSuccessState extends AskPnuStates{}

class SendMessageErrorState extends AskPnuStates{}

class GetMessageSuccessState extends AskPnuStates{}

class GetMessageErrorState extends AskPnuStates{}

class GetAllUsersLoadingState extends AskPnuStates{}

class GetAllUsersSuccessState extends AskPnuStates{}

class GetAllUsersErrorState extends AskPnuStates{
  final String error;

  GetAllUsersErrorState(this.error);

}

class GetPrayTimesLoadingState extends AskPnuStates{}

class GetPrayTimesSuccessState extends AskPnuStates{}

class GetPrayTimesErrorState extends AskPnuStates{
  final String error;

  GetPrayTimesErrorState(this.error);

}





