import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/Jacobi/jacobi_viewmodel.dart';
import 'package:matmahoc/Screen/MaRSA/ma_rsa_viewmodel.dart';
import 'package:matmahoc/Screen/NhanBnhPhuongCoLap/nhan_binh_phuong_co_lap_viewmodel.dart';
import 'package:matmahoc/Screen/TimNghicDao/tim_nghich_dao_viewmodel.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

class JacobiScreen extends StatefulWidget {
  const JacobiScreen({Key? key}) : super(key: key);

  @override
  _NhanBinhPhuongCoLapScreenState createState() =>
      _NhanBinhPhuongCoLapScreenState();
}

class _NhanBinhPhuongCoLapScreenState extends State<JacobiScreen> {
  JacoBiViewModel viewModel = JacoBiViewModel();
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController e = TextEditingController();
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
        title: Text('Jacobi'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text('(A/B)',style: TextStyle(fontSize: 50),),
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
            Row(
              children: [
                Text(
                  'Kết quả:',
                  style: TextStyle(fontSize: 20),
                ),
                StreamBuilder<int>(
                    stream: viewModel.nhanBinhPhuong,
                    builder: (context, snapshot) {
                      final data = snapshot.data ?? '';
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
                  viewModel.tinh(int.parse(a.text),int.parse(b.text));
                } catch (e) {

                }
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
