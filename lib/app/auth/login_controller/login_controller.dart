import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sdrive/general/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  var isLoading = false.obs;
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);
  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
  }

  loin(context) async {
    try {
      isLoading(true);
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        User? user = userCredential.user!;
        userCollection.doc(user.uid).set({
          "username": user.displayName,
          "profilepic": user.photoURL,
          "email": user.email,
          "uid": user.uid,
          "userCreated": DateTime.now(),
        });
      }
      isLoading(false);
      VxToast.show(context, msg: "Wellcome");
    } catch (e) {
      VxToast.show(context, msg: "Please try againg letter");
      isLoading(false);
    }
  }
}
