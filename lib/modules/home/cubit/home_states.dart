
abstract class HomeStates {}
class HomeInitialState extends HomeStates {}

class GetBooksSuccessState extends HomeStates {}
class AddBookLoadingState extends HomeStates {}
class AddBookSuccessState extends HomeStates {}
class AddBookErrorState extends HomeStates {}
class PickImageState extends HomeStates {}
class PickFileState extends HomeStates {}
class PickPdfState extends HomeStates {}
class PickAudioState extends HomeStates {}

class GetUserDataLoadingState extends HomeStates {}
class GetUserDataSuccessState extends HomeStates {}
class GetUserDataErrorState extends HomeStates {
  String error;
  GetUserDataErrorState(this.error);
}
class UserUpdateErrorState extends HomeStates {}

class DeleteBookState extends HomeStates {}
