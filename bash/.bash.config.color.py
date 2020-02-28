import os
from socket import gethostname
import sys

hostname = gethostname()
username = os.environ['USER']
pwd = os.getcwd()
homedir = os.path.expanduser('~')
pwd = pwd.replace(homedir, '~', 1)
pwd1 = ''
pwd2 = ''
list_f = pwd.split('/')
if len(pwd) > 30:
    for i, item in enumerate(list_f):
         if i != len(list_f) - 1:
             pwd1 += item[:2] + '/'
         else:
             pwd2 = item
else:
    for i, item in enumerate(list_f):
         if i != len(list_f) - 1:
             pwd1 += item + '/'
         else:
             pwd2 = item
if hasattr(sys, 'real_prefix'):
    full_virtual_env = sys.prefix
    virtual_env = full_virtual_env.split('/')[-1:][0]
    print('\[\x1b[33m\]{}\[\x1b[0m\] \[\x1b[35m\]{}\[\x1b[0m\] '
          '\[\x1b[32m\]{}\[\x1b[0m\]\[\x1b[32;01m\]{}\[\x1b[0m\]: '.format(
                  virtual_env, username, pwd1, pwd2))
else:
    print('\[\x1b[35m\]{}\[\x1b[0m\] '
          '\[\x1b[32m\]{}\[\x1b[0m\]\[\x1b[32;01m\]{}\[\x1b[0m\]: '.format(
                  username, pwd1, pwd2))

