class FormsConstant {
  static final List<Map<String, dynamic>> addressFields = [
    {'key': 'firstName', 'label': 'First name', 'required': true},
    {'key': 'lastName', 'label': 'Last name', 'required': true},
    {
      'key': 'country',
      'label': 'Country',
      'required': true,
      'item': [
        {
          'value': 'IN',
          'lable': 'India',
        },
        {
          'value': 'CA',
          'lable': 'Canada',
        },
        {
          'value': 'US',
          'lable': 'United States of America',
        },
        {
          'value': 'LK',
          'lable': 'Sri Lanka',
        },
      ]
    },
    {'key': 'streetName', 'label': 'Street name', 'required': true},
    {'key': 'city', 'label': 'City', 'required': true},
    {
      'key': 'state',
      'label': 'State / Province',
      'required': true,
    },
    {
      'key': 'zipCode',
      'label': 'Zip-code',
      'required': true,
      'isNumber': true,
      'maxLength': 6
    },
    {
      'key': 'phoneNumber',
      'label': 'Phone number',
      'required': true,
      'isNumber': true,
      'maxLength': 10
    },
  ];

  static final List<Map<String, String>> shippingMethods = [
    {
      'value': 'free',
      'title': 'Free',
      'subTitle': 'Delivery from 3 to 7 business days',
    },
    {
      'value': 'standard',
      'title': '\$9.90',
      'subTitle': 'Delivery from 4 to 6 business days',
    },
    {
      'value': 'fast',
      'title': '\$9.90',
      'subTitle': 'Delivery from 2 to 3 business days',
    },
  ];
}
