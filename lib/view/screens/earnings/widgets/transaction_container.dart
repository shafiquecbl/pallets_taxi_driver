import 'package:flutter/material.dart';

class EarningTransactionContainer extends StatelessWidget {
  final double price;
  final String title;
  final String date;
  final bool isDebt;
  final void Function()? onMoreTab;

  const EarningTransactionContainer({
    Key? key,
    required this.price,
    this.onMoreTab,
    required this.title,
    required this.date,
    required this.isDebt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(date)
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "\$ $price",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    isDebt ? Icons.arrow_upward : Icons.arrow_downward,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
