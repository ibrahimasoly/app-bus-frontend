import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InfoTicketPage extends StatelessWidget {
  const InfoTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 480,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ticket',
                            ),
                            Text(
                              'MaliTransport',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Depart',
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                SizedBox(height: 2),
                                Text('Bamako'),
                              ],
                            ),
                            Text(
                              '-----------',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(Icons.bus_alert_outlined),
                            Text(
                              '-----------',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Arriver',
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                SizedBox(height: 2),
                                Text('Segou'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.calendar_month,
                                      color: Colors.grey),
                                  Text(
                                    'Date',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'jul 12, 2023 ',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.access_time, color: Colors.grey),
                                  Text(
                                    'Heure',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    '16:40 ',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100, // Ajoutez une taille spécifique au Stack
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              left: -30,
                              top: 40,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -30,
                              top: 40,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.download_rounded),
                            style: ButtonStyle(),
                          ),
                          QrImageView(
                            data: 'Ibe',
                            size: 150,
                            version: QrVersions.auto,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
