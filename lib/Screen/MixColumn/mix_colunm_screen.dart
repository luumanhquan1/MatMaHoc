import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/GiaTriLonNhatZ83/gia_tri_lon_nhat_z_viewmodel.dart';
import 'package:matmahoc/Screen/MixColumn/mix_column_viewmodel.dart';

import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

class MixColumnScreen extends StatefulWidget {
  const MixColumnScreen({Key? key}) : super(key: key);

  @override
  _NhanBinhPhuongCoLapScreenState createState() =>
      _NhanBinhPhuongCoLapScreenState();
}

class _NhanBinhPhuongCoLapScreenState extends State<MixColumnScreen> {
  MixColunmViewModel viewModel = MixColunmViewModel();
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Mix Colunm'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text('Nhập cột cần tính',
              style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            BaseSearchBar(
              controller: a,
              title: 'a',
            ),
            BaseSearchBar(
              controller: b,
              title: 'b',
            ),
            BaseSearchBar(
              controller: c,
              title: 'c',
            ),
            BaseSearchBar(
              controller: d,
              title: 'd',
            ),
            Row(
              children: [
                Text(
                  'Kết quả:',
                  style: TextStyle(fontSize: 20),
                ),
                StreamBuilder<String>(
                    stream: viewModel.nhanBinhPhuong,
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      return Text(
                        '$data',
                        style: TextStyle(fontSize: 20),
                      );
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                try {
                  viewModel.mixColum(int.parse("0x${a.text}"), int.parse("0x${b.text}"), int.parse("0x${c.text}"), int.parse("0x${d.text}"));
                } catch (e) {}
              },
              child: Container(
                height: 30,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text('Tính giá trị'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
