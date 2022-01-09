part of 'models.dart';

class Rabu extends Equatable {
  String uid;
  String namaPsikolog;
  String jam;

  Rabu(this.uid, this.namaPsikolog, this.jam);

  @override
  List<Object?> get props => [
    uid,
    namaPsikolog,
    jam,
  ];
}
