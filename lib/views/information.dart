import 'package:flutter/material.dart';
import '../resources/strings.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(inforHoaDon),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Container(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 20, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(tongSoKHLabel),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(tongSoKHVipLabel),
                                Text(tongDoanhThuLabel)
                              ],
                            ))),
                  ),
                ))));
  }
}
