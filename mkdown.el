;;; mkdown.el --- Pretty Markdown previews based on mkdown.com

;; Author: Andrew Tulloch
;; URL: https://github.com/ajtulloch/mkdown.el
;; Version: 0.1
;; Created: 17-05-2014
;; Keywords: markdown

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; A clean stylesheet for Markdown files in Emacs.
;; See mkdown.com for the web equivalent.  CSS taken from mkdown.com
;; under the MIT License.

;;; License:

;; The MIT License (MIT)

;; Copyright (c) 2014 Andrew Tulloch

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.



;;; Code:

(require 'markdown-mode)

;;;###autoload
(defun mkdown-css-file-name ()
  "Find the mkdown.css from the current file's directory."
  (format "%s%s"
          (file-name-directory (or load-file-name buffer-file-name))
          "mkdown.css"))

;;;###autoload
(defadvice markdown-export-and-preview (around set-css activate compile)
  "Export and Preview with the mkdown.css file.
Store the previous markdown-css-path, update to the mkdown css,
and reset after saving."
  (setq previous-markdown-css-path markdown-css-path)
  (setq-default markdown-css-path (mkdown-css-file-name))
  ad-do-it
  (setq-default markdown-css-path previous-markdown-css-path))

(provide 'mkdown)

;;; mkdown.el ends here
