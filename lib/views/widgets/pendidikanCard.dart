part of 'widgets.dart';

class pendidikanCard extends StatefulWidget {
  final Pendidikan pendidikan;

  pendidikanCard({required this.pendidikan});

  @override
  _pendidikanCardState createState() => _pendidikanCardState();
}

class _pendidikanCardState extends State<pendidikanCard> {
  @override
  Widget build(BuildContext context) {
    Pendidikan pendidikan = widget.pendidikan;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              subtitle: Text(
                pendidikan.dataPendidikan,
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
                Text(''+pendidikan.likes.toString()+' '),
                Text(''+pendidikan.createdAt),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
