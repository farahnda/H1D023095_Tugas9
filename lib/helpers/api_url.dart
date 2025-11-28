// ignore_for_file: prefer_interpolation_to_compose_strings

class ApiUrl {
  static const String baseUrl = 'http://10.99.241.243:8080';
  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listProduk = baseUrl +'/produk';
  static const String createProduk = baseUrl + '/produk';
  static String updateProduk(String id) {
    return baseUrl + '/produk/' + id;
  }
  
  static String showProduk(String id) {
    return baseUrl + '/produk/' + id;
  }
  
  static String deleteProduk(String id) {
    return baseUrl + '/produk/' + id;
  }
}