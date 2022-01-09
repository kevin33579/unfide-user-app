part of 'models.dart';

class Kamis extends Equatable {
  String uid;
  String namaPsikolog;
  String jam;

  Kamis(this.uid, this.namaPsikolog, this.jam);

  @override
  List<Object?> get props => [
    uid,
    namaPsikolog,
    jam,
  ];
}
