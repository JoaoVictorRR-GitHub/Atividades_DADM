import 'package:flutter/material.dart';


/*  Pagina para incrementar e
*   decrementar um valor. */
class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {

  int Valor = 0;

  // Metodo para incrementar.
  void Incrementar(){
    setState(() { Valor++; });
  }

  // Metodo para decrementar.
  void Decrementar(){
    setState(() { Valor--; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 25, left: 30, right: 30),
        child: Column(
          children: [
            Row(  // Botao 01.
              children: [
                Expanded(
                  child: Container(
                    color: Colors.lightGreen,
                    child: IconButton(
                      onPressed: (){ Incrementar(); },  // Incrementar.
                      icon: const Icon(Icons.add, size: 30, color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox( // Valor.
              height: 590,
              child: Center(
                child: Text('$Valor', style: const TextStyle(fontSize: 90, color: Colors.lightBlueAccent)),
              ),
            ),
            Row(  // Botao 02.
              children: [
                Expanded(
                  child: Container(
                    color: Colors.lightGreen,
                    child: IconButton(
                      onPressed: (){ Decrementar(); },  // Decrementar.
                      icon: const Icon(Icons.remove, size: 30, color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}