import 'package:flutter/material.dart';
import 'package:atividades_dadm/Estilos_Fontes.dart';


// Classe de imagens.
class Imagem {
  String Nome;  // Nome da imagem.
  String Link;  // Endereco/Local da imagem.

  Imagem(this.Nome, this.Link);
}

// Lista de imagens.
List<Imagem> lstImagens = [
  Imagem('Avião',     'imagens/aviao.png'),
  Imagem('Barco',     'imagens/barco.png'),
  Imagem('Bicicleta', 'imagens/bicicleta.png'),
  Imagem('Bus',       'imagens/bus.png'),
  Imagem('Carro',     'imagens/carro.png'),
  Imagem('Comboio',   'imagens/comboio.png'),
  Imagem('Mota',      'imagens/mota.png'),
  Imagem('Segway',    'imagens/segway.png'),
  Imagem('Skate',     'imagens/skate.png'),
  Imagem('Trotineta', 'imagens/trotineta.png'),
];



/*  Pagina para demonstrar um exemplo da
*   implementacao de um GridView com imagens. */
class GridView_Imagens extends StatelessWidget {
  const GridView_Imagens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
        title: const Text('LISTA DE IMAGENS:', style: styleTitulo),
      ),
      body: GridView.count(
        crossAxisCount: 2,  // Numero de colunas.
        padding: const EdgeInsets.all(5),
        children: List.generate(lstImagens.length, (index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detalhes_Imagem(imagem: lstImagens[index])));
                    },
                    child: Image.asset(lstImagens[index].Link),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                  child: Text(lstImagens[index].Nome, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}


/*  Pagina para exibir os
*   detalhes de uma imagem. */
class Detalhes_Imagem extends StatelessWidget {
  const Detalhes_Imagem({super.key, required this.imagem});

  final Imagem imagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
        title: Text(imagem.Nome, style: styleTitulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Image.asset(imagem.Link, scale: 3),
        ),
      ),
    );
  }
}