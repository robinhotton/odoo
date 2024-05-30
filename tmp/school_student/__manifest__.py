# -*- coding: utf-8 -*-
{
    'name': "school Student",

    'summary': "Add Lionel view",

    'description': """
    extends project modules in order to add some views
    """,

    'author': "Tecken",
    'website': "https://www.tecken.fr/",

    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/15.0/odoo/addons/base/data/ir_module_category_data.xml
    # for the full list
    'category': 'Project management',
    'version': '0.0.1',

    # any module necessary for this one to work correctly
    'depends': ['student'],
    'auto_install': True,
    
    # always loaded
    'data': [
    ]
}
