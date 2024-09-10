// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$usersAtom = Atom(name: '_UserStore.users', context: context);

  @override
  ObservableList<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$visitorsAtom =
      Atom(name: '_UserStore.visitors', context: context);

  @override
  ObservableList<User> get visitors {
    _$visitorsAtom.reportRead();
    return super.visitors;
  }

  @override
  set visitors(ObservableList<User> value) {
    _$visitorsAtom.reportWrite(value, super.visitors, () {
      super.visitors = value;
    });
  }

  late final _$fetchUsersAsyncAction =
      AsyncAction('_UserStore.fetchUsers', context: context);

  @override
  Future<void> fetchUsers() {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers());
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void updatePaymentMethod(User user, String method) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updatePaymentMethod');
    try {
      return super.updatePaymentMethod(user, method);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePaymentAmount(User user, double amount) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updatePaymentAmount');
    try {
      return super.updatePaymentAmount(user, amount);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addVisitor() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.addVisitor');
    try {
      return super.addVisitor();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearData() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.clearData');
    try {
      return super.clearData();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
visitors: ${visitors}
    ''';
  }
}
