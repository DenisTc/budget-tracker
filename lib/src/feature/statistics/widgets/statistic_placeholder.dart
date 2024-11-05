import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class StatisticPlaceholder extends StatelessWidget {
  const StatisticPlaceholder({
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
        child: Text(
          S.of(context).addTransactionsAndViewStats,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
