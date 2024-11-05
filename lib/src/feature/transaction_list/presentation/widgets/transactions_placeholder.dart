import 'package:budget_tracker/src/core/constant/app_sizes.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class TransactionsPlaceholder extends StatelessWidget {
  const TransactionsPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).emptyHere,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AppSizes.gapH8,
            Text(
              S.of(context).addTransactionsToControl,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
