import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/MaHill/ma_hill_viewmodel.dart';
import 'package:matmahoc/Screen/MaHill/widgets/input_matrix_widget.dart';
import 'package:matmahoc/Screen/MaRSA/ma_rsa_viewmodel.dart';
import 'package:matmahoc/Screen/NhanBnhPhuongCoLap/nhan_binh_phuong_co_lap_viewmodel.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

class MaHillcreen extends StatefulWidget {
  const MaHillcreen({Key? key}) : super(key: key);

  @override
  _NhanBinhPhuongCoLapScreenState createState() =>
      _NhanBinhPhuongCoLapScreenState();
}

class _NhanBinhPhuongCoLapScreenState extends State<MaHillcreen> {
  MaHillViewModel viewModel = MaHillViewModel();
  TextEditingController n = TextEditingController();
  TextEditingController mess = TextEditingController();

  int doDai=2;
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
        title: Text('Ma Hill'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),

            for(int i=0;i<doDai;i++)
              for(int j=0;j<doDai;j++)
                InPutMaxtrix(i: i, j: j, onTap: (value){
                    viewModel.setIndexMaTran(i, j, int.parse(value));
                }
                ),
            BaseSearchBar(
              controller: mess,
              title: 'Kí tự',
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    try {
                      viewModel.enCodeAction(mess.text, 2,true);
                      // viewModel.tinh(int.parse(b.text),int.parse(q.text),int.parse(e.text),int.parse(c.text));
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
                    child: Text('Encode'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Kết quả:',
                  style: TextStyle(fontSize: 20),
                ),
                StreamBuilder<String>(
                    stream: viewModel.enCode,
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
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    try {
                      viewModel.deCodeAction(mess.text, 2);
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
                    child: Text('Decode'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Kết quả:',
                  style: TextStyle(fontSize: 20),
                ),
                StreamBuilder<String>(
                    stream: viewModel.decode,
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
          ],
        ),
      ),
    );
  }
}
