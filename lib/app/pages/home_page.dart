import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String numero = '0';
  double primeiroNumero = 0.0;
  String operacao = '';
  double resultado = 0.0;
  void calculator(String tecla) {
    switch (tecla) {
      case 'AC':
        operacao = '';
        setState(() {
          operacao.isEmpty;
          numero = '0';
        });
        break;
      case '<X':
        setState(() {
          if (numero.isNotEmpty) {
            numero = numero.substring(0, numero.length - 1);
          }
          if (numero.isEmpty) {
            numero = "0";
          }
        });
        break;

      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(
          () {
            numero += tecla;

            numero = numero.replaceAll(',', '.');
            if (numero.contains('.')) {
              // double numeroDouble = double.parse(numero);
              // numero = numeroDouble.toString();
            } else {
              int numeroInt = int.parse(numero);
              numero = numeroInt.toString();
            }
            numero = numero.replaceAll('.', ',');
          },
        );
        break;
      case '-':
      case 'X':
      case '/':
      case '+':
        operacao = tecla;
        numero = numero.replaceAll(',', '.');
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';
        break;

      case '=':
        if (operacao == "/") {
          if (double.parse(numero) * 1 == 0) {
            log('Divisão por zero');
            return;
          }
        }
        if (operacao == "+") {
          resultado = primeiroNumero + double.parse(numero);
        }
        if (operacao == "-") {
          resultado = primeiroNumero - double.parse(numero);
        }
        if (operacao == "X") {
          resultado = primeiroNumero * double.parse(numero);
        }
        if (operacao == "/") {
          resultado = primeiroNumero / double.parse(numero);
        }

        String resultadoString = resultado.toString();

        List<String> resultadoPartes = resultadoString.split('.');
        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          double resultadoFormatado = resultado;
          setState(() {
            numero = resultadoFormatado.toString();
            numero = numero.replaceAll('.', ',');
          });
        }
        operacao.isEmpty;
        numero.isEmpty;

        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          'Caculadora',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  numero,
                  style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calculator('AC');
                  },
                  child: const Text(
                    'AC',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(''),
                const Text(''),
                GestureDetector(
                    onTap: () => calculator('<X'),
                    child: Image.asset(
                      'assets/images/apagar.png',
                      height: 50,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calculator('7'),
                  child: const Text('7',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('8'),
                  child: const Text('8',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('9'),
                  child: const Text('9',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('/'),
                  child: const Text('÷',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calculator('4'),
                  child: const Text('4',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('5'),
                  child: const Text('5',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('6'),
                  child: const Text('6',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('X'),
                  child: const Text('X',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calculator('1'),
                  child: const Text('1',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('2'),
                  child: const Text('2',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('3'),
                  child: const Text('3',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('-'),
                  child: const Text('-',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calculator('0'),
                  child: const Text('0',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator(','),
                  child: const Text(',',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('='),
                  child: const Text('=',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                GestureDetector(
                  onTap: () => calculator('+'),
                  child: const Text('+',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
