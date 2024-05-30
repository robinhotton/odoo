# -*- coding: utf-8 -*-

from odoo import models, fields

class Student(models.Model):
    _name = 'wb.student'
    _description = 'This is student profile.'

    name = fields.Char("Name", invisible=True)
    name1 = fields.Char("Name1", translate=True, tracking=True, unaccent=True)
    name2 = fields.Char("Name2", copy=False, help="This is the name of the student.") # no copy or duplicate allowed
    name3 = fields.Char("Name3", default="Weblearns", nullable=False)
    name4 = fields.Char("Name4", readonly=True)
    student_name = fields.Char(string="Student", required=True, index=True, size=5)
