part of 'widgets.dart';

class jumatCard extends StatefulWidget {
  final Jumat jumat;

  jumatCard({required this.jumat});

  @override
  _jumatCardState createState() => _jumatCardState();
}

class _jumatCardState extends State<jumatCard> {
  @override
  Widget build(BuildContext context) {
    Jumat jumat = widget.jumat;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              title: Text(
                jumat.namaPsikolog,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                maxLines: 1,
                softWrap: true,
              ),
              subtitle: Text(
                jumat.jam,
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
