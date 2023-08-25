import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/data/models/user_data_model.dart';

class DataSource {
  // static bool isLoadingProfile = true;
  //
  // static Future<UserDataModel?> getDataFromFirebase()async{
  //   try{
  //     String? uid = FirebaseAuth.instance.currentUser!.uid;
  //     UserDataModel user ;
  //     DocumentSnapshot userA = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //     user = UserDataModel(
  //         name: userA['name'],
  //         email: userA['email'],
  //         phone: userA['phone']
  //     );
  //     return user;
  //   } catch(e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
  //
  // static UserDataModel? userData;

}