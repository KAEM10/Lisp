#|(setq despensa '(arroz leche huevos papa azucar))
(print "Dijite el producto")
(setq prod (read))
(setq flag 0)

(loop 
    (setq item (car despensa))
    (if (eq prod item) (setq flag 1) (setq despensa (cdr despensa)))
    (when (or (null despensa) (eq flag 1)) (return))
)

(if (eq flag 1) 
(progn (print "Dijite la cantidad") (setq cant (read))
(cond((= cant 100) (print "Tiene la cantidad exacta en la despensa")) 
    ((> cant 100) (print "Tiene la cantidad es mayor en la despensa")) 
    ((< cant 100) (print "Tiene la cantidad es menor en la despensa"))))
(print "El producto no esta en la lista"))|#

(setq vec (make-array 5))
(setq i 0)
(setq a 0)
(loop
    (setf (aref vec i) (read))
    (setq i (+ i 1))
    (when (> i 4)(return))
)
(print vec)
(setq i 0)
(loop
    (cond 
    ((zerop (aref vec i)) (setq a a))
    ((evenp (aref vec i)) (+ a 1)))
    (setq i (+ i 1))
    (when (> i 4)(return))
)
(print a)
