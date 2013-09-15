### Requirement
This package is requirement [ag(the silver searcher)](https://github.com/ggreer/the_silver_searcher) 

### Usage
Set your below configuration to your .emacs etc..

    (add-to-list 'load-path "path/to/this-package")
    (setq helm-rb-get-methods-path "path/to/get_methods.rb")
    (require 'helm-rb)

and then push M-x helm-rb
