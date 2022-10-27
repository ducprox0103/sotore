import 'package:appdemo/HocPhanObj.dart';
import 'package:flutter/material.dart';

//Xay dung mot class co 4 thuoc tinh
// Dung stack

class TinChiPage extends StatelessWidget {
  TinChiPage({super.key});
  List<HocPhanObj> dshp = [
    HocPhanObj("[2021-2022.2] - Thực tập viết niên luận - Nhóm 3",
        "2021-2022.TIN3142.003", 7),
    HocPhanObj(
        "[2021-2022.2] - Công nghệ XML - Nhóm 1", "2021-2022.TIN4412.001", 10),
    HocPhanObj("[2021-2022.2] - Lập trình Front - End - Nhóm 12",
        "2021-2022.TIN3092.012", 38),
    HocPhanObj("[2021-2022.2] - Lập trình Front - End - Nhóm 11",
        "2021-2022.TIN3092.011", 10),
    HocPhanObj("[2021-2022.2] - Lập trình Front - End - Nhóm 10",
        "2021-2022.TIN3092.010", 10),
  ];

  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...dshp.map((e) {
              i++;
              String s = "assets/images/img_" + i.toString() + ".jpg";
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(s),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                e.TenHP,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                            DropdownButtonExample(),
                            // DropdownButton<String>(
                            //   value: dropdownvalue,
                            //   items: items
                            //       .map((e) => DropdownMenuItem<String>(
                            //           child: Text(e), value: e))
                            //       .toList(),
                            //   onChanged: (e) {
                            //     dropdownvalue = e;
                            //   },
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              e.MaHP,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    Row(
                      children: [
                        Text(e.SLSV.toString() + " Học viên",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                decoration: TextDecoration.none))
                      ],
                    )
                  ],
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}

List<String> list = <String>['Thêm', 'Sửa', 'Xóa'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: null,
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        style: const TextStyle(color: Colors.black),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            // dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
