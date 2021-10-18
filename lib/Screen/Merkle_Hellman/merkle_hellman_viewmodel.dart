import 'dart:async';
import 'dart:developer';
//import 'dart:math';

class GenKey {
  List<int?> ke;
  List<dynamic> kd;

  GenKey(this.ke, this.kd);
}
class khoa{
  String congKhai='';
  String biMat='';
  String banMa='';
  String banRo='';

  khoa(this.congKhai, this.biMat, this.banMa, this.banRo);
}


class MerkleHellManViewModel {
  StreamController<khoa> _nhanBinhPhuong = StreamController<khoa>();
  int n = -1;
  int  M = -1;
  int  W = -1;
 List<int> daysieutang = [];
 List<int> hoanvi = [];
  Stream<khoa> get nhanBinhPhuong => _nhanBinhPhuong.stream;
  void tinh(int n,int M,int W,List<int> daysieutang,List<int> hoanvi,String m) {
  //  _nhanBinhPhuong.sink.add( khoa('','', '', ''));
    this.n=n;
    this.M=M;
    this.W=W;
    this.daysieutang=daysieutang;
    this.hoanvi=hoanvi;
    GenKey a = gen_key_Merkle_Hellman(n,M,W,daysieutang,hoanvi);
    print('Khóa công khai ${a.ke}');
    print('Khoá bí mật : ${a.kd}');
   int c = encrypt_Merkle_Hellman(a.ke,m);
    print('bản mã : ${c}(10)');
    m = decrypt_Merkle_Hellman(a,c);
    print('bản rõ : ${m}(2)');
    _nhanBinhPhuong.sink.add(  khoa(a.ke.toString(), a.kd.toString(), '${c}(10)', '${m}(2)'));
    // _nhanBinhPhuong.sink.add(KetQua(y,s));
  }

  GenKey gen_key_Merkle_Hellman(
      int n, int M, int W, List<int> daysieutang, List<int> hoanvi) {
    List<int?> arr = List.generate(n, (index) => null);
    for (int i = 0; i < n; i++) {
      arr[i] = daysieutang[hoanvi[i] - 1];
    }
    for (int i = 0; i < n; i++) {
      arr[i] = arr[i]! * W % M;
    }
    List<int?> ke = arr;
    List<dynamic> kd = [hoanvi, M, W, daysieutang];
    return GenKey(ke, kd);
  }

  int encrypt_Merkle_Hellman(List<int?> ke, String m) {
    int c = 0;
    for (int i = 0; i < m.length; i++) {
      if (m[i] == "1") {
        c += ke[i]!;
      }
    }
    return c;
  }
  String decrypt_Merkle_Hellman(GenKey kd,int c) {
    List<int> hoanvi=kd.kd[0];
    int M=kd.kd[1];
    int W=kd.kd[2];
    List<int> daysieutang=kd.kd[3];
   int d = c*pown(W,M)%M;
   log('d= $d');
  int S = d;
  List arr = [];
  log(daysieutang.toString());
  for(int i=daysieutang.length-1;i>=0;i-- ) {
    if (S >= daysieutang[i]) {
      arr.add('1');
      S = S - daysieutang[i];
    } else {
      arr.add('0');
    }
  }
  log(arr.toString());
    List a=List.generate(arr.length, (index) => null);
    for(int i=arr.length-1;i>=0;i--){
      a[i]=arr[hoanvi[i]-1];
    }
   return a.join();

  }
  int pown(int a,int b)
  {
    int luu=b;
    int q,r,x,y;
    int x1=0;
    int x2=1;
    int y2=0;
    int y1=1;
    while(b>0)
    {
      q=(a/b).floor();
      r=a-q*b;
      x=x2-x1*q;
      y=y2-y1*q;
      a=b;
      b=r;
      x2=x1;
      x1=x;
      y2=y1;
      y1=y;
      if(b<=0){
        break;
      }
    }
    if(x2<0){
      return luu+x2;
    }
    return x2;
  }
  void dispose() {
    _nhanBinhPhuong.close();
  }
}
