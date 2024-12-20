import 'package:currency_converter/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class UsdToAny extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final rates;
  final Map currencies;
  const UsdToAny({super.key, @required this.rates, required this.currencies});

  @override
  // ignore: library_private_types_in_public_api
  _UsdToAnyState createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'AUD';
  String answer = 'Converted Currency will be shown here :)';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          // width: w / 3,
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'USD to Any Currency',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 20),

                //TextFields for Entering USD
                TextFormField(
                  key: const ValueKey('usd'),
                  controller: usdController,
                  decoration: const InputDecoration(hintText: 'Enter USD'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    //Future Builder for getting all currencies for dropdown list
                    Expanded(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: widget.currencies.keys
                            .toSet()
                            .toList()
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    //Convert Button
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          answer =
                              '${usdController.text} USD = ${convertusd(widget.rates, usdController.text, dropdownValue)} $dropdownValue';
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor)),
                      child: const Text('Convert'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),

                //Final Output
                const SizedBox(height: 10),
                Text(answer)
              ])),
    );
  }
}
