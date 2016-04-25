#!/usr/bin/env python
#This file is part of htmlentity2ascii.  The COPYRIGHT file at the top level of
#this repository contains the full copyright notices and license terms.

import os
from setuptools import setup, find_packages
import slug

def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(name='slug',
        version=slug.__version__,
        author='Zikzakmedia SL',
        author_email='zikzak@zikzakmedia.com',
        url="http://www.zikzakmedia.com",
        description="Python module to convert str to slug",
        long_description=read('README'),
        packages=['slug'],
        classifiers=[
            'Development Status :: 5 - Production/Stable',
            'Environment :: Web Environment',
            'Intended Audience :: Developers',
            'License :: OSI Approved :: GNU General Public License (GPL)',
            'Operating System :: OS Independent',
            'Programming Language :: Python',
            'Topic :: Internet :: WWW/HTTP :: Dynamic Content',
            'Topic :: Software Development :: Libraries :: Python Modules'
            ],
        license='GPL-3',
        extras_require={
        },
    )
