part of 'widgets.dart';

class rabuCard extends StatefulWidget {
  final Rabu rabu;

  rabuCard({required this.rabu});

  @override
  _rabuCardState createState() => _rabuCardState();
}

class _rabuCardState extends State<rabuCard> {
  @override
  Widget build(BuildContext context) {
    Rabu rabu = widget.rabu;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              title: Text(
                rabu.namaPsikolog,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
              subtitle: Text(
                rabu.jam,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
