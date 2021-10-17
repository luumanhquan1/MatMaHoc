import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/CapCuaPhanTu/cap_cua_phan_tu_viewmodel.dart';
import 'package:matmahoc/Screen/GiaTriLonNhatZ83/gia_tri_lon_nhat_z_viewmodel.dart';
import 'package:matmahoc/Screen/NhanBnhPhuongCoLap/nhan_binh_phuong_co_lap_viewmodel.dart';
import 'package:matmahoc/Screen/widget.dart/base_search_bar.dart';

class CapCuaPhanTuScreen extends StatefulWidget {
  const CapCuaPhanTuScreen({Key? key}) : super(key: key);

  @override
  _NhanBinhPhuongCoLapScreenState createState() =>
      _NhanBinhPhuongCoLapScreenState();
}

class _NhanBinhPhuongCoLapScreenState extends State<CapCuaPhanTuScreen> {
  CapCuaPhanTuViewModel viewModel = CapCuaPhanTuViewModel();

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
        title: Text('Cấp của phần tử z*n'),
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
            StreamBuilder<List<CapVaBac>>(
              stream: viewModel.nhanBinhPhuong,
              builder: (context, snapshot) {
                final data=snapshot.data??[];
                if(data.isNotEmpty){
                  return Column(
                    children: List.generate(data.length, (index){
                      final vl=data[index];
                      return  Text('a:${vl.cap} có bậc là ${vl.bac}',style: TextStyle(fontSize: 20),);
                    }),
                  );
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
