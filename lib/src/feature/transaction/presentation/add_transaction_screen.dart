import 'package:budget_tracker/src/core/constant/app_sizes.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/widgets/add_transaction_button.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/widgets/category_of_transaction_bottom.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/widgets/date_of_transaction.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/widgets/sum_of_transaction.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/widgets/type_of_transaction.dart';
import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  static const routeName = '/add-transaction';

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final formKey = GlobalKey<FormState>();

  final typeController = ValueNotifier<int?>(null);
  final sumController = TextEditingController();
  final categoryController = ValueNotifier<CategoryModel?>(null);
  final dateController = TextEditingController();

  @override
  void dispose() {
    typeController.dispose();
    sumController.dispose();
    categoryController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).addTransaction),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizes.gapH16,
              TypeOfTransaction(typeController: typeController),
              AppSizes.gapH24,
              SumOfTransaction(sumController: sumController),
              AppSizes.gapH24,
              CategoryControllerProvider(
                categoryController: categoryController,
                child: const CategoryOfTransaction(),
              ),
              AppSizes.gapH24,
              DateOfTransaction(dateController: dateController),
              AppSizes.gapH24,
              AddTransactionButton(
                categoryController: categoryController,
                typeController: typeController,
                formKey: formKey,
                sumController: sumController,
                dateController: dateController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
