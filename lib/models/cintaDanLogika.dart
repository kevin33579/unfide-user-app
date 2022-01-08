part of 'models.dart';

class CintaDanLogika extends Equatable{
  final String uid;
  final String dataCintaDanLogika;
  final String createdAt;
  final String updatedAt;
  final int likes;


  CintaDanLogika(
      this.uid,
      this.dataCintaDanLogika,
      this.createdAt,
      this.updatedAt,
      this.likes,

      );

  @override
  List<Object> get props => [
    uid,
    dataCintaDanLogika,
    createdAt,
    updatedAt,
    likes,
  ];


}