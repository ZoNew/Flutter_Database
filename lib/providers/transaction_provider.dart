import 'package:flutter/foundation.dart';
import 'package:flutter_and_database/database/transaction_db.dart';
import 'package:flutter_and_database/models/Transactions.dart';

class TransactionProvider with ChangeNotifier{
  List<Transactions> transactions = [];

  // ดึงข้อมูล
  List<Transactions> getTransaction(){
    return transactions;
  }

  void initData() async{
    var db = TransactionDB(dbName: "transactions.db");
    // ดึงข้อมูลมาแสดงผล
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async{
    var db = TransactionDB(dbName: "transactions.db");
    // บันทึกข้อมูล
    await db.InsertData(statement);

    // ดึงข้อมูลมาแสดงผล
    transactions = await db.loadAllData();
    // แจ้งเตือน consumer
    notifyListeners();
  }
}




