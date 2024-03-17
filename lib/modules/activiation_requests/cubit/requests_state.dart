
abstract class RequestsState {}

class RequestsInitial extends RequestsState {}
class SendRequestLoadingState extends RequestsState {}
class SendRequestSuccessState extends RequestsState {}
class SendRequestErrorState extends RequestsState {
  String? error;
  SendRequestErrorState(this.error);
}
class GetRequestsSuccessState extends RequestsState {}
class RequestUpdateSuccessState extends RequestsState {}
class RequestUpdateErrorState extends RequestsState {}
