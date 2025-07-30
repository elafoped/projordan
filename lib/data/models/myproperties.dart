class Property {
  final String imagePath;
  final String price;
  final String title;
  final String subtitle;
  final String address;
  final String features;

  Property({
    required this.imagePath,
    required this.price,
    required this.title,
    required this.subtitle,
    required this.address,
    required this.features,
  });
}
   final List<Property> properties = [
      Property(
        imagePath: 'assets/images/2.jpg',
        price: '\$1,200',
        title: 'شقة فاخرة',
        subtitle: 'في وسط المدينة',
        address: 'دمشق - أبو رمانة',
        features: '3 غرف • 2 حمام • 120 م²',
      ),
      Property(
        imagePath: 'assets/images/1.jpg',
        price: '\$900',
        title: 'شقة اقتصادية',
        subtitle: 'قريبة من الخدمات',
        address: 'دمشق - المزة',
        features: '2 غرف • 1 حمام • 80 م²',
      ),
      Property(
        imagePath: 'assets/images/2222.jpg',
        price: '\$2,500',
        title: 'فيلا مع مسبح',
        subtitle: 'موقع راقٍ جدًا',
        address: 'يعفور',
        features: '5 غرف • 4 حمام • 300 م²',
      ),
      Property(
        imagePath: 'assets/images/222.jpg',
        price: '\$1,500',
        title: 'شقة دوبلكس',
        subtitle: 'تصميم عصري',
        address: 'مشروع دمر',
        features: '4 غرف • 3 حمام • 180 م²',
      ),
      Property(
        imagePath: 'assets/images/111.jpg',
        price: '\$700',
        title: 'شقة للإيجار',
        subtitle: 'مناسبة للطلاب',
        address: 'برزة',
        features: '1 غرف • 1 حمام • 60 م²',
      ),
      Property(
        imagePath: 'assets/images/1111.jpg',
        price: '\$3,000',
        title: 'فيلا ريفية',
        subtitle: 'إطلالة رائعة',
        address: 'بلودان',
        features: '6 غرف • 5 حمام • 400 م²',
      ),
      Property(
        imagePath: 'assets/images/22222.jpg',
        price: '\$1,000',
        title: 'شقة مفروشة',
        subtitle: 'تشطيب ممتاز',
        address: 'المالكي',
        features: '2 غرف • 2 حمام • 100 م²',
      ),
    ];