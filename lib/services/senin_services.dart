part of 'services.dart';

class SeninServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference seninCollection =
  FirebaseFirestore.instance.collection("senin");
  static DocumentReference? seninDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(String nama, String jam) async {
    String uid = auth.currentUser!.uid;
    await Firebase.initializeApp();
    seninDocument = await seninCollection.add({
      'seninUid': uid,
      'seninNama': nama,
      'seninJam': jam,
    });
    if (seninDocument != null) {
      seninCollection.doc(seninDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
