import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Contoh data transaksi
    final List<Map<String, dynamic>> transactions = [
      {
        'type': 'transfer',
        'amount': 500000,
        'name': 'John Doe',
        'time': '10:30 AM',
        'date': '12 Mei 2023',
        'status': 'success',
      },
      {
        'type': 'receive',
        'amount': 750000,
        'name': 'Jane Smith',
        'time': '09:15 AM',
        'date': '11 Mei 2023',
        'status': 'success',
      },
      {
        'type': 'payment',
        'amount': 120000,
        'name': 'Toko ABC',
        'time': '04:45 PM',
        'date': '10 Mei 2023',
        'status': 'success',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Logic untuk filter
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(
                transaction['type'] == 'transfer'
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                color:
                    transaction['type'] == 'transfer'
                        ? Colors.red
                        : Colors.green,
              ),
              title: Text(transaction['name']),
              subtitle: Text('${transaction['date']} • ${transaction['time']}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rp ${transaction['amount'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          transaction['type'] == 'transfer'
                              ? Colors.red
                              : Colors.green,
                    ),
                  ),
                  Text(
                    transaction['status'] == 'success' ? 'Berhasil' : 'Gagal',
                    style: TextStyle(
                      color:
                          transaction['status'] == 'success'
                              ? Colors.green
                              : Colors.red,
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Navigasi ke detail transaksi
              },
            ),
          );
        },
      ),
    );
  }
}
