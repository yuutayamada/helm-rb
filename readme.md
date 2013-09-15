### Requirement
This package is requirement [ag(the silver searcher)](https://github.com/ggreer/the_silver_searcher)

### Installation
First you need to install helm and helm-ag-r package to resolve dependencies.

And then set below configuration to your .emacs

    (push '(:name helm-rb
               :type git
               :url "https://github.com/yuutayamada/helm-rb.git"
               :depends (helm helm-ag-r))
               el-get-sources)

Then you can install this package by M-x el-get-install helm-rb.

### Usage
Set your below configuration to your .emacs etc..

    (add-to-list 'load-path "path/to/this-package")
    (setq helm-rb-get-methods-path "path/to/get_methods.rb")
    (require 'helm-rb)

and then push M-x helm-rb
