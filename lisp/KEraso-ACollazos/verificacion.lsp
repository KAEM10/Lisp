;Integrantes Kevin Eraso - Andres Collazos
;la función validarNum garantiza que el usuario ingrese un número entero mayor a cero. 
(defun validarNum ()
   (setq valNum 0)
   (loop
      (setq nit (read))
      (if (and (numberp nit) (> nit 0))
         (setq valNum 1)
         (progn
            (print "Debe ingresar un NUMERO mayor a 0")
            (print "Ingrese un numero valido:")
         )
      )
      (when (eq valNum 1) (return))
   )
   nit
)

;La función verificarNit sirve para verificar si un NIT ingresado ya está en uso. 
(defun verificarNit()
   (if (eq contEmpresas 0)
      (setq nit (validarNum))
      (progn 
         (setq cont 0)
         (setq flagNit 0)
         (loop
            (setq nit (validarNum))
            (setq empresaAux (aref empresas cont))
            (if (eq nit (Empresa-nit empresaAux))
               (progn
                  (print "El nit de la empresa ya esta en uso.")
                  (print "Ingrese un nit diferente:")
               )
               (progn
                  (setq cont (+ cont 1))
                  (if (eq cont contEmpresas)
                     (setq flagNit 1)
                  )
               )
            )
            (when (eq flagNit 1)(return))
         )
      )
   )
   nit
)

;La función verificarSerial sirve para verificar si un serial ingresado ya está en uso.
(defun verificarSerial (empresaAux)
   (if (eq (aref (Empresa-computadores empresaAux) 0) 0)
      (setq serialAux (validarNum))
      (progn 
         (setq flagSerial 0)
         (setq contCompu 0)
         (setq serialAux (validarNum))
         (loop
            (setq computadorAux (aref (Empresa-computadores empresaAux) contCompu))
            (if (eq computadorAux 0)
               (progn 
                  (setq contCompu (+ contCompu 1))
                  (if (eq contCompu 3)
                     (setq flagSerial 1)
                  )
               )
               (progn
                  (if (eq serialAux (Computador-serial computadorAux))
                     (progn
                        (print "El serial ya fue registrado.")
                        (setq serialAux 0)
                     )
                     (progn
                        (setq contCompu (+ contCompu 1))
                        (if (eq contCompu 3)
                           (setq flagSerial 1)
                        )
                     )
                  )
               )
            )
            (when (eq flagSerial 1) (return))
         )
      )
   )  
   serialAux 
)

;La función verificarMarca sirve para verificar si una marca ingresada es válida.
(defun verificarMarca()
   (setq valMarca 0)
   (loop
      (setq marca (read))
      (if (member marca marcasValidas :test #'string=)
         (setq valMarca 1)
         (progn
            (print "Debe ingresar una marca valida (ASUS, DELL, LENOVO)")
            (print "Ingrese una marca:")
         )
      )
      (when (eq valMarca 1) (return))
   )
   marca
)