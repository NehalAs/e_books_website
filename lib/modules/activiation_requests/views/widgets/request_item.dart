import 'package:e_books_website/modules/activiation_requests/cubit/requests_cubit.dart';
import 'package:e_books_website/modules/shared/utils/app_ui.dart';
import 'package:e_books_website/modules/shared/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../home/cubit/home_cubit.dart';
import '../../models/request_model.dart';

class RequestItem extends StatelessWidget {
  RequestItem({super.key, required this.model});

  late RequestModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppUI.textButton.withOpacity(0.15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New registration to activate',style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text('User mail : ${model.senderMail}'),
                const Spacer(),
                if (model.isAccepted == null)...[
                  SizedBox(
                    width: 110,
                    child: OutlinedButton(
                      onPressed: () {
                        HomeCubit.get(context).updateUser(
                          verificationStatus: 'refused',
                          idForUserToUpdateHisData: model.senderId!,
                        );
                        RequestsCubit.get(context).updateRequestStatus(
                            receiverId: model.receiverId!,
                            dateTime: model.dateTime!,
                            isAccepted: false,
                            senderId: model.senderId!,
                            requestId: model.requestId!,
                            senderMail: model.senderMail!);
                      },
                      child: Text(
                        'Decline',
                        style: TextStyle(color: AppUI.buttonColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                ],
                  SizedBox(
                    width: 110,
                    child: OutlinedButton(
                      onPressed: () {
                        HomeCubit.get(context).updateUser(
                          verificationStatus: 'approved',
                          idForUserToUpdateHisData: model.senderId!,
                        );
                        RequestsCubit.get(context).updateRequestStatus(
                            receiverId: model.receiverId!,
                            dateTime: model.dateTime!,
                            isAccepted: true,
                            senderId: model.senderId!,
                            requestId: model.requestId!,
                            senderMail: model.senderMail!);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(model.isAccepted == null
                                  ? AppUI.buttonColor
                                  : model.isAccepted == true
                                      ? Color(0xff006400)
                                      : Colors.grey[500]),
                      ),
                      child: Text(
                        model.isAccepted == null
                            ? 'Accept'
                            : model.isAccepted == true
                                ? 'Accepted'
                                : 'Declined',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Widget buildRequest(RequestModel model, requestId,  cubit, context) =>
//     Align(
//       alignment: AlignmentDirectional.centerStart,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadiusDirectional.only(
//                 bottomEnd: Radius.circular(30),
//                 topEnd: Radius.circular(30),
//                 topStart: Radius.circular(30),
//               ),
//               color: Colors.white, //grey[300],
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.grey, //New
//                     blurRadius: 1.0,
//                     offset: Offset(0, -0.1))
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Donate blood save life',
//                               maxLines: 1,
//                               textAlign: TextAlign.start,
//                               //overflow:TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             Text(
//                               '${model.dateTime!} ',
//                               maxLines: 1,
//                               textAlign: TextAlign.start,
//                               //overflow:TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.w500,
//                                 height: 1.3,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Text(
//                     'Your blood type has matched our needs can you help us ?',
//                     maxLines: 2,
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                       //fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Center(
//                     child: Text(
//                       '${model.bloodType!} ',
//                       maxLines: 1,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: defaultColor,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   myDevider(),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.location_on,
//                           color: Colors.grey,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Text(
//                             '${userModel.location ?? ''}',
//                             maxLines: 2,
//                             textAlign: TextAlign.start,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//
//                 ],
//               ),
//             )),
//       ),
//     );
}
