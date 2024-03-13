
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterErrorState extends RegisterState {}
class CreateUserSuccessState extends RegisterState {}
class CreateUserErrorState extends RegisterState {}
class ChangePasswordVisibilityState extends RegisterState {}
