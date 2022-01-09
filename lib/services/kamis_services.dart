part of 'services.dart';

class KamisServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference kamisCollection =
  FirebaseFirestore.instance.collection("kamis");
  static DocumentReference? kamisDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(String nama, String jam) async {
    String uid = auth.currentUser!.uid;
    await Firebase.initializeApp();
    kamisDocument = await kamisCollection.add({
      'kamisUid': uid,
      'kamisNama': nama,
      'kamisJam': jam,
    });
    if (kamisDocument != null) {
      kamisCollection.doc(kamisDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
