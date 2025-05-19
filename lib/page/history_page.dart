import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample transaction data
    final List<Map<String, dynamic>> transactions = [
      {
        'type': 'transfer',
        'amount': 500000,
        'name': 'John Doe',
        'time': '10:30 AM',
        'date': '12 Mei 2023',
        'status': 'success',
        'icon': Icons.arrow_upward,
      },
      {
        'type': 'receive',
        'amount': 750000,
        'name': 'Jane Smith',
        'time': '09:15 AM',
        'date': '11 Mei 2023',
        'status': 'success',
        'icon': Icons.arrow_downward,
      },
      {
        'type': 'payment',
        'amount': 120000,
        'name': 'Toko ABC',
        'time': '04:45 PM',
        'date': '10 Mei 2023',
        'status': 'success',
        'icon': Icons.shopping_bag,
      },
      {
        'type': 'topup',
        'amount': 1000000,
        'name': 'Top Up Saldo',
        'time': '02:20 PM',
        'date': '09 Mei 2023',
        'status': 'success',
        'icon': Icons.account_balance_wallet,
      },
      {
        'type': 'bill',
        'amount': 350000,
        'name': 'PLN Token',
        'time': '11:05 AM',
        'date': '08 Mei 2023',
        'status': 'success',
        'icon': Icons.bolt,
      },
      {
        'type': 'transfer',
        'amount': 200000,
        'name': 'John Doe',
        'time': '09:30 AM',
        'date': '07 Mei 2023',
        'status': 'success',
        'icon': Icons.arrow_upward,
      },
      {
        'type': 'receive',
        'amount': 750000,
        'name': 'Jane Smith',
        'time': '09:15 AM',
        'date': '06 Mei 2023',
        'status': 'success',
        'icon': Icons.arrow_downward,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Riwayat Transaksi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              // Filter logic
              _showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header with summary
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Pengeluaran',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      'Rp 2.970.000',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Pemasukan',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      'Rp 32.750.000',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Transaction list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: transactions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final isDebit =
                    transaction['type'] == 'transfer' ||
                    transaction['type'] == 'payment' ||
                    transaction['type'] == 'bill';

                return _buildTransactionCard(context, transaction, isDebit);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionCard(
    BuildContext context,
    Map<String, dynamic> transaction,
    bool isDebit,
  ) {
    final amountText =
        'Rp ${transaction['amount'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          _showTransactionDetail(context, transaction);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Transaction icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDebit ? Colors.red[50] : Colors.green[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  transaction['icon'],
                  color: isDebit ? Colors.red[600] : Colors.green[600],
                ),
              ),
              const SizedBox(width: 16),
              // Transaction details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${transaction['date']} • ${transaction['time']}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
              // Amount and status
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    isDebit ? '-$amountText' : '+$amountText',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDebit ? Colors.red[600] : Colors.green[600],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          transaction['status'] == 'success'
                              ? Colors.green[50]
                              : Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      transaction['status'] == 'success' ? 'Berhasil' : 'Gagal',
                      style: TextStyle(
                        color:
                            transaction['status'] == 'success'
                                ? Colors.green[600]
                                : Colors.red[600],
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter Transaksi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildFilterOption('Semua Transaksi', true),
              _buildFilterOption('Pengeluaran', false),
              _buildFilterOption('Pemasukan', false),
              _buildFilterOption('Pembayaran', false),
              _buildFilterOption('Top Up', false),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[200],
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Terapkan Filter',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(String title, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? Colors.indigo[800] : Colors.grey,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.indigo[800] : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _showTransactionDetail(
    BuildContext context,
    Map<String, dynamic> transaction,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final isDebit =
            transaction['type'] == 'transfer' ||
            transaction['type'] == 'payment' ||
            transaction['type'] == 'bill';

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDebit ? Colors.red[50] : Colors.green[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  transaction['icon'],
                  size: 36,
                  color: isDebit ? Colors.red[600] : Colors.green[600],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                transaction['name'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${transaction['date']} • ${transaction['time']}',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[200]!),
                    bottom: BorderSide(color: Colors.grey[200]!),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Jumlah', style: TextStyle(fontSize: 16)),
                    Text(
                      isDebit
                          ? '-Rp ${transaction['amount'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d)'), (Match m) => '${m[1]}.')}'
                          : '+Rp ${transaction['amount'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d)'), (Match m) => '${m[1]}.')}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDebit ? Colors.red[600] : Colors.green[600],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[800],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Tutup'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
