import 'package:e_books_website/modules/activiation_requests/cubit/requests_cubit.dart';
import 'package:e_books_website/modules/activiation_requests/cubit/requests_state.dart';
import 'package:e_books_website/modules/activiation_requests/views/widgets/request_item.dart';
import 'package:e_books_website/modules/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/request_model.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestsCubit, RequestsState>(
        listener: (context, state) {},
        builder: (context, state) {
          RequestsCubit.get(context).getRequests();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => RequestItem(model:RequestsCubit.get(context).requests[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: RequestsCubit.get(context).requests.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

