import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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




}