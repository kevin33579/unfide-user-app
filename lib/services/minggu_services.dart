part of 'services.dart';

class MingguServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference mingguCollection =
  FirebaseFirestore.instance.collection("minggu");
  static DocumentReference? mingguDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(String nama, String jam) async {
    String uid = auth.currentUser!.uid;
    await Firebase.initializeApp();
    mingguDocument = await mingguCollection.add({
      'mingguUid': uid,
      'mingguNama': nama,
      'mingguJam': jam,
    });
    if (mingguDocument != null) {
      mingguCollection.doc(mingguDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
