
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterErrorState extends RegisterState {
  String error;
  RegisterErrorState(this.error);
}
class CreateUserSuccessState extends RegisterState {
  late String uId;
  CreateUserSuccessState(this.uId);
}
class CreateUserErrorState extends RegisterState {
  String error;
  CreateUserErrorState(this.error);
}
class ChangePasswordVisibilityState extends RegisterState {}
