import 'package:cubit_dasar/cubit/product_cubit/product_cubit.dart';
import 'package:cubit_dasar/cubit/product_cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewProductScreen extends StatelessWidget {
  const CreateNewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProductCubit(), child: _Content());
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final imageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
      listenWhen:
          (previous, current) =>
              current.createProductModel.id != previous.createProductModel.id ||
              current.error != previous.error,
      listener: (context, state) {
        if (state.createProductModel.id != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Berhasil Create Product',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
          titleController.clear();
          priceController.clear();
          descriptionController.clear();
          categoryController.clear();
          imageController.clear();
        } else if (state.error != '') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error, style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Create New Product')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Title tidak boleh kosong';
                    }
                    //kalo mao cek email valid atau tidak
                    // if (!value!.contains('@')) {
                    //   return 'Email tidak valid';
                    // }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Price tidak boleh kosong';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value == '') {}
                    return 'Description tidak boleh kosong';
                  },
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Category tidak boleh kosong';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: imageController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Image URL tidak boleh kosong';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final title = titleController.text;
                          final price =
                              double.tryParse(priceController.text) ?? 0.0;
                          final description = descriptionController.text;
                          final category = categoryController.text;
                          final image = imageController.text;

                          if (_formKey.currentState!.validate()) {
                            context.read<ProductCubit>().createProduct(
                              id: 1,
                              title: title,
                              price: price,
                              description: description,
                              category: category,
                              image: image,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child:
                            state.isLoading
                                ? CircularProgressIndicator()
                                : Text(
                                  'Create Product',
                                  style: TextStyle(color: Colors.white),
                                ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
