import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<QuerySnapshot<Map<String, dynamic>>> getRakData() async {
    return FirebaseFirestore.instance.collection("rak-buku").get();
  }
}
