import 'package:flutter/material.dart';

import 'package:lista_tarefas/pages/widgets/lista_tarefa_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/tarefa.dart';

class PaginaLista extends StatefulWidget {
  PaginaLista({Key? key}) : super(key: key);

  @override
  State<PaginaLista> createState() => _PaginaListaState();
}

class _PaginaListaState extends State<PaginaLista> {
  final TextEditingController tarefacontroller = TextEditingController();

  List<Tarefa> listatarefas = [];
  Tarefa? tarefadeletada;
  int? postarefadeletada;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          centerTitle: true,
          title: Text('LISTA DE TAREFAS',),

        ) ,
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
                        Slidable(
                          child: ListaTarefaItem(
                            itemtarefa: tarefa,
                          ),
                          endActionPane: ActionPane(
                            motion: DrawerMotion(),
                            extentRatio: .25,
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  setState(() {
                                    tarefadeletada = tarefa;
                                    postarefadeletada =
                                        listatarefas.indexOf(tarefa);
                                    listatarefas.remove(tarefa);
                                  });
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'A tarefa ${tarefa.tittle} foi removida com sucesso',
                                      ),
                                      action: SnackBarAction(
                                        label: 'Desfazer',
                                        textColor: Color(0xff00d7f3),
                                        onPressed: () {
                                          setState(() {
                                            listatarefas.insert(
                                                postarefadeletada!,
                                                tarefadeletada!);
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                spacing: 8,
                                label: ('Deletar'),
                              ),
                            ],
                          ),
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
                      onPressed: confirmardelete,
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

  void confirmardelete() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('LIMPAR TUDO'),
            content:
                Text('Você tem certeza que deseja apagar todas as tarefas?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Color(0xff00d7f3),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
               setState(() {
                 listatarefas.clear();
               });
                },
                child: Text(
                  'Limpar tudo',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          );
        });
  }
}
