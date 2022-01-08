part of 'widgets.dart';

class KesehatanCard extends StatefulWidget {
  final Kesehatan kesehatan;

  KesehatanCard({required this.kesehatan});

  @override
  _KesehatanCardState createState() => _KesehatanCardState();
}

class _KesehatanCardState extends State<KesehatanCard> {
  @override
  Widget build(BuildContext context) {
    Kesehatan kesehatan = widget.kesehatan;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              subtitle: Text(
                kesehatan.dataKesehatan,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed:() {

                  },
                  icon: Image.asset('assets/icons/j.png'),
                ),
                Text(''+kesehatan.likes.toString()+' '),
                Text(''+kesehatan.createdAt),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
