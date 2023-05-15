import 'package:flutter/material.dart';
import 'package:servicedate/UI/Components/Button.dart';
import 'package:servicedate/UI/Components/Constants/SpacePalette.dart';
import 'package:servicedate/UI/Components/CustomSafeArea.dart';
import 'package:servicedate/UI/Components/CustomTextField2.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:servicedate/UI/Screens/DateCalulator/DateCalculatorManager.dart';
import 'package:provider/provider.dart';

class DateCalculator extends StatelessWidget {
  const DateCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
        child: Scaffold(
      body: Padding(
        padding: SpacePalette.paddingExtraLarge,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    "Date Calculator",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SpacePalette.spaceExtraLarge,
                  CustomTextField(
                    readOnly: true,
                    labelText: "Date of sales",
                    controller:
                        context.read<DateCalculatorManager>().dateController,
                    onTap: () {
                      context.read<DateCalculatorManager>().pickDate(context);
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Start day",
                          controller: context
                              .read<DateCalculatorManager>()
                              .startDayController,

                        ),
                      ),
                      SpacePalette.spaceMedium,
                      Expanded(
                        child: CustomTextField(
                          labelText: "Interval day",
                          controller: context
                              .read<DateCalculatorManager>()
                              .intervalDayController,
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    labelText: "Service Count",
                    controller: context.read<DateCalculatorManager>().intervalDayController,
                    onTap:()  {
                      context.read<DateCalculatorManager>().pickDate(context);
                    } ,
                  ),

                  ...context.watch<DateCalculatorManager>().result.entries.map((e) => Column(
                    children: [
                      Row(
                        children: [
                          Text(e.key),
                          SpacePalette.spaceMedium,
                          Text(e.value.toString()),
                        ],
                      )
                    ],
                  )).toList()
                ],
              ),
            ),
            AppButtonPrimary(onPressedFunction: (){
              context.read<DateCalculatorManager>().calculateDays();
            }, text: "Calculate")
          ],
        ),
      ),
    ));
  }
}
