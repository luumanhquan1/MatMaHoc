class TinhA{
 static int mod( int a,int b){
    int kq;
    kq=a%b;
    return kq<0?kq+b:kq;
  }
  static int UCLL(int a,int b){
    int A=a;
    int B=b;
    while(B>0){
      int R=mod(A,B);
      A=B;
      B=R;
    }
    return A;
  }
}