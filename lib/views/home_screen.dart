import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:statelessonpractice/resources/strings.dart';
import 'package:statelessonpractice/resources/widgets/infor_widget.dart';
import 'package:statelessonpractice/resources/widgets/thongke_widget.dart';
import 'package:statelessonpractice/views/information.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? nameKHController,
      soluongSachController,
      litetureController;
  bool isChecked = false;
  int? tongtien = 0;
  int? tongsoKH = 0;
  int? tongsoKHVip = 0;
  int? tongDoanhThu = 0;

  @override
  void initState() {
    // Todo: impelement initState
    super.initState();
    nameKHController = TextEditingController();
    soluongSachController = TextEditingController();
    litetureController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      print("State đã tồn tại!");
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(nameProgram),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 30, left: 30, top: 0),
              child: Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Text(
                      inforHoaDon,
                      textAlign: TextAlign.left,
                    ),
                    color: Colors.green,
                  ),
                ),
                InforWidget(
                  textInfor: nameKhachHang,
                  inputInfor: nameKhachHangHint,
                  controller: nameKHController,
                ),
                InforWidget(
                  textInfor: soluongSach,
                  inputInfor: soluongSachhint,
                  controller: soluongSachController,
                ),
                CheckboxListTile(
                  title: Text("VIP"),
                  checkColor: Colors.white,
                  // fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckInfor(
                    textInforLabel: thanhTienLabel,
                    textInforOutput: tongtien.toString()),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              print(isChecked);
                              int? textToSendBack =
                                  int.parse(soluongSachController!.text);
                              if (textToSendBack != null) {
                                if (isChecked) {
                                  tongtien = (textToSendBack * 2000 * 9);
                                } else {
                                  tongtien = (textToSendBack * 20000) as int?;
                                }
                              }
                            });
                          },
                          child: Text(btnSum),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              print(tongsoKH);
                              int? tongsoKHCheck = tongsoKH ?? 0;
                              tongsoKH = tongsoKHCheck + 1;
                              if (isChecked) {
                                int? tongsoKHVipCheck = tongsoKHVip ?? 0;
                                tongsoKHVip = tongsoKHVipCheck + 1;
                              }
                              int? tongDoanhThuCheck = tongDoanhThu ?? 0;
                              int? tongtienCheck = tongtien ?? 0;
                              tongDoanhThu = tongDoanhThuCheck + tongtienCheck;
                              nameKHController?.clear();
                              soluongSachController?.clear();
                            });
                          },
                          child: Text(btnNext),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: const Text('AlertDialog description'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                          child: const Text(btnInfo),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(inforthongKe),
                CheckInfor(
                    textInforLabel: tongSoKHLabel,
                    textInforOutput: tongsoKH.toString()),
                CheckInfor(
                    textInforLabel: tongSoKHVipLabel,
                    textInforOutput: tongsoKHVip.toString()),
                CheckInfor(
                    textInforLabel: tongDoanhThuLabel,
                    textInforOutput: tongDoanhThu.toString()),
                SizedBox(
                  height: 20,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Text(""),
                    color: Colors.green,
                  ),
                ),
                IconButton(
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Confirm Logout'),
                            content: const Text('Are you want logout?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                    icon: Icon(Icons.logout))
              ])),
        ));
  }
}
