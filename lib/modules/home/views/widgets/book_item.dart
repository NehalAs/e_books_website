import 'package:e_books_website/modules/home/cubit/home_cubit.dart';
import 'package:e_books_website/modules/home/views/pdf_viewer_screen.dart';
import 'package:e_books_website/modules/shared/constants.dart';
import 'package:e_books_website/modules/shared/utils/app_ui.dart';
import 'package:e_books_website/modules/shared/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/utils/styles.dart';
import '../../models/book_model.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.model});
  final BookModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                ),
                  child:Image(
                    image:NetworkImage(
                      model.cover!,
                    ),
                   fit: BoxFit.fill,
                  ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    Text(
                      model.name??'',
                      style: Styles.textStyle20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                        'By ${model.authorName}',
                        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400)
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      model.category??'',
                      style: Styles.textStyle14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment:Alignment.bottomRight,

                      child: InkWell(
                          onTap: () async {
                            print(model.pdf);

                            if (HomeCubit.get(context).userModel?.userType=='admin' || HomeCubit.get(context).userModel?.verificationStatus=='approved') {
                              if (await canLaunch(model.pdf!)) {
                                await launch(model.pdf!);
                              } else {
                                throw 'Could not launch ${model.pdf}';
                              }
                            }
                            else{
                              AppUtil.showToast(message: 'Your account has not been activated yet');
                            }
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: AppUI.buttonColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Read ',style: Styles.textStyle14.copyWith(color: Colors.white,),),
                                  const Icon(Icons.chrome_reader_mode_outlined,color: Colors.white,size: 15),
                                ],
                              )),
                            ),)),
                    ),
                    const SizedBox(height: 20,),
                    if(model.voice!='')
                      Align(
                      alignment:Alignment.bottomRight,

                      child: InkWell(
                          onTap: () async {
                            print('voiceeeeeee ${model.voice}');

                            if (HomeCubit.get(context).userModel?.userType=='admin' || HomeCubit.get(context).userModel?.verificationStatus=='approved') {
                              if (await canLaunch(model.voice!)) {
                                await launch(model.voice!);
                              } else {
                                throw 'Could not launch ${model.voice}';
                              }
                            }
                            else{
                              AppUtil.showToast(message: 'Your account has not been activated yet');
                            }
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: AppUI.buttonColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Hear ',style: Styles.textStyle14.copyWith(color: Colors.white,),),
                                  const Icon(Icons.headphones,color: Colors.white,size: 15),
                                ],
                              )),
                            ),)),
                    ),
                    const SizedBox(width: 20,),
                    if(HomeCubit.get(context).userModel!.userType=='admin')...[
                      const SizedBox(width: 20,),
                      Align(
                      alignment:Alignment.bottomRight,

                      child: InkWell(
                          onTap: () async {
                            HomeCubit.get(context).deleteBook(model.bookId);
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xff8b0000 ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Delete',style: Styles.textStyle14.copyWith(color: Colors.white,),),
                                  const Icon(Icons.delete,color: Colors.white,size: 15),
                                ],
                              )),
                            ),)),
                    ),],
                  ],
                )),
          ],
        ),
      ),
    );
  }
}