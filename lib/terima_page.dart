import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TerimaPage extends StatelessWidget {
  const TerimaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Terima Uang',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [Colors.blue.shade700, Colors.blue.shade500],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //     borderRadius: BorderRadius.circular(16),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.blue.withOpacity(0.2),
            //         blurRadius: 10,
            //         offset: const Offset(0, 5),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Saldo Tersedia',
            //         style: TextStyle(
            //           color: Colors.white.withOpacity(0.9),
            //           fontSize: 16,
            //         ),
            //       ),
            //       const SizedBox(height: 8),
            //       Text(
            //         'Rp 5.000.000',
            //         style: const TextStyle(
            //           color: Colors.white,
            //           fontSize: 28,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 32),

            // Title
            Text(
              'Bagikan informasi berikut untuk menerima pembayaran:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 20),

            // Account Information Card
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.indigo.shade200, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // QR Code Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 280,
                            height: 280,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.qr_code_2_rounded,
                                size: 280,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Scan QR Code untuk pembayaran cepat',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Account Details
                    _buildInfoTile(
                      icon: Icons.person_outline,
                      title: 'Nama Penerima',
                      value: 'ZAKI MUSHTHAFA BILLAH',
                    ),
                    const Divider(height: 24, thickness: 1),
                    _buildInfoTile(
                      icon: Icons.credit_card,
                      title: 'Nomor Rekening',
                      value: '1234 5678 9012 3456',
                    ),
                    const Divider(height: 24, thickness: 1),
                    _buildInfoTile(
                      icon: Icons.account_balance,
                      title: 'Bank',
                      value: 'Bank MySakuw',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.copy, size: 20),
                    label: const Text('Salin Informasi'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(color: Colors.indigo.shade400),
                    ),
                    onPressed: () {
                      Clipboard.setData(
                        const ClipboardData(
                          text:
                              'ZAKU MUSHTHAFA BILLAH\n1234 5678 9012 3456\nBank MySakuw',
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Informasi disalin ke clipboard'),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.share, size: 20),
                    label: const Text('Bagikan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                      side: BorderSide(color: Colors.indigo.shade400),
                    ),
                    onPressed: () {
                      // Share logic
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Recent Transactions
            Text(
              'Transaksi Terakhir',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 12),
            _buildTransactionItem(
              name: 'Alice Johnson',
              amount: 'Rp 250.000',
              date: 'Hari ini, 14:30',
              isInbound: true,
            ),
            _buildTransactionItem(
              name: 'Bob Smith',
              amount: 'Rp 150.000',
              date: 'Kemarin, 09:15',
              isInbound: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.indigo, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.copy, size: 20, color: Colors.indigo),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required String name,
    required String amount,
    required String date,
    required bool isInbound,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isInbound ? Colors.green.shade50 : Colors.orange.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isInbound ? Icons.arrow_downward : Icons.arrow_upward,
              color: isInbound ? Colors.green : Colors.orange,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: isInbound ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
