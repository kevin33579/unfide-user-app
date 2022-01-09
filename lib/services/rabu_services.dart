part of 'services.dart';

class RabuServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference rabuCollection =
  FirebaseFirestore.instance.collection("rabu");
  static DocumentReference? rabuDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(String nama, String jam) async {
    String uid = auth.currentUser!.uid;
    await Firebase.initializeApp();
    rabuDocument = await rabuCollection.add({
      'rabuUid': uid,
      'rabuNama': nama,
      'rabuJam': jam,
    });
    if (rabuDocument != null) {
      rabuCollection.doc(rabuDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
