;Integrantes Kevin Eraso - Andres Collazos
(setq contEmpresas 0)

;Funcion que registra una empresa y la agrega al vector de empresas
(defun ingresarEmpresa()
   (if (< contEmpresas 2)
      (progn 
         (setq emp (make-Empresa))
         (print "Ingrese el nit de la empresa: ")
         (setq nit (verificarNit))
         (setf (Empresa-nit emp) nit)
         (print "Ingrese el nombre de la empresa: ")
         (setf (Empresa-nombre emp) (read))
         (print "Ingrese el direccion de la empresa: ")
         (setf (Empresa-direccion emp) (read))

         ;Se crea un vector auxiliar inicializado en 0 para agregarlo al vector de computadores de la empresa
         (setq vecAux (make-array 3))
         (dotimes(i 3)
            (setf (aref vecAux i) 0)
         )

         (setf (Empresa-computadores emp) vecAux)
         (setf (aref empresas contEmpresas) emp)
         (setq contEmpresas (+ contEmpresas 1))

         (print "Empresa registrada con exito.")
      )
      (print "No se pueden ingresar mas empresas.")
   )
)

;Funcion que registra un computador y lo agrega al vector de computadores de una empresa
(defun ingresarComputador()
   (if (eq contEmpresas 0) 
      (print "No hay empresas registradas")
      (progn
         (setq flagCompu 0)
         (setq cont 0)
         (print "Ingrese el nit de la empresa: ")
         (setq nitEmpresaAux (validarNum))
         (loop
            (setq empresaAux (aref empresas cont))
            (if (equal nitEmpresaAux (Empresa-nit empresaAux))
               (progn
                  (setq compu (make-Computador))
                  (print "Ingrese el serial del computador: ")
                  (setq serialAux (verificarSerial empresaAux))
                  (if (eq serialAux 0)(return))
                  (setf (Computador-serial compu) serialAux)
                  (print "Ingrese la marca del computador (ASUS, DELL, LENOVO):")
                  (setf marcaAux (verificarMarca))
                  (setf (Computador-marca compu) marcaAux)
                  (print "Ingrese el tipo de disco duro del computador: ")
                  (setf (Computador-tipoDiscoDuro compu) (read))
                  
                  (setq i 0)
                  (loop
                     (if (eq (aref (Empresa-computadores empresaAux) i) 0)
                        (progn
                           (setf (aref (Empresa-computadores empresaAux) i) compu)
                           (setf (aref empresas cont) empresaAux)
                           (setq flagCompu 1)
                           (print "Computador registrado con exito.")
                        )
                        (progn 
                           (setq i (+ i 1))
                           (if (> i 2)
                              (progn
                                 (print "No se pueden ingresar mas computadores.")
                                 (setq flagCompu 1)
                              )
                           )
                        )
                     )
                     (when (eq flagCompu 1) (return))
                  )
               )
               (progn
                  (setq cont (+ cont 1))
                  (if (eq cont contEmpresas)
                     (progn
                        (print "No existe la empresa.")
                        (return)
                     )
                  )
               )
            )
            (when (eq flagCompu 1) (return))
         )
      )
   )
)