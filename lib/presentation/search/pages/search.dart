import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:netflix/presentation/search/bloc/search_cubit.dart';
import 'package:netflix/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:netflix/presentation/search/widgets/search_options.dart';
import '../widgets/search_content.dart';
import '../widgets/search_field.dart';

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
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit())
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SearchField(),
              SizedBox(height: 16,),
              SearchOptions(),
              SizedBox(height: 16,),
              Expanded(child: SearchContent())
            ],
          ),
        ),
      ),
    );
  }
}