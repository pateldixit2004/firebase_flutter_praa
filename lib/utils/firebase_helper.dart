import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_pra/screen/model/peoduct_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseHelper {
  static FireBaseHelper base = FireBaseHelper._();

  FireBaseHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<String> anonymouslyGet() async {
    try {
      await auth.signInAnonymously();
      return "Succes";
    } catch (e) {
      return "Fallied";
    }
  }

  bool chechUser() {
    User? user=auth.currentUser;
    return user != null;
  }

  Future<void> SignOut() async {
    await auth.signOut();
    GoogleSignIn().signOut();
  }

  Future<String> createUser(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Succes";
    } catch (e) {
      return "$e";
    }
  }

  Future<String> signin(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Succes";
    } catch (e) {
      return "$e";
    }
  }

  Future<String> googleSignIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      await auth.signInWithCredential(credential);
      return "Succes";
    } catch (e) {
      return "$e";
    }
  }

  Map<String, dynamic> userData() {
    User? user = auth.currentUser;
    var email = user!.email;
    var photo = user.photoURL;
    var name = user.displayName;
    return {"email": email, "img": photo, "name": name};
  }

  // =====================================

  void insertproductDeta(ProductModel model) {
    firestore.collection("Product").add({
      "name": model.name,
      "price": model.price,
      "cate": model.cate,
      "img": model.img,
      "dec": model.dec
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readProductData() {
    return firestore.collection("Product").snapshots();
  }

  void deleteProduct(String id) {
    firestore.collection("Product").doc("${id}").delete();
  }

  void updateProductData(ProductModel model) {
    firestore.collection("Product").doc("${model.id}").set({
      "name": model.name,
      "price": model.price,
      "cate": model.cate,
      "img": model.img,
      "dec": model.dec

    });
  }
}
