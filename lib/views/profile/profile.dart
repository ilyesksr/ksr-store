import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/AppCubit/app_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          context.read<AppCubit>().toggleTheme();
        }, icon: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Icon(context.read<AppCubit>().isDark
                ? Icons.nights_stay
                : Icons.sunny);
          },
        )),
        title: Text(
          'Profile',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
    );
  }
}
