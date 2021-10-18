import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/MaRSA/ma_rsa_viewmodel.dart';
import 'package:matmahoc/Screen/NhanBnhPhuongCoLap/nhan_binh_phuong_co_lap_viewmodel.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

class MaRSAScreen extends StatefulWidget {
  const MaRSAScreen({Key? key}) : super(key: key);

  @override
  _NhanBinhPhuongCoLapScreenState createState() =>
      _NhanBinhPhuongCoLapScreenState();
}

class _NhanBinhPhuongCoLapScreenState extends State<MaRSAScreen> {
  MaRSAViewModel viewModel = MaRSAViewModel();
  TextEditingController q = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController e = TextEditingController();
  TextEditingController m = TextEditingController();
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
        title: Text('Mã RSA'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            BaseSearchBar(
              controller: b,
              title: 'p',
            ),
            BaseSearchBar(
              controller: q,
              title: 'q',
            ),
            BaseSearchBar(
              controller: e,
              title: 'e',
            ),
            BaseSearchBar(
              controller: m,
              title: 'Bản rõ: ',
            ),
            BaseSearchBar(
              controller: c,
              title: 'Bản mã: ',
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
                  viewModel.tinh(false,int.parse(b.text),int.parse(q.text),int.parse(e.text),int.parse(c.text),int.parse(m.text));
                } catch (e) {

                }
              },
              child: Container(
                margin: EdgeInsets.all(20.0),
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text('Giải mã' ,style: TextStyle(fontSize: 20.0)),
              ),
            ),
            GestureDetector(
              onTap: () {
                try {
                  viewModel.tinh(true,int.parse(b.text),int.parse(q.text),int.parse(e.text),int.parse(c.text),int.parse(m.text));
                } catch (e) {

                }
              },
              child: Container(
                height: 50,
                width: 200,
                margin: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text('Mã hóa', style: TextStyle(fontSize: 20.0),),
              ),
            ),
            Text('Mã hóa nhập bản mã là 0\nGiải mã nhập bản rõ là 0', style: TextStyle(fontSize: 20.0),),
          ],
        ),
      ),
    );
  }
}
