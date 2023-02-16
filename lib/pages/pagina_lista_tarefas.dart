
import 'package:flutter/material.dart';

import 'package:lista_tarefas/pages/widgets/lista_tarefa_item.dart';

import '../models/tarefa.dart';

class PaginaLista extends StatefulWidget {
  PaginaLista({Key? key}) : super(key: key);

  @override
  State<PaginaLista> createState() => _PaginaListaState();
}

class _PaginaListaState extends State<PaginaLista> {
  final TextEditingController tarefacontroller = TextEditingController();

  List<Tarefa> listatarefas = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      child: Icon(Icons.add, size: 30),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.all(15)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Tarefa tarefa in listatarefas)
                        ListaTarefaItem(
                         itemtarefa: tarefa,
                        ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        'Você possui ${listatarefas.length} tarefas pendentes',
                      ),
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
      ),
    );
  }

  void addtarefa() {
    String text = tarefacontroller.text;
    setState(() {
      Tarefa newTarefa = Tarefa(
        tittle: text,
        data: DateTime.now(),
      );
      listatarefas.add(newTarefa);
    });
    tarefacontroller.clear();
  }
}
