import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mybank/components/editor.dart';
import 'package:mybank/models/transfer.dart';

// App bar title.
const _titleAppBar = 'Criando Transferência';

// Label for field account.
const _labelFieldAccount = 'Número da conta';

// Hint for field account.
const _hintFieldAccount = '0000';

// Label for field value.
const _labelFieldValue = 'Valor';

// Hint for field value.
const _hintFieldValue = '0.00';

// Text for button confirm.
const _textButtonConfirm = 'Confirmar';

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
      appBar: AppBar(title: Text(_titleAppBar),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controller: _controllerFieldAccountNumber, label: _labelFieldAccount, hint: _hintFieldAccount),
            Editor(controller: _controllerFieldValue, label: _labelFieldValue, hint: _hintFieldValue, icon: Icons.monetization_on),
            RaisedButton(
              child: Text(_textButtonConfirm),
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
