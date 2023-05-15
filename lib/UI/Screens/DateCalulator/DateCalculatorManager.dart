import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class DateCalculatorManager with ChangeNotifier, DiagnosticableTreeMixin {
  TextEditingController dateController = TextEditingController();
  TextEditingController startDayController = TextEditingController();
  TextEditingController intervalDayController = TextEditingController();
  TextEditingController serviceCount = TextEditingController();
  DateTime? _datePicked;

  DateTime? get datePicked => _datePicked;
  Map<String, DateTime> result = {};

  set datePicked(DateTime? value) {
    _datePicked = value;
  }

  pickDate(BuildContext context) async {
    _datePicked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime(2022),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      dateFormat: "yyyy-MMMM-dd",
      looping: true,
    );
    if (_datePicked != null) {
      dateController.text = _datePicked.toString().substring(0, 10);
    }
    notifyListeners();
  }

  calculateDays() {
    if (intervalDayController.text.trim().isEmpty) {
      result["1"]= _datePicked!.add(Duration(days:int.parse(startDayController.text)));
    }
    print(result);
    notifyListeners();
  }
}
