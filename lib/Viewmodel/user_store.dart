import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:payment_details_fetch/Model/model.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  ObservableList<User> visitors = ObservableList<User>();

  @action
  Future<void> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100&gender=male';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'];

      users.clear();
      for (var user in data) {
        users.add(User(
          name: "${user['name']['first']} ${user['name']['last']}",
          profileurl: user['picture']['large'],
        ));
      }
    } else {
      throw Exception('Failed to load users');
    }
  }

  @action
  void updatePaymentMethod(User user, String method) {
    user.paymentMethod = method;
    user.isUpdated = true;
  }

  @action
  void updatePaymentAmount(User user, double amount) {
    user.paymentAmount = amount;
    user.isUpdated = true;
  }

  @action
  void addVisitor() {
    visitors.add(User(
      name: "Visitor",
      profileurl: '',
      paymentAmount: 1000,
    ));
  }

  @action
  void clearData() {
    users.clear();
    visitors.clear();
  }
}
