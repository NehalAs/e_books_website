import 'dart:html';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_books_website/modules/register/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/constants.dart';
import '../models/book_model.dart';
import 'home_states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<BookModel> books = [];
  void getBooks() {
    FirebaseFirestore.instance.collection('books').snapshots().listen((event) {
      books = [];
      event.docs.forEach((element) {
        books.add(BookModel.fromJson(element.data()));
      });
    });

 //   emit(GetBooksSuccessState());


  }

  void addBook({
    required String name,
    required String cover,
    required String category,
    required String authorName,
    required String pdf,
    required String voice,
    required String bookId,
  }) {
    emit(AddBookLoadingState());
    var model = BookModel(
      name: name,
      cover: cover,
      category: category,
      authorName: authorName,
      voice: voice,
      pdf: pdf,
      bookId: bookId,
    );
    FirebaseFirestore.instance
        .collection('books').doc(bookId)
        .set(model.toJson())
        .then((value) {
      emit(AddBookSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddBookErrorState());
    });
  }

  String? coverImage;

  Future<void> pickImage() async {
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files?.length == 1) {
        final file = files?[0];
        final reader = FileReader();

        reader.onLoadEnd.listen((e) {
          coverImage = reader.result as String;
          print('$coverImage');
          uploadCoverImage();
          emit(PickImageState());
        });
        reader.readAsDataUrl(file!);
      }
    });
  }

  String coverImageUrl = '';
  void uploadCoverImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.directory(coverImage!).pathSegments.last}')
        .putString(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print('valueeeeeeeeeeeeeeeeeeee$value');
        coverImageUrl = value;
      }).catchError((error) {
        print(error.toString());
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  Uint8List? pdfBytes;
  String? pdfUrl;

  Future<void> pickAndUploadPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      Uint8List? fileBytes = result.files.single.bytes;
      String fileName = result.files.single.name;
      String? url = await uploadPDFToFirebaseStorage(fileName, fileBytes!);
      pdfBytes = fileBytes;
      pdfUrl = url;
      emit(PickPdfState());
    }
  }

  Future<String?> uploadPDFToFirebaseStorage(
      String fileName, Uint8List pdfBytes) async {
    try {
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref('pdfs/$fileName');

      SettableMetadata metadata = firebase_storage.SettableMetadata(
        contentType: 'application/pdf',
        customMetadata: {'picked': 'true'},
      );
      await ref.putData(pdfBytes, metadata);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error uploading PDF to Firebase Storage: $e');
    }
  }
  String? audioUrl;
 Future<void> pickAndUploadAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );

    if (result != null) {
      Uint8List? fileBytes = result.files.single.bytes;
      String fileName = result.files.single.name;
      String? url = await uploadAudioToFirebaseStorage(fileName, fileBytes!);
      audioUrl=url;
      emit(PickAudioState());
    }
  }

  Future<String?> uploadAudioToFirebaseStorage(
      String fileName, Uint8List audioBytes) async {
    try {
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref('audio/$fileName');

      SettableMetadata metadata = firebase_storage.SettableMetadata(
        contentType: 'audio/mpeg',
        customMetadata: {'picked': 'true'},
      );
      await ref.putData(audioBytes, metadata);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error uploading audio to Firebase Storage: $e');
    }
  }

   UserModel? userModel;
  void getUserData({uId}) {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId ?? userId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorState(error.toString()));
    });
  }

   Map<String,String> map={};

  void updateUser({

    required String idForUserToUpdateHisData,
    String? verificationStatus,
  }) {
    map.clear();
    map['verificationStatus'] = verificationStatus!;
    FirebaseFirestore.instance
        .collection('users')
        .doc(idForUserToUpdateHisData)
        .update(map)
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UserUpdateErrorState());
    });
  }

  void deleteBook(bookId){
    FirebaseFirestore.instance.collection('books').doc(bookId).delete();
    emit(DeleteBookState());
  }
}
