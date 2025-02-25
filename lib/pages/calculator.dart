import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double currentValue = 0;
  String displayHistory = "";
  String? operation;
  double? lastInput;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _handleOperator(String op) {
    if (_controller.text.isNotEmpty) {
      double inputValue = _parseNumber(_controller.text);

      setState(() {
        if (operation == "+") {
          currentValue += inputValue;
        } else if (operation == "-") {
          currentValue -= inputValue;
        } else {
          currentValue = inputValue;
        }

        displayHistory = "$currentValue $op";
        operation = op;
        lastInput = inputValue;
        _controller.clear();
      });
      _requestFocus();
    } else if (operation == null) {
      setState(() {
        operation = op;
        displayHistory = "$currentValue $op";
      });
    }
  }

  void _calculateResult() {
    if (_controller.text.isNotEmpty) {
      double inputValue = _parseNumber(_controller.text);

      setState(() {
        if (operation == "+") {
          currentValue += inputValue;
        } else if (operation == "-") {
          currentValue -= inputValue;
        }

        displayHistory = "$displayHistory $inputValue";
        operation = null;
        lastInput = inputValue;
        _controller.clear();
      });
      _requestFocus();
    }
  }

  void _resetCalculator() {
    setState(() {
      currentValue = 0;
      displayHistory = "";
      operation = null;
      lastInput = null;
      _controller.clear();
    });
    _requestFocus();
  }

  double _parseNumber(String input) {
    String sanitizedInput = input.replaceAll(',', '.').trim();
    return double.tryParse(sanitizedInput) ?? 0.0;
  }

  void _requestFocus() {
    Future.delayed(Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(displayHistory, style: TextStyle(fontSize: 20, color: Colors.grey[700])),
            Text(
              "Hasil: ${currentValue.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Masukkan angka",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton("+", () => _handleOperator("+")),
                const SizedBox(width: 10),
                _buildButton("-", () => _handleOperator("-")),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton("=", _calculateResult),
                const SizedBox(width: 10),
                _buildButton("Reset", _resetCalculator, color: Colors.redAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed, {Color? color}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blueAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(100, 50),
      ),
      child: Text(text, style: TextStyle(fontSize: 20)),
    );
  }
}

