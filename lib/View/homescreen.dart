import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payment_details_fetch/Model/model.dart';
import 'package:payment_details_fetch/Viewmodel/user_store.dart';
import 'package:provider/provider.dart';

class UserPaymentScreen extends StatelessWidget {
  const UserPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
        appBar: AppBar(
            title: const Text('Payments',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    userStore.clearData();
                  })
            ]),
        body: Observer(builder: (_) {
          return ListView(children: [
            ...userStore.users.map((user) => UserPaymentTile(
                user: user,
                onPaymentMethodChanged: (newMethod) {
                  userStore.updatePaymentMethod(user, newMethod);
                },
                onAmountChanged: (newAmount) {
                  userStore.updatePaymentAmount(user, newAmount);
                })),
            ...userStore.visitors.map((visitor) => UserPaymentTile(
                user: visitor,
                onPaymentMethodChanged: (newMethod) {
                  userStore.updatePaymentMethod(visitor, newMethod);
                },
                onAmountChanged: (newAmount) {
                  userStore.updatePaymentAmount(visitor, newAmount);
                }))
          ]);
        }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              log('before addding pressed');
              userStore.addVisitor();
              log('after addding pressed');
            },
            child: const Icon(Icons.add)));
  }
}

class UserPaymentTile extends StatelessWidget {
  final User user;
  final Function(String) onPaymentMethodChanged;
  final Function(double) onAmountChanged;

  const UserPaymentTile({
    super.key,
    required this.user,
    required this.onPaymentMethodChanged,
    required this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: user.isUpdated ? Colors.greenAccent : Colors.transparent,
            child: Column(children: [
              Row(children: [
                CircleAvatar(
                    backgroundImage: user.profileurl.isNotEmpty
                        ? NetworkImage(user.profileurl)
                        : const AssetImage('lib/Assets/User-Profile-PNG.png'),
                    radius: 60,
                    backgroundColor: user.isUpdated
                        ? Colors.greenAccent
                        : Colors.transparent),
                const SizedBox(width: 15),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(user.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis),
                  DropdownButton<String>(
                      value: user.paymentMethod,
                      items: const [
                        DropdownMenuItem(value: 'cash', child: Text('Cash')),
                        DropdownMenuItem(value: 'upi', child: Text('UPI')),
                      ],
                      onChanged: (newValue) {
                        if (newValue != null) {
                          onPaymentMethodChanged(newValue);
                        }
                      }),
                  const SizedBox(width: 10),
                  SizedBox(
                      width: 80,
                      child: TextFormField(
                          initialValue: user.paymentAmount.toString(),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            onAmountChanged(
                                double.tryParse(value) ?? user.paymentAmount);
                          }))
                ])
              ])
            ])));
  }
}
