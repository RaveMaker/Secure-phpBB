Secure-phpBB
================

Fix permissions for all phpBB instances installed in a specific folder.

Also supports SELinux Enforcing.

### Installation

1. Clone this script from github or copy the files manually to your preferred directory.

2. Edit script and point 'www' param to the folder containing your phpBB folders.

- for example if phpBB is located in /var/www/html/phpbb:

```
/var/www/html
```

> config.php is set to root:apache with 640 permissions. 

Author: [RaveMaker][RaveMaker].

[RaveMaker]: http://ravemaker.net
 
