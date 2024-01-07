import 'package:flutter/material.dart';
import 'package:atividades_dadm/Estilos_Fontes.dart';


/*  Pagina para demonstrar um exemplo da
*   implementacao de um Drawer e um TabBar. */
class Drawer_Tabs extends StatelessWidget {
  const Drawer_Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,        // Quantidade de tabs.
      initialIndex: 1,  // Tab inicial.
      child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          backgroundColor: Colors.black54,
          title: const Text('DRAWER E TABS', style: styleTitulo),
          bottom: const TabBar(
            tabs: [ // Tabs.
              Tab(icon: Icon(Icons.car_repair)),
              Tab(icon: Icon(Icons.motorcycle)),
              Tab(icon: Icon(Icons.bike_scooter_sharp)),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.lightGreen),
                child: Text('Cabeçalho do Drawer', style: TextStyle(fontSize: 24, color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.message, color: Colors.blueGrey),
                title: Text('Mensagem'),
              ),
              ListTile(
                leading: Icon(Icons.car_repair, color: Colors.blueGrey),
                title: Text('Oficina'),
              ),
              ListTile(
                leading: Icon(Icons.bike_scooter, color: Colors.blueGrey),
                title: Text('Scooter'),
              ),
            ],
          ),
        ),
        body: TabBarView( // Conteudo dos tabs.
          children: [
            Center(child: Image.network('https://img.freepik.com/fotos-premium/super-carro-esportivo-em-um-fundo-branco-ilustracao-3d_101266-10371.jpg?w=1060')),
            Center(child: Image.network('https://img.freepik.com/fotos-premium/esporte-poder-moto-corrida-arte-de-bicicleta-grafico-moderno-cromo-prata-preto-verde-design-elemento-de-arte-vetor_760688-14.jpg?w=1060')),
            Center(child: Image.network('https://img.freepik.com/fotos-premium/bicicleta-de-montanha-azul-em-uma-renderizacao-3d-de-fundo-branco-isolado_101266-19914.jpg?w=1060')),
          ],
        ),
        bottomNavigationBar: ElevatedButton(
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(LinearBorder()),            // Estilo da borda.
              backgroundColor: MaterialStatePropertyAll(Colors.black54),  // Cor de fundo.
              minimumSize: MaterialStatePropertyAll(Size.fromHeight(50)), // Tamanho minimo.
            ),
            onPressed: (){ Navigator.of(context).pop(); },
            child: const Text("VOLTAR", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent)),
          ),
      ),
    );
  }
}