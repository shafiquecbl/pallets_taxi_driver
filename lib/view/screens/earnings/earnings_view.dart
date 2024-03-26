import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/text.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/card_details/card_details.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/earnings/widgets/transaction_container.dart';

class EarningView extends StatelessWidget {
  const EarningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        toolbarHeight: kToolbarHeight * 2,
        automaticallyImplyLeading: false,
        leading: FittedBox(
          fit: BoxFit.none,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {
                  pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp)),
          ),
        ),
        title: Text(
          'Earnings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 111,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Balance',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$ 10.00',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 40,
                              child: CustomMaterialButton(
                                  text: "Withdraw",
                                  textColor: primaryColor,
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  fontSize: 18,
                                  ontab: () {
                                    launchScreen(
                                      const CardDetailsView(),
                                    );
                                  }),
                            ),
                          ])
                    ],
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            const PageHeading(title: "Transaction History"),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (int i = 0; i < 5; i++)
                    EarningTransactionContainer(
                        price: 1000,
                        date: "10/10/2022",
                        isDebt: false,
                        title: "Bank Withdrawal",
                        onMoreTab: () {})
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
