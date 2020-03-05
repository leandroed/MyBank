import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mybank/components/editor.dart';
import 'package:mybank/models/transfer.dart';

/// Transfer form.
class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

// State class for transfer form widget.
class TransferFormState extends State<TransferForm> {
  // instance for access form field value
  final TextEditingController _controllerFieldAccountNumber = TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controller: _controllerFieldAccountNumber, label: 'Número da conta', hint: '0000'),
            Editor(controller: _controllerFieldValue, label: 'Valor', hint: '0.00', icon: Icons.monetization_on),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _createTransfer(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    final double value = double.tryParse(_controllerFieldValue.text);
    
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      debugPrint('$createdTransfer');
      Navigator.pop(context, createdTransfer);
    }
  }
}
