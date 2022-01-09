part of 'services.dart';

class JumatServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference jumatCollection =
  FirebaseFirestore.instance.collection("jumat");
  static DocumentReference? jumatDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(String nama, String jam) async {
    String uid = auth.currentUser!.uid;
    await Firebase.initializeApp();
    jumatDocument = await jumatCollection.add({
      'jumatUid': uid,
      'jumatNama': nama,
      'jumatJam': jam,
    });
    if (jumatDocument != null) {
      jumatCollection.doc(jumatDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
