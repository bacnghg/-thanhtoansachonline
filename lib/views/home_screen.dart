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
  int? tongtien;
  int? tongsoKH;
  int? tongsoKHVip;
  int? tongDoanhThu;

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
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
              child: Column(children: [
                Text(inforHoaDon, textAlign: TextAlign.left),
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
                              int? textToSendBack =
                                  int.parse(soluongSachController!.text);
                              if (textToSendBack != null) {
                                print("Khởi chạy checked");
                                tongtien = textToSendBack * 20000;
                                print(tongtien);
                              }
                            });
                          },
                          child: Text(btnSum),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(btnNext),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(btnInfo),
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
                    textInforOutput: tongDoanhThu.toString())
              ])),
        ));
  }
}
