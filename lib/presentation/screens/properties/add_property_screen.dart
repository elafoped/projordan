import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projordan/core/constants/colors.dart';
import 'package:projordan/presentation/widgets/header_image_widget.dart';
import 'package:projordan/presentation/widgets/primarybutton.dart';

class AddPropertyScreen extends StatefulWidget {
  @override
  _AddPropertyScreenState createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // بيانات العقار
  String _title = '';
  String _description = '';
  String _price = '';
  bool _isForSale = true;
  String _area = '';
  String _roomsCount = '';
  String _propertyType = 'شقة';
  String _legalStatus = 'تملك حر';
  List<String> _photos = [];

  // خيارات القائمة المنسدلة
  final List<String> _propertyTypes = [
    'شقة',
    'فيلا',
    'منزل تاون هاوس',
    'أرض',
    'تجاري',
  ];

  final List<String> _legalStatuses = [
    'تملك حر',
    'عقد إيجار',
    'انتفاع',
    'أخرى',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
     
      body: Stack(

        children: [
                    HeaderImageWidget(height: height * 0.33, title: 'أضف عقار'), 
  Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              // ✅ تمرير النص للبحث إلى BodyContent
              child:  SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: _buildForm(),
            ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitleField(),
          const SizedBox(height: 16),
          _buildDescriptionField(),
          const SizedBox(height: 16),
          _buildPriceAndSaleSwitch(),
          const SizedBox(height: 16),
          _buildAreaAndRoomsFields(),
          const SizedBox(height: 16),
          _buildPropertyTypeDropdown(),
          const SizedBox(height: 16),
          _buildLegalStatusDropdown(),
          const SizedBox(height: 16),
          _buildPhotoPicker(),
          const SizedBox(height: 24),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'عنوان العقار (مثال: شقة مريحة بغرفتين)',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'يرجى إدخال عنوان العقار';
        }
        return null;
      },
      onSaved: (value) => _title = value!.trim(),
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'الوصف',
        border: OutlineInputBorder(),
        alignLabelWithHint: true,
      ),
      maxLines: 4,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'يرجى إدخال الوصف';
        }
        return null;
      },
      onSaved: (value) => _description = value!.trim(),
    );
  }

  Widget _buildPriceAndSaleSwitch() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'السعر (بالدولار)',
              border: OutlineInputBorder(),
              prefixText: '\$ ',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'يرجى إدخال السعر';
              }
              if (double.tryParse(value) == null) {
                return 'يرجى إدخال رقم صالح';
              }
              return null;
            },
            onSaved: (value) => _price = value!.trim(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'للبيع',
                style: TextStyle(fontSize: 12),
              ),
              Switch(
                value: _isForSale,
                onChanged: (value) => setState(() => _isForSale = value),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAreaAndRoomsFields() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'المساحة (قدم مربع)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'يرجى إدخال المساحة';
              }
              if (double.tryParse(value) == null) {
                return 'يرجى إدخال رقم صالح';
              }
              return null;
            },
            onSaved: (value) => _area = value!.trim(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'عدد الغرف',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'يرجى إدخال عدد الغرف';
              }
              if (int.tryParse(value) == null) {
                return 'يرجى إدخال رقم صالح';
              }
              return null;
            },
            onSaved: (value) => _roomsCount = value!.trim(),
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyTypeDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'نوع العقار',
        border: OutlineInputBorder(),
      ),
      value: _propertyType,
      items: _propertyTypes
          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: (value) {
        setState(() {
          _propertyType = value!;
        });
      },
    );
  }

  Widget _buildLegalStatusDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'الوضع القانوني',
        border: OutlineInputBorder(),
      ),
      value: _legalStatus,
      items: _legalStatuses
          .map((status) => DropdownMenuItem(value: status, child: Text(status)))
          .toList(),
      onChanged: (value) {
        setState(() {
          _legalStatus = value!;
        });
      },
    );
  }

  Widget _buildPhotoPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'اضغط لتحميل الصور',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _showPhotoOptions(),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _photos.isEmpty
                ? const Center(
                    child: Icon(
                      Icons.add_a_photo,
                      size: 40,
                      color: AppColors.gray,
                    ),
                  )
                : GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: _photos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.network(
                          _photos[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return 
    PrimaryButton(label: 'إرسال العقار', onPressed:_submitForm,);
    
  }

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('التقاط صورة'),
                onTap: () {
                  Navigator.pop(context);
                  // أضف هنا تنفيذ التقاط الصورة
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('اختيار من المعرض'),
                onTap: () {
                  Navigator.pop(context);
                  // أضف هنا تنفيذ اختيار صورة من المعرض
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // هنا يمكنك إضافة منطق إرسال البيانات للخادم أو تخزينها محلياً

      print('تم إرسال العقار:');
      print('العنوان: $_title');
      print('الوصف: $_description');
      print('السعر: $_price');
      print('للبيع: $_isForSale');
      print('المساحة: $_area قدم مربع');
      print('عدد الغرف: $_roomsCount');
      print('نوع العقار: $_propertyType');
      print('الوضع القانوني: $_legalStatus');
      print('الصور: $_photos');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إضافة العقار بنجاح!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
