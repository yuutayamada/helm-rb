# helm-rb.el

Search for Ruby's methods by ag and display the methods by helm.

### Requirement
This package is requirements [ag(the silver searcher)](https://github.com/ggreer/the_silver_searcher), helm.el, helm-ag-r.el and ri.

### Installation
Make sure whether you can use ag and ri command.

For package.el
You need register melpa repository if you didn't register it yet.

```lisp
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)
(package-initialize)
```

Then you can install helm-rb by M-x package-install RET helm-rb.
helm.el and helm-ag-r.el are installed automatically, so you don't care about those packages.

For el-get
Firstly you need to install helm and helm-ag-r package to resolve dependencies.

And then set below configuration to your .emacs

```lisp
(push '(:name helm-rb
           :type git
           :url "https://github.com/yuutayamada/helm-rb.git"
           :depends (helm helm-ag-r)
           :load-path "./")
           el-get-sources)
```

Then you can install this package by M-x el-get-install helm-rb.

### Usage
Set your below configuration to your .emacs etc..

```lisp
(add-to-list 'load-path "path/to/this-package")
(require 'helm-rb)
```

and then push M-x helm-rb
