part of 'models.dart';

class Sabtu extends Equatable {
  String uid;
  String namaPsikolog;
  String jam;

  Sabtu(this.uid, this.namaPsikolog, this.jam);

  @override
  List<Object?> get props => [
    uid,
    namaPsikolog,
    jam,
  ];
}
