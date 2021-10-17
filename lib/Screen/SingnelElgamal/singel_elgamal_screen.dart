import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/GiaTriLonNhatZ83/gia_tri_lon_nhat_z_viewmodel.dart';
import 'package:matmahoc/Screen/NhanBnhPhuongCoLap/nhan_binh_phuong_co_lap_viewmodel.dart';
import 'package:matmahoc/Screen/SingnelElgamal/signel_elgamal_viewmodel.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

class SingelElgamalScreen extends StatefulWidget {
  const SingelElgamalScreen({Key? key}) : super(key: key);

  @override
  _NhanBinhPhuongCoLapScreenState createState() =>
      _NhanBinhPhuongCoLapScreenState();
}

class _NhanBinhPhuongCoLapScreenState extends State<SingelElgamalScreen> {
  SingelElgamalViewModel viewModel = SingelElgamalViewModel();
  TextEditingController p = TextEditingController();
  TextEditingController apha = TextEditingController();
  TextEditingController a = TextEditingController();
  TextEditingController x = TextEditingController();
  TextEditingController k = TextEditingController();
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
        title: Text('Singel elgamal'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            BaseSearchBar(
              controller: p,
              title: 'p',
            ),
            BaseSearchBar(
              controller: apha,
              title: 'apha',
            ),
            BaseSearchBar(
              controller: a,
              title: 'a',
            ),
            BaseSearchBar(
              controller: x,
              title: 'x',
            ),
            BaseSearchBar(
              controller: k,
              title: 'k',
            ),
            Row(
              children: [
                Text(
                  'Kết quả:',
                  style: TextStyle(fontSize: 20),
                ),
                StreamBuilder<KetQua>(
                    stream: viewModel.nhanBinhPhuong,
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      return Text(
                        'y=${data?.y},s=${data?.s}',
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
                  viewModel.tinh(int.parse(p.text), int.parse(apha.text),
                      int.parse(a.text), int.parse(x.text), int.parse(k.text));
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
