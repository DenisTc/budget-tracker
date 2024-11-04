import 'package:budget_tracker/src/core/constant/app_sizes.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/category/presentation/cubit/category_cubit.dart';
import 'package:budget_tracker/src/feature/category_list/presentation/cubit/category_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget_tracker/src/core/extension/string_extension.dart';

class AddCategoryForm extends StatefulWidget {
  const AddCategoryForm({
    super.key,
  });

  @override
  State<AddCategoryForm> createState() => _AddCategoryFormState();
}

class _AddCategoryFormState extends State<AddCategoryForm> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Название категории',
                ),
                validator: (value) {
                  if (value.isNullOrEmpty) {
                    return 'Укажите название новой категории';
                  }
                  return null;
                },
              ),
              AppSizes.gapH16,
              SizedBox(
                width: double.infinity,
                child: BlocListener<CategoryCubit, CategoryState>(
                  listener: (context, state) {
                    if (state is CategoryAddSuccess) {
                      context.read<CategoryListCubit>().getCategories();
                      Navigator.pop(context);
                    } else if (state is CategoryError) {
                      final message = state.error.name ==
                              CategoryErrorEnum.isExist.name
                          ? 'Категория с таким именем уже существует'
                          : 'Не удалось добавить категорию, попробуйте позже';
                      showErorDialog(context, message: message);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final category = CategoryModel(
                          id: 0,
                          title: titleController.text.trim(),
                        );
                        context.read<CategoryCubit>().addCategory(category);
                      }
                    },
                    child: const Text('Добавить'),
                  ),
                ),
              ),
              AppSizes.gapH16,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showErorDialog(BuildContext context, {required String message}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('Ок'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}