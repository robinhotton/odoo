# -*- coding: utf-8 -*-
{
    'name': "Student",

    'summary': "Add view",

    'description': """
    extends project modules in order to add some views
    """,

    'author': "TMP",
    'website': "https://tmp.com",

    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/15.0/odoo/addons/base/data/ir_module_category_data.xml
    # for the full list
    'category': 'Project management',
    'version': '0.0.1',

    # any module necessary for this one to work correctly
    'depends': ['base'],

    # always loaded
    'data': [
        'security/ir.model.access.csv',
        'views/student_view.xml',
    ],
}
