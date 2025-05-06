import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final List<String> cities;
  final Function(
      String enteredText,
      String selectedCity,
      DateTime? startDate,
      DateTime? endDate,
      ) onConfirm;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.cities,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedCity = cities.isNotEmpty ? cities[0] : '';
    final Rx<DateTime?> startDate = Rx<DateTime?>(null);
    final Rx<DateTime?> endDate = Rx<DateTime?>(null);
    final TextEditingController textController = TextEditingController();

    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Select City",
                border: OutlineInputBorder(),
              ),
              value: selectedCity,
              items: cities
                  .map((city) => DropdownMenuItem<String>(
                value: city,
                child: Text(city),
              ))
                  .toList(),
              onChanged: (value) {
                selectedCity = value ?? selectedCity;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Start Date Picker
                Expanded(
                  child: Obx(
                        () => ElevatedButton(
                          onPressed: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: startDate.value ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              startDate.value = pickedDate;
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // Ensures the button shrinks to fit its content
                            children: [
                              const Icon(Icons.calendar_today, size: 16),
                              const SizedBox(width: 8), // Adds some spacing between the icon and text
                              Flexible( // Wrap the text to avoid overflow
                                child: Text(
                                  startDate.value == null
                                      ? "Start"
                                      : "${startDate.value!.toLocal()}".split(' ')[0],
                                  overflow: TextOverflow.ellipsis, // Ensures the text gets truncated if it's too long
                                  maxLines: 1, // Keeps the text to a single line
                                ),
                              ),
                            ],
                          ),
                        ),

                  ),
                ),
                const SizedBox(width: 8),
                // End Date Picker
                Expanded(
                  child: Obx(
                        () => ElevatedButton(
                          onPressed: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: endDate.value ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              endDate.value = pickedDate;
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // Ensures the Row adjusts to fit content
                            children: [
                              const Icon(Icons.calendar_today, size: 16),
                              const SizedBox(width: 8), // Adds spacing between the icon and text
                              Flexible( // Handles text overflow gracefully
                                child: Text(
                                  endDate.value == null
                                      ? "End"
                                      : "${endDate.value!.toLocal()}".split(' ')[0],
                                  overflow: TextOverflow.ellipsis, // Ensures text is truncated with "..."
                                  maxLines: 1, // Keeps the text to a single line
                                ),
                              ),
                            ],
                          ),
                        ),

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
            onConfirm(
              textController.text,
              selectedCity,
              startDate.value,
              endDate.value,
            );
          },
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
