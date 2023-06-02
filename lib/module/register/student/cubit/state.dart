abstract class AskStudentRegisterStates{}

class AskStudentRegisterInitialState extends AskStudentRegisterStates{}

class AskStudentRegisterLoadingState extends AskStudentRegisterStates{}

class AskStudentRegisterSuccessState extends AskStudentRegisterStates{}

class AskStudentRegisterErrorState extends AskStudentRegisterStates{
  final  error;
 AskStudentRegisterErrorState(this.error);
}

class AskStudentCreateUserSuccessState extends AskStudentRegisterStates{
  final String? uId;

  AskStudentCreateUserSuccessState(this.uId);
}

class AskStudentCreateUserErrorState extends AskStudentRegisterStates{
  final  error;
  AskStudentCreateUserErrorState(this.error);
}

class ChangePasswordStudentRegisterVisibilityState extends AskStudentRegisterStates{}
