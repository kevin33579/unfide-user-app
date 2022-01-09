part of 'services.dart';

class SabtuServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference sabtuCollection =
  FirebaseFirestore.instance.collection("sabtu");
  static DocumentReference? sabtuDocument;

  static Reference? ref;
  static UploadTask? uploadTask;

  static Future<bool> addData(String nama, String jam) async {
    String uid = auth.currentUser!.uid;
    await Firebase.initializeApp();
    sabtuDocument = await sabtuCollection.add({
      'sabtuUid': uid,
      'sabtuNama': nama,
      'sabtuJam': jam,
    });
    if (sabtuDocument != null) {
      sabtuCollection.doc(sabtuDocument!.id).update({});
      return true;
    } else {
      return false;
    }
  }
}
