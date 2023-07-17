import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseHelper
{
  static FireBaseHelper base=FireBaseHelper();

  FirebaseAuth auth=FirebaseAuth.instance;

  Future<String> anonymouslyGet()
  async {
    try
        {
          await auth.signInAnonymously();
          return "Succes";
        }
        catch(e)
          {
            return "Fallied";
          }
  }


  bool chechUser()
  {
    auth.currentUser;
    return auth==null;
  }


  Future<void> SignOut()
  async {
    await auth.signOut();
    // GoogleSignIn().signOut();
  }

  Future<String> createUser(String email,String password)
  async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Succes";
    }catch(e)
    {
      return "$e";
    }


  }


  Future<String> signin(String email,String password)
  async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Succes";
    }catch(e)
    {
      return "$e";
    }


  }


  Future<String> googleSignIn()
  async {

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try{
      await auth.signInWithCredential(credential);
      return "Succes";
    }catch(e)
    {
      return "$e";
    }
  }


}