import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:netflix/presentation/search/bloc/selectable_option_cubit.dart';

import '../widgets/search_field.dart';
import '../widgets/selectable_option.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Search'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit())
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SearchField(),
              const SizedBox(height: 16,),
              BlocBuilder<SelectableOptionCubit,SearchType>(
                builder: (context, state) {
                  return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableOption(
                      isSelected: context.read<SelectableOptionCubit>().state == SearchType.movie,
                      title: 'Movie',
                      onTap: () => context.read<SelectableOptionCubit>().selectMovie(),
                    ),
                    const SizedBox(width: 16,),
                     SelectableOption(
                      isSelected: context.read<SelectableOptionCubit>().state == SearchType.tv,
                      title: 'TV',
                      onTap: () => context.read<SelectableOptionCubit>().selectTV(),
                    )
                  ],
                );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}