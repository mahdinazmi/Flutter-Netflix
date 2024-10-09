import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_cubit.dart';
import '../bloc/selectable_option_cubit.dart';
import 'selectable_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder < SelectableOptionCubit, SearchType > (
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
              isSelected: context.read < SelectableOptionCubit > ().state == SearchType.movie,
              title: 'Movie',
              onTap: (){
                context.read < SelectableOptionCubit > ().selectMovie();
                context.read < SearchCubit > ().search(
                  context.read < SearchCubit > ().textEditingController.text,
                  context.read < SelectableOptionCubit > ().state
                );
              },
            ),
            const SizedBox(width: 16, ),
              SelectableOption(
                isSelected: context.read < SelectableOptionCubit > ().state == SearchType.tv,
                title: 'TV',
                onTap: (){
                context.read < SelectableOptionCubit > ().selectTV();
                context.read < SearchCubit > ().search(
                  context.read < SearchCubit > ().textEditingController.text,
                  context.read < SelectableOptionCubit > ().state
                );
              },
              )
          ],
        );
      },
    );
  }
}