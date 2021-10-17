import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matmahoc/Screen/CapCuaPhanTu/cap_cua_phan_tu_screen.dart';
import 'package:matmahoc/Screen/GiaTriLonNhatZ83/gia_tri_lon_nhat_screen.dart';
import 'package:matmahoc/Screen/Jacobi/jacobi_screen.dart';
import 'package:matmahoc/Screen/MaHill/ma_hill_screen.dart';
import 'package:matmahoc/Screen/MaRSA/ma_rsa_screen.dart';
import 'package:matmahoc/Screen/PhanTuSinhTrongZn/phan_tu_sinh_screen.dart';
import 'package:matmahoc/Screen/TimNghicDao/tim_nghich_dao_screen.dart';
import 'package:matmahoc/Screen/ma_affine/affine_screen.dart';
import 'package:matmahoc/Screen/ma_dich_vong/ma_dich_vong_screen.dart';
import 'package:matmahoc/Screen/ma_vigenere/ma_vigenere_screen.dart';

import 'Screen/NhanBnhPhuongCoLap/nhan_binh_phuong_co_lap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CellWidget(title: 'Nhân bình phương có lặp', onTap: (){
              Navigator.push(
                  context,
                  PageRouteBuilder(
                  pageBuilder: (_, __, ___) => NhanBinhPhuongCoLapScreen()),
              );
            }),
            CellWidget(title: 'Mã RSA', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaRSAScreen()),
              );
            }),
            CellWidget(title: 'Giá trị lớn nhất của Z*n', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => GiaTriLonNhatScreen()),
              );
            }),
            CellWidget(title: 'Mã hill', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaHillcreen()),
              );
            }),
            CellWidget(title: 'Cấp của phần tử trong Z(n)', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => CapCuaPhanTuScreen()),
              );
            }),
            CellWidget(title: 'Phần tử sinh trong Z(n)', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => PhanTuSinhScreen()),
              );
            }),
            CellWidget(title: 'Tìm nghịch đảo', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => TimNghichDaoScreen()),
              );
            }),
            CellWidget(title: 'Mã dịch vòng', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaDichVongScreen()),
              );
            }),
            CellWidget(title: 'Mã Affine', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaAffineScreen()),
              );
            }),
            CellWidget(title: 'Mã Vigenere', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MaVigenereScreen()),
              );
            }),
            CellWidget(title: 'Tính jacobi(A/b)', onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => JacobiScreen()),
              );
            }),
            CellWidget(title: 'Nhân bình phương có lặp', onTap: (){}),
            CellWidget(title: 'Nhân bình phương có lặp', onTap: (){}),
          ],
        ),
      )
    );
  }
}
class CellWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const CellWidget({Key? key,required this.title,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}

