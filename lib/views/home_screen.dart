import 'package:flutter/material.dart';
import 'package:statelessonpractice/resources/strings.dart';
import 'package:statelessonpractice/resources/widgets/infor_widget.dart';

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
  @override
  Widget build(BuildContext context) {
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
                InforWidget(
                  textInfor: thanhTienLabel,
                  inputInfor: tongtien.toString(),
                  controller: soluongSachController,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {},
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
              ])),
        ));
  }
}
