import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/HomeCubit/home_cubit.dart';
import 'package:ksr_store_app/bloc/product_crud/product_crud_cubit.dart';
import 'package:ksr_store_app/views/addProducts/addProducts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
            child: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Ksr Store',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        )),
        ListTile(
          title: const Text("Add Products"),
          onTap: () {
            final myHomeCubit = context.read<HomeCubit>();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                      value: myHomeCubit,
                      child: BlocProvider(
                          create: (context) => ProductCrudCubit(),
                          child: AddProductPage())),
                ));
          },
        ),
      ]),
    );
  }
}
