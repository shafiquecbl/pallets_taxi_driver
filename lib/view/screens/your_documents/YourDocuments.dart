import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

class YourDocuments extends StatelessWidget {
  const YourDocuments({super.key});

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
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {
                  pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp)),
          ),
        ),
        title: Text(
          'Overview',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: ListView(children: [
          DocumentsContainerAddRemove(
            text: 'Driving Liecence',
            onCheck: () {},
            onRemove: () {},
          ),
          DocumentsContainerAddRemove(
            text: 'Identity Card',
            onCheck: () {},
            onRemove: () {},
          ),
          DocumentsContainerAddRemove(
            text: 'Vehicle Image',
            onCheck: () {},
            onRemove: () {},
          ),
          DocumentsContainerAddRemove(
            text: 'Your Face Image',
            onCheck: () {},
            onRemove: () {},
          ),
          DocumentsContainerAddRemove(
            text: 'Liecence Image',
            onCheck: () {},
            onRemove: () {},
          ),
          DocumentsContainerAddRemove(
            text: 'Vehicle Registration',
            onCheck: () {},
            onRemove: () {},
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: CustomMaterialButton(text: "Update", ontab: () {})),
    );
  }
}

class DocumentsContainerAddRemove extends StatelessWidget {
  final String text;
  final void Function()? onCheck;
  final void Function()? onRemove;
  const DocumentsContainerAddRemove({
    super.key,
    required this.text,
    this.onCheck,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            Expanded(
              flex: 8,
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                      child: CircularIconButton(
                          iconColor: Colors.white,
                          backgroundColor: primaryColor,
                          icon: Icons.check,
                          onTap: onCheck)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: CircularIconButton(
                          iconColor: Colors.black54,
                          backgroundColor: reciveMessagebackColor,
                          icon: Icons.delete_outline_outlined,
                          onTap: onRemove)),
                ],
              ),
            ),
          ])),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final void Function()? onTap;

  const CircularIconButton({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.onTap,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
