import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:quotes/views/components/controllers/Quotes_controller.dart';
import 'package:quotes/views/components/controllers/Text_color_controller.dart';

class creat_quotes extends StatelessWidget {
  const creat_quotes({super.key});

  @override
  Widget build(BuildContext context) {
    Quotes_Controller Quote = Get.put(Quotes_Controller());
    Text_color_controller T_color = Get.put(Text_color_controller());
    Color color = Colors.white;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Create quote"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 300,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(
                      () => Text(
                        "${Quote.quotes.value}",
                        style: TextStyle(color: T_color.pickerColor),
                      ),
                    ),
                    Text("-"),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadiusDirectional.circular(10)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: TextFormField(
                    controller: Quote.QuotesController,
                    onChanged: (val) {
                      Quote.cheng(quote: val);
                    },
                    decoration: InputDecoration(
                      labelText: "Quote :",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    child: Icon(Icons.search),
                    onPressed: () {
                      // Get.bottomSheet();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.dialog(
                  ColorPicker(
                    pickerColor: T_color.pickerColor,
                    onColorChanged: (color) {
                      T_color.color_cheng(color);
                    },
                  ),
                );
              },
              child: Text("Color"),
            ),
          ],
        ),
      ),
    );
  }
}
