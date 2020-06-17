#!/usr/bin/sbcl --script

(defmacro timing (&body forms)
    (let ((real1 (gensym))
	    (real2 (gensym))
	    (run1 (gensym))
	    (run2 (gensym))
	    (result (gensym)))
    `(let* ((,real1 (get-internal-real-time))
	      (,run1 (get-internal-run-time))
	      (,result (progn ,@forms))
	      (,run2 (get-internal-run-time))
	      (,real2 (get-internal-real-time)))
	 (format *debug-io* ";;; Computation took:~%")
	 (format *debug-io* ";;;  ~f seconds of real time~%"
		 (/ (- ,real2 ,real1) internal-time-units-per-second))
	 (format t ";;;  ~f seconds of run time~%"
		 (/ (- ,run2 ,run1) internal-time-units-per-second))
	 ,result)))


(defvar n (car (cdr sb-ext:*posix-argv*)))

(defun live (o l a la aa laa days)
    (if (= days 0)
        (+ o l a la aa laa)
        (live
            (+ o a aa)
            (+ o l a la aa laa)
            o
            l
            a
            la
            (- days 1)
        )
    )
)

(defun run (n)
    (live 1 0 0 0 0 0 (parse-integer n)))

(write-line (concatenate 'string
    "n: "
    n
))
(write-line (concatenate 'string
    "res: "
    (princ-to-string (timing (run n)))
))

; vim:sw=4:ts=4:et:
