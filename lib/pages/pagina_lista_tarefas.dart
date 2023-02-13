import 'package:flutter/material.dart';

class PaginaLista extends StatefulWidget {
  PaginaLista({Key? key}) : super(key: key);

  @override
  State<PaginaLista> createState() => _PaginaListaState();
}

class _PaginaListaState extends State<PaginaLista> {
  final TextEditingController tarefacontroller = TextEditingController();

  List<String> listatarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tarefacontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ('Adicione uma Tarefa'),
                        hintText: ('Escreva a tarefa'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: addtarefa,
                    child:  Icon(Icons.add, size: 30),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.all(15)),
                  ),
                ],
              ),
                 Flexible(
                   child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (String tarefa in listatarefas)
                        ListTile(
                          title: Text(tarefa),
                          subtitle: Text('10/02/2023'),
                          leading: Icon(Icons.save, size: 30),

                          onTap: () {
                            print('tarefa:$tarefa');
                          },

                        )
                    ],
                ),
                 ),

              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  const Expanded(
                    child: Text('Limpe todas as suas tarefas'),
                  ),
                  Padding(padding: EdgeInsets.all(30)),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                    ),
                    child: Text('Limpar tudo'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void addtarefa() {
    String tarefa = tarefacontroller.text;
    setState(() {

      listatarefas.add(tarefa);
    });
tarefacontroller.clear();

  }
}
