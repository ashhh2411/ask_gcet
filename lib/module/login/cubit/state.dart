abstract class AskLoginStates{}

class AskLoginInitialState extends AskLoginStates{}

class AskLoginLoadingState extends AskLoginStates{}

class AskLoginSuccessState extends AskLoginStates{
  final String uId;

  AskLoginSuccessState(this.uId);
}

class AskLoginErrorState extends AskLoginStates{
  final  error;
 AskLoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends AskLoginStates{}
