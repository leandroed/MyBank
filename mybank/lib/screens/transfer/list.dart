import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mybank/models/transfer.dart';
import 'package:mybank/screens/transfer/form.dart';

// App bar title.
const _titleAppBar = 'Transferências';

/// Column widget with list of transfers. 
class TransfersList extends StatefulWidget {
  // List of transfers.
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return TransfersListState();
  }
}

// Transfer list state for statefull widget.
class TransfersListState extends State<TransfersList> {
  // For access list of transfer on TransfersList class, the object 'widget' is required for this task.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), 
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          })).then((receivedTransfer) => _update(receivedTransfer));
          Future.delayed(Duration(seconds: 1), () {
            debugPrint('delayed debug message.');
          });
        },
      ),
    );
  }

  // Update transfer list.
  void _update(Transfer receivedTransfer) {
    if (receivedTransfer != null) {
      setState(() {
        widget._transfers.add(receivedTransfer);
      });
    }
  }
}

/// Card widget with details of bank transfers.
class TransferItem extends StatelessWidget {
  // Transfer data.
  final Transfer _transfer;

  // Initialize card with bank information values.
  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}
