(autoload 'php-mode "php-mode")
(setq auto-mode-alist
      (cons '("\\.php\\'" . php-mode) auto-mode-alist))
(setq php-mode-force-pear t)
(add-hook 'php-mode-user-hook
  '(lambda ()
     (setq php-manual-path "/Applications/MAMP/bin/php/php5.3.6/lib/php/doc/html")
     (setq php-manual-url "http://www.phppro.jp/phpmanual/")))