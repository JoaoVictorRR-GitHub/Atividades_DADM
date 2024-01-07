import 'package:flutter/material.dart';
import 'package:atividades_dadm/Estilos_Fontes.dart';


/*  Pagina para incrementar e decrementar
*   um valor utilizando a area do AppBar. */
class Contador_AppBar extends StatefulWidget {
  const Contador_AppBar({super.key});

  @override
  State<Contador_AppBar> createState() => _Contador_AppBarState();
}

class _Contador_AppBarState extends State<Contador_AppBar> {

  int Valor1 = 0;
  int Valor2 = 0;

  // Metodo para incrementar.
  void Incrementar() {
    setState(() { Valor1++; });
  }

  // Metodo para decrementar.
  void Decrementar() {
    setState(() { Valor1--; });
  }

  // Metodo para atualizar o indice dos tabs.
  void indiceCorrente(int num) {
    setState(() {
      Valor2 = num;
      Valor1 = Valor2 +1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
        title: const Text('ALTERAR VALOR', style: styleTitulo),
        actions: [
          IconButton(
            onPressed: (){ Incrementar(); },  // Incrementar.
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: (){ Decrementar(); },  // Decrementar.
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Text('$Valor1', style: const TextStyle(fontSize: 90, color: Colors.red)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,   // Tamanho da fonte do tab selecionado.
        unselectedFontSize: 12, // Tamanho da fonte do tab nao selecionado.
        backgroundColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),     label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school),   label: 'School'),
        ],
        currentIndex: Valor2,   // Indice do tab.
        onTap: indiceCorrente,  // Atualiza o indice do tab.
        selectedItemColor: Colors.white,
      ),
    );
  }
}