
import 'package:flutter/material.dart';

import 'package:matmahoc/Screen/PhanTuSinhTrongZn/phan_tu_sinh_viewmodel.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

class PhanTuSinhScreen extends StatefulWidget {
  const PhanTuSinhScreen({Key? key}) : super(key: key);

  @override
  _NhanBinhPhuongCoLapScreenState createState() =>
      _NhanBinhPhuongCoLapScreenState();
}

class _NhanBinhPhuongCoLapScreenState extends State<PhanTuSinhScreen> {
  PhanTuSinhViewModel viewModel = PhanTuSinhViewModel();

  TextEditingController n = TextEditingController();
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
        title: Text('Phần tử sinh z*n'),
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
              controller: n,
              title: 'n',
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                try {
                  viewModel.tinh(int.parse(n.text));
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
            StreamBuilder<String>(
              stream: viewModel.nhanBinhPhuong,
              builder: (context, snapshot) {
                final data=snapshot.data??'';
                if(data.isNotEmpty){
                  return Text(data,style: TextStyle(fontSize: 20),);
                }
                return SizedBox();
              }
            )
          ],
        ),
      ),
    );
  }
}
