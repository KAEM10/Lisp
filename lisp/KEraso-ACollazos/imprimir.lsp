;Integrantes Kevin Eraso - Andres Collazos
;busca una empresa por su nit
(defun buscarEmpresaPorNit()
   (if (eq contEmpresas 0)
      (print "No hay empresas registradas")
      (progn
         (setq cont 0)
         (print "Ingrese el nit de la empresa")
         (setq nitEmpresaAux (validarNum))
         (loop
            (setq empresaAux (aref empresas cont))
            (if (equal nitEmpresaAux (Empresa-nit empresaAux))
               (progn
                  (format t "~%")
                  (format t "Nit de Empresa: ~D~%" (Empresa-nit empresaAux))
                  (format t "Nombre de Empresa: ~S~%" (Empresa-nombre empresaAux))
                  (format t "Direccion de Empresa: ~S~%" (Empresa-direccion empresaAux))
                  (setq contC 0)
                  (loop
                     (if (eq (aref (Empresa-computadores empresaAux) contC) 0)
                        (progn
                           (print "No hay mas computadores registrados en la empresa")
                           (return)
                        )
                        (progn
                           (format t "~%")
                           (format t "~S~%" (aref (Empresa-computadores empresaAux) contC))
                           (setq contC (+ contC 1))
                        )
                     )
                     (when (> contC 2)(return))
                  )
                  (return)
               )
               (progn
                  (setq cont (+ cont 1))
                  (if (eq cont contEmpresas)
                     (progn
                        (print "No existe la empresa")
                        (return)
                     )
                  )
               )
            )
         )
      )
   )
)