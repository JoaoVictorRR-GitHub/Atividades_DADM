import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:atividades_dadm/Estilos_Fontes.dart';


/*  Exemplo da implementacao de uma pagina
*   de anotacoes usando uma base de dados
*   do firebase.  */
class Anotacoes extends StatefulWidget {
  const Anotacoes({super.key});

  @override
  State<Anotacoes> createState() => _AnotacoesState();
}

class _AnotacoesState extends State<Anotacoes> {

  CollectionReference anotacoes = FirebaseFirestore.instance.collection('Notas'); // Referencia para a base de dados.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
        title: const Text('ANOTAÇÕES', style: styleTitulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: anotacoes.orderBy('titulo').snapshots(),
          builder: (context, snap){
            if(snap.hasData){
              return ListView.builder(
                itemCount: snap.data!.docs.length,
                itemBuilder: (context, index){
                  DocumentSnapshot blocosNota = snap.data!.docs[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detalhes_Anotacao(anotacao: blocosNota)));
                    },
                    child: Dismissible(
                      background: Container(  // Conteudo que aparece ao deslizar para a direita.
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.red),
                        child: const Icon(Icons.delete_forever_outlined, size: 50),
                      ),
                      secondaryBackground: Container( // Conteudo que aparece ao deslizar para a esquerda.
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.red),
                        child: const Icon(Icons.delete_forever_outlined, size: 50),
                      ),
                      key: ValueKey(snap.data!.docs.elementAt(index)),
                      onDismissed: (direcao) {  // Deleta a anotacao ao deliszar para uma direcao.
                        anotacoes.doc(blocosNota.id).delete();
                      },
                      child: Card(
                        color: Colors.lightGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          title: Text(blocosNota['titulo'], style: styleBotao),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else{
              return const Center(
                child: CircularProgressIndicator(value: 1),
              );
            }},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Nova_Anotacao()));
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}


/*  Pagina para criar uma nova anotacao.  */
class Nova_Anotacao extends StatefulWidget {
  const Nova_Anotacao({super.key});

  @override
  State<Nova_Anotacao> createState() => _Nova_AnotacaoState();
}

class _Nova_AnotacaoState extends State<Nova_Anotacao> {

  CollectionReference anotacoes = FirebaseFirestore.instance.collection('Notas'); // Referencia para a base de dados.
  TextEditingController titulo = TextEditingController();                         // Titulo da anotacao.
  TextEditingController nota = TextEditingController();                           // Nota.

  /*  Metodo para salvar a anotacao na base de dados. */
  Future salvarAnotacao() async {
    try {
      if ((titulo.text != "") && (nota.text != "")) { // Verifica os campos.
        anotacoes.add({
          // Adiciona a anotacao.
          'titulo': titulo.text,
          'nota': nota.text,
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Anotação salva com sucesso.')));
        setState(() {
          // Limpa os campos.
          titulo.text = "";
          nota.text = "";
        });
      }
      else {  // (MENSAGEM) Campos vazios.
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Campos não podem estar vazios.')));
        return const Center(child: CircularProgressIndicator(value: 1));
      }
    } catch (erro) {  // (MENSAGEM) Erro no salvamento.
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao salvar a anotação.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
        title: const Text('NOVA ANOTAÇÃO', style: styleTitulo),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          TextField(
            maxLength: 20,
            controller: titulo,
            style: const TextStyle(fontWeight: FontWeight.bold),
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50.0, bottom: 25.0),
            child: TextField(
              maxLines: 10,
              maxLength: 500,
              controller: nota,
              decoration: const InputDecoration(
                labelText: 'Nota',
                alignLabelWithHint: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){ salvarAnotacao(); }, // Salva a anotacao.
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
            child: const Text('SALVAR', style: styleBotao),
          ),
        ],
      ),
    );
  }
}


/*  Pagina para exibir os
*   detalhes de uma anotacao. */
class Detalhes_Anotacao extends StatelessWidget {
  const Detalhes_Anotacao({super.key, required this.anotacao});

  final DocumentSnapshot anotacao;  // Anotacao selecionada.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
        title: Text(anotacao['titulo'], style: styleTitulo),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            height: 250,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0, bottom: 15.0),
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0)), border: Border.fromBorderSide(BorderSide(color: Colors.black))),
            child: Text(anotacao['nota']),
          ),
        ),
      ),
    );
  }
}