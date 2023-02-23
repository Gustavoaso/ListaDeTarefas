import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:lista_tarefas/models/tarefa.dart';


class ListaTarefaItem extends StatelessWidget {
  const ListaTarefaItem({Key? key, required this.itemtarefa}) : super(key: key);

  final Tarefa itemtarefa;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
    );
    }

  }
