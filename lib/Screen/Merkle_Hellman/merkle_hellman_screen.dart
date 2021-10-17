import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:matmahoc/Screen/Merkle_Hellman/merkle_hellman_viewmodel.dart';
import 'package:matmahoc/Screen/Merkle_Hellman/widgets/input_matrix_widget.dart';

import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

class MerkleHellManScreen extends StatefulWidget {
  const MerkleHellManScreen({Key? key}) : super(key: key);

  @override
  _NhanBinhPhuongCoLapScreenState createState() =>
      _NhanBinhPhuongCoLapScreenState();
}

class _NhanBinhPhuongCoLapScreenState extends State<MerkleHellManScreen> {
  MerkleHellManViewModel viewModel = MerkleHellManViewModel();
  TextEditingController doDaiDaiSieuTang = TextEditingController();
  TextEditingController doDaiDayHoanVi = TextEditingController();
  TextEditingController M = TextEditingController();
  TextEditingController W = TextEditingController();
  TextEditingController m = TextEditingController();

  List<int> daySieuTang = [];
  int doDaiDaySieuTang = 0;
  List<int> dayHoanVi = [];
  int doDaiDaiHoanVi = 0;
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
        title: Text('Merkle_hellman'),
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
              controller: doDaiDaiSieuTang,
              title: 'độ dài dãy siêu tăng',
              onSubmit: (value) {
                try {
                  doDaiDaySieuTang = int.parse(value);
                  daySieuTang =
                      List.generate(doDaiDaySieuTang, (index) => -4892);
                  setState(() {});
                } catch (e) {}
              },
            ),
            Column(
              children: List.generate(doDaiDaySieuTang, (index) {
                return InPutMaxtrixHellMan(
                  onTap: (value) {
                    try {
                      daySieuTang[index] = int.parse(value);
                    } catch (e) {}
                  },
                  i: index,
                );
              }),
            ),
            BaseSearchBar(
              controller: M,
              title: 'M',
            ),
            BaseSearchBar(
              controller: W,
              title: 'W',
            ),
            BaseSearchBar(
              controller: doDaiDayHoanVi,
              title: 'độ dài dãy Hoán vị',
              onSubmit: (value) {
                try {
                  doDaiDaiHoanVi = int.parse(value);
                  dayHoanVi = List.generate(doDaiDaiHoanVi, (index) => -4892);
                  setState(() {});
                } catch (e) {}
              },
            ),
            Column(
              children: List.generate(doDaiDaiHoanVi, (index) {
                return InPutMaxtrixHellMan(
                  onTap: (value) {
                    try {
                      dayHoanVi[index] = int.parse(value);
                    } catch (e) {}
                  },
                  i: index,
                );
              }),
            ),
            BaseSearchBar(
              controller: m,
              title: 'bản mã m:',
            ),
            StreamBuilder<khoa>(
                stream: viewModel.nhanBinhPhuong,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Khóa Công khai:  ${data?.congKhai}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Khóa Bí mật:  ${data?.biMat}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'bản mã:  ${data?.banMa}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'bản rõ:  ${data?.banRo}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  );
                }),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                try {
                  viewModel.tinh(doDaiDaySieuTang, int.parse(M.text),
                      int.parse(W.text), daySieuTang, dayHoanVi, m.text);
                  // viewModel.tinh(int.parse(p.text), int.parse(apha.text),
                  //     int.parse(a.text), int.parse(x.text), int.parse(k.text));
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
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
