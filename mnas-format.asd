;;;; mnas-format.asd

(defsystem "mnas-format"
  :description " @b(Описание:) система @b(mnas-format) предназначена
 для получения округленного представления величин. С её помощью можно
 получить округленное представление для: 
 @begin(list) 
 @item(отдельного значения;) 
 @item(одномерного списка (1d-list) значений;) 
 @item(двумерного списка  (2d-list) значений.) 
 @end(list)"
  :author "Mykola Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"    
  :version "0.1.2"
  :serial nil
  :components ((:module "src" 
                :serial nil
                :components
                ((:file "mnas-format")))))

(defsystem "mnas-format/docs"
  :description "Зависимости для сборки документации"
  :author "Mykola Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("mnas-format" "codex" "mnas-package")
  :components ((:module "src/docs"
		:serial nil
                :components ((:file "docs")))))
