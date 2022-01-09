part of 'widgets.dart';

class selasaCard extends StatefulWidget {
  final Selasa selasa;

  selasaCard({required this.selasa});

  @override
  _selasaCardState createState() => _selasaCardState();
}

class _selasaCardState extends State<selasaCard> {
  @override
  Widget build(BuildContext context) {
    Selasa selasa = widget.selasa;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              title: Text(
                selasa.namaPsikolog,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
              subtitle: Text(
                selasa.jam,
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
