import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/HomeCubit/home_cubit.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context
              .read<HomeCubit>()
              .allCategories
              .map((e) => FilterChip(
                    selected: e.isSelected,
                    label: Text(e.categoryName),
                    onSelected: (value) {
                      context.read<HomeCubit>().changeFiltterValue(
                          isFilttering: value,
                          id: e.id,
                          categoryName: e.categoryName);
                    },
                  ))
              .toList(),
        );
      },
    );
  }
}
