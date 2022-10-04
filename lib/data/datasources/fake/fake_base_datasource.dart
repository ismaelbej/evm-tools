mixin FakeBaseDatasource {
  Future simulateDelay() => Future.delayed(const Duration(milliseconds: 500));
}
