import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_tarefas/models/tarefa.dart';





class ListaTarefaItem extends StatelessWidget {
  const ListaTarefaItem({Key? key, required this.itemtarefa}) : super(key: key);

final Tarefa itemtarefa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(4),
         color: Colors.grey[300],
       ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('dd/MM//yyy - HH:mm').format(itemtarefa.data),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
             itemtarefa.tittle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
