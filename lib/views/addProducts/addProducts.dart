import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/HomeCubit/home_cubit.dart';
import 'package:ksr_store_app/bloc/product_crud/product_crud_cubit.dart';
import 'package:ksr_store_app/models/productCRUD.dart';
import 'package:ksr_store_app/res/constant.dart';

class AddProductPage extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageLinkController = TextEditingController();
  late final String mycategory;
  AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSmallPM),
        child: Column(
          children: [
            Form(
              key: _form,
              child: Column(children: [
                Row(
                  children: [
                    titleField(),
                    const SizedBox(width: kSmallPM),
                    priceField(),
                  ],
                ),
                const SizedBox(
                  height: kMediumPM,
                ),
                descriptionField(),
                const SizedBox(
                  height: kMediumPM,
                ),
                imageLinkField(),
                const SizedBox(
                  height: kMediumPM,
                ),
                categoryDropDownMunu(context),
              ]),
            ),
            const Spacer(),
            addProductButton(context),
            const SizedBox(height: kBigPM),
          ],
        ),
      ),
    );
  }

  Widget addProductButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      child: ElevatedButton.icon(
          onPressed: () async {
            if (_form.currentState!.validate()) {
              context.read<ProductCrudCubit>().addProduct(ProductCRUD(
                  title: _titleController.text,
                  price: _priceController.text,
                  description: _descriptionController.text,
                  category: mycategory,
                  image: _imageLinkController.text));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('item hase been add successfully'),
                duration: Duration(milliseconds: 700),
              ));
              await Future.delayed(const Duration(milliseconds: 1000));
              Navigator.pushReplacementNamed(context, '/');
            }
          },
          icon: const Icon(Icons.add),
          style: const ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
          label: const Text('Add product')),
    );
  }

  DropdownButtonFormField<String> categoryDropDownMunu(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please choose a category';
        }
        return null;
      },
      items: context
          .read<HomeCubit>()
          .allCategories
          .map((e) => DropdownMenuItem<String>(
              value: e.categoryName.toLowerCase(), child: Text(e.categoryName)))
          .toList(),
      decoration: const InputDecoration(
          labelText: 'choose a category',
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(kCircleBorderRadius)))),
      onChanged: (value) {
        if (value != null && value.trim().isNotEmpty) {
          mycategory = value;
        }
      },
    );
  }

  TextFormField imageLinkField() {
    return TextFormField(
      controller: _imageLinkController,
      keyboardType: TextInputType.url,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'please add a image link';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(kCircleBorderRadius))),
        label: Text('Image link'),
      ),
    );
  }

  TextFormField descriptionField() {
    return TextFormField(
      controller: _descriptionController,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'please add a descreption';
        }
        if (value.length < 10) {
          return 'description must be 10 character or longer';
        }
        return null;
      },
      maxLines: 3,
      decoration: const InputDecoration(
        labelText: 'Products description',
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(kCircleBorderRadius))),
      ),
    );
  }

  Expanded priceField() {
    return Expanded(
        child: TextFormField(
      controller: _priceController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null) {
          return null;
        }
        if (double.tryParse(value) == null || double.tryParse(value)! <= 0) {
          return 'Please enter a valid number';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(kCircleBorderRadius))),
        label: Text('Price'),
      ),
    ));
  }

  Expanded titleField() {
    return Expanded(
        flex: 3,
        child: TextFormField(
          controller: _titleController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'please add a title';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(kCircleBorderRadius))),
            label: Text('Products Title'),
          ),
        ));
  }
}
