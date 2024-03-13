import 'package:flutter/material.dart';

import '../../../shared/utils/styles.dart';
import '../../models/book_model.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.model});
  final BookModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap:() {},
        child: SizedBox(
          height: 125,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // CustomBookImage(ImageUrl:model.volumeInfo.imageLinks.thumbnail??''),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                ),
                  child:const Image(
                    image:NetworkImage(
                      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D'
                    ),
                    height:200.0,
                    width: 150.0,

                  ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.category??'',
                        style: Styles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        model.authorName??'',
                        style: Styles.textStyle14
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            'Free',
                            style: Styles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}