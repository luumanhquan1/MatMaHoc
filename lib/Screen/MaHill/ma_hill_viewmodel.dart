import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:matmahoc/Heleper/tinh.dart';


class MaHillViewModel {
  List<String> table=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  StreamController<String> _deCode = StreamController<String>();

  Stream<String> get decode => _deCode.stream;
  StreamController<String> _enCode = StreamController<String>();

  Stream<String> get enCode => _enCode.stream;
  List<List<int?>> maTram=List.generate(100, (index) => List.generate(100, (index) => null));
void setMatran(int n){
  maTram=List.generate(n, (index) => List.generate(n, (index) => null));
}
  void setIndexMaTran(int i,int j,int kq){
    maTram[i][j]=kq;
  }
  void deCodeAction(String s,int n){
     List<List<int?>> reverseMatrix(List<List<int?>> keyMatrix) {
      int detmod26 = (keyMatrix[0][0]! * keyMatrix[1][1]! - keyMatrix[0][1]! * keyMatrix[1][0]!) % 26; // Calc det
      int factor;
      List<List<int?>> reverseMatrix = List.generate(2, (index) => List.generate(2, (index) => null));

      for(factor=1; factor < 26; factor++)
      {
        if((detmod26 * factor) % 26 == 1)
        {
          break;
        }
      }
      // Calculate the reverse key matrix elements using the factor found
      reverseMatrix[0][0] = keyMatrix[1][1]!           * factor % 26;
      reverseMatrix[0][1] = (26 - keyMatrix[0][1]!)    * factor % 26;
      reverseMatrix[1][0] = (26 - keyMatrix[1][0]!)    * factor % 26;
      reverseMatrix[1][1] = keyMatrix[0][0]   !        * factor % 26;
      return reverseMatrix;
    }

      int i, adder =  1 ;
      List<List<int?>>  revKeyMatrix;
    List<int> phraseToNum = [];
    List<int> phraseDecoded = [];
    // Delete all non-english characters, and convert phrase to upper case
    s = s.replaceAll("[^a-zA-Z]","").toUpperCase();

    List<String> mn=s.split('');
    for(i=0; i < s.length; i++) {
    phraseToNum.add(mn[i].codeUnits.first - (64 + adder));
    }
    revKeyMatrix = reverseMatrix(maTram);
    for(i=0; i < phraseToNum.length; i += 2) {
    phraseDecoded.add((revKeyMatrix[0][0]! * phraseToNum.elementAt(i) + revKeyMatrix[0][1]! * phraseToNum.elementAt(i+1)) % 26);
    phraseDecoded.add((revKeyMatrix[1][0]! * phraseToNum.elementAt(i) + revKeyMatrix[1][1]! * phraseToNum.elementAt(i+1)) % 26);
    }
      // Print the result
      // echoResult("Decoded phrase: ", adder, phraseDecoded);
     String a='';
    phraseDecoded.forEach((element) {
      a=a+table[element];
    });
     _deCode.sink.add(a);
  }
  void enCodeAction(String s,int n,alphaZero){
      int i;
      int adder =  1 ;
      List<int> phraseToNum = [];
      List<int> phraseEncoded = [];
      s = s.replaceAll("[^a-zA-Z]","").toUpperCase();
      if(s.length % 2 == 1) {
        s += "Q";
      }
      List<String> mn=s.split('');
      for(i=0; i < s.length; i++) {
        
        phraseToNum.add(mn[i].codeUnits.first - (64 + adder));
      }
      for(i=0; i < phraseToNum.length; i += 2) {
        int x = (maTram[0][0]! * phraseToNum.elementAt(i) + maTram[0][1]! * phraseToNum.elementAt(i+1)) % 26;
        int y = (maTram[1][0]! * phraseToNum.elementAt(i) + maTram[1][1]! * phraseToNum.elementAt(i+1)) % 26;
        phraseEncoded.add(alphaZero ? x : (x == 0 ? 26 : x ));
        phraseEncoded.add(alphaZero ? y : (y == 0 ? 26 : y ));
      }
      String a='';
     phraseEncoded.forEach((element) {
      a=a+table[element];
    });
     _enCode.sink.add(a);
  }
  void dispose() {
    _deCode.close();
    _enCode.close();
  }
}
