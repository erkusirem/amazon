# amazon

Windows için Kurulum:
- Ruby Installer Kurulur - Archieve Ruby+Devkit Installers v-2.3.6 https://rubyinstaller.org/downloads/
- Kurulumdan sonra ruby -v ve gem -v ile kurulumların düzgün yapıldığı kontrol edilir.
- Ansicon kurulumu yapılır ve C dosyasının içerisine bir dosya eklenerek extract yapılır. Environment variables PATH kısmına dosya  eklenir. https://github.com/adoxa/ansicon
- Chromedriver kurulumu Chrome versiyonuna uygun olarak yapılır. https://chromedriver.chromium.org/  Uygun chromedriver "webdriver_binaries" dosyasının içerisine kopyalanır. Environment variables PATH kısmına dosya  eklenir.
- RubyMine IDE Kurulur. https://www.jetbrains.com/ruby/download/#section=windows

*RubyMine indirilmeden console üzerinden çalıştırmak istenirse:*
dosya üzerinden "cucumber features" şeklinde çalıştırılır.

*RubyMine ile senaryolar çalıştırmak istenirse:*
features-regression dosyasının altında senaryoya sağ tıklayarak çalıştırılır.

