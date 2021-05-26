import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'models/FidCard.dart';

class MainScreen extends StatefulWidget {
  @override
  FidCards createState() => FidCards();
}

class FidCards extends State<MainScreen> {

  static List<FidCard> CARD_LIST = new List<FidCard>();

  static List<ExpansionTile> cardExpand = new List<ExpansionTile>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cartes de fidélité"),
      ),
      body:  ListCardBarcode(),
      floatingActionButton: FloatingActionButton(
         onPressed: () => _addFidCard(context),
        tooltip: 'Nouvelle carte de fidélité',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  static loadCardList(){

    for(int i =0;i<FidCards.CARD_LIST.length;i++){
      FidCard card = FidCards.CARD_LIST.elementAt(i);
        FidCards.cardExpand.add(ExpansionTile(title : Row(children: [Text(card.name)]),
            children: [BarcodeWidget(
              barcode: Barcode.code128(),
              data: card.barcodeValue,
              width: 150,
              height: 150,
            )]
        )
        );

    }



  }

  Future<void> _addFidCard(BuildContext context) async {

    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (_) {
          return ScanDialog();
        });
  }


}

class ListCardBarcode extends StatefulWidget {

  @override
  _newListCardBarcpde createState() => new _newListCardBarcpde();

  /*ListView(
          children: FidCards.cardExpand
      )*/
}

class _newListCardBarcpde extends State<ListCardBarcode> {

  List<ExpansionTile> listExpandCard = new List<ExpansionTile>();

  Widget build(BuildContext context) {
    return ListView(
    children: this.listExpandCard
    );
  }


}

class ScanDialog extends StatefulWidget {
  @override
  _newFidCardDialog createState() => new _newFidCardDialog();
}

class _newFidCardDialog extends State<ScanDialog> {

  String barcode = "";
  FidCard fidcARD = new FidCard();
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nouvelle carte'),
      content: SingleChildScrollView(
        child: Column(children: [
          Text("Nom"),
          TextField(onChanged: (nameSel) => {
            this.fidcARD.name = nameSel
          }),
          ElevatedButton(
          onPressed: () => scanCode(),
          child: Row(children: [Text("Scanner une carte")]),
        ),
          Text(this.barcode)])
      ),

      actions: <Widget>[
        TextButton(
          child: const Text('Ajouter'),
          onPressed: () => {
              FidCards.CARD_LIST.add(this.fidcARD),
              FidCards.loadCardList(),
              Navigator.of(context).pop(fidcARD)
           }
        ),
      ],
    );
  }

  Future scanCode() async{

    try{
      ScanResult result = await BarcodeScanner.scan();
      setState(() {
        this.barcode = result.rawContent;

        this.fidcARD.barcodeValue = this.barcode;


      });

    }catch(e){
    }

  }
}