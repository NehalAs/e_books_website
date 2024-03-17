import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_books_website/modules/activiation_requests/cubit/requests_state.dart';
import 'package:e_books_website/modules/home/cubit/home_cubit.dart';
import 'package:e_books_website/modules/shared/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../models/request_model.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit() : super(RequestsInitial());
  static RequestsCubit get(context) => BlocProvider.of(context);

  void sendRequest({
    required String senderMail,
    required String receiverId,
    required String dateTime,
    required String senderId,
  }) {
    var uuid = const Uuid();
    var requestId=uuid.v4();
    RequestModel model = RequestModel(
      senderMail: senderMail,
      dateTime: dateTime,
      receiverId: receiverId,
      senderId: senderId,
      isAccepted: null,
      requestId:requestId,
    );
    emit(SendRequestLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('requests')
        .doc(requestId)
        .set(model.toMap())
        .then((value) {
      emit(SendRequestSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SendRequestErrorState(error.toString()));
    });
  }

  List<RequestModel> requests = [];
  void getRequests() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('requests')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      requests = [];
      event.docs.forEach((element) {
        requests.add(RequestModel.fromJson(element.data()));
      });
      emit(GetRequestsSuccessState());
    });
  }

  void updateRequestStatus({
    required String receiverId,
    required String dateTime,
    required bool isAccepted,
    required String senderId,
    required String requestId,
    required String senderMail,
  }) {
    var model = RequestModel(
      receiverId: receiverId,
      dateTime: dateTime,
      isAccepted: isAccepted,
      senderId: senderId,
      requestId: requestId,
      senderMail: senderMail,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('requests')
        .doc(requestId)
        .update(model.toMap())
        .then((value) {
      emit(RequestUpdateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RequestUpdateErrorState());
    });
  }
}
