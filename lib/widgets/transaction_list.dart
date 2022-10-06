import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(userTransactions,
      {super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                // ignore: avoid_unnecessary_containers
                Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlue, width: 2)),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blueGrey),
                      '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        transactions[index].title),
                    Text(
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        DateFormat.yMEd().format(transactions[index].date))
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
