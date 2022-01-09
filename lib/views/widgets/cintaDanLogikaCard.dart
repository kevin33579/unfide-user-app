part of 'widgets.dart';

class CintaDanLogikaCard extends StatefulWidget {
  final CintaDanLogika cintaDanLogika;

  CintaDanLogikaCard({required this.cintaDanLogika});

  @override
  _CintaDanLogikaCardState createState() => _CintaDanLogikaCardState();
}

class _CintaDanLogikaCardState extends State<CintaDanLogikaCard> {
  @override
  Widget build(BuildContext context) {
    CintaDanLogika cintaDanLogika = widget.cintaDanLogika;
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              subtitle: Text(
                cintaDanLogika.dataCintaDanLogika,
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
                Text(''+cintaDanLogika.likes.toString()+' '),
                Text(''+cintaDanLogika.createdAt),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
