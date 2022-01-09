part of 'models.dart';

class Senin extends Equatable {
  String uid;
  String namaPsikolog;
  String jam;

  Senin(this.uid, this.namaPsikolog, this.jam);

  @override
  List<Object?> get props => [
        uid,
        namaPsikolog,
        jam,
      ];
}
