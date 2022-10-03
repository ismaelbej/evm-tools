abstract class AddressDatasource {
  Stream<List<String>> getAddressList();

  Future<void> addAddress(String address);

  Future<void> removeAddress(String address);
}
