import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(userTransactions,
      {super.key, required this.transactions, required this.deleteTx});
  // created delete functioin pointer
  final Function deleteTx;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                const Text('No Transactions added yet!',
                    style: TextStyle(color: Colors.blue)),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 4,
                  child: Row(
                    children: <Widget>[
                      // ignore: avoid_unnecessary_containers
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2)),
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
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              DateFormat.yMEd()
                                  .format(transactions[index].date))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 90),
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.blue,
                                onPressed: (() =>
                                    deleteTx(transactions[index].id)),
                              ))
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
