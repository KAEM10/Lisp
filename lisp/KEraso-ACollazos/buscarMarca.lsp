;Integrantes Kevin Eraso - Andres Collazos
;Funcion para consultar los computadores de una empresa que sean marca ASUS
(defun buscarAsus()
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
                        (setq contC 0)
                        (setq contAsus 0)
                        (if (eq (aref (Empresa-computadores empresaAux) 0) 0)
                            (progn (print "No hay computadores registrados en la empresa") (return))
                        )
                        (loop
                            (setq compuAux (aref (Empresa-computadores empresaAux) contC))
                            (if (eq (aref (Empresa-computadores empresaAux) contC) 0)
                                (return)
                                (progn
                                    (if (eq (Computador-marca compuAux) 'asus)
                                        (progn
                                            (setq contAsus (+ contAsus 1))
                                            (setq contC (+ contC 1))
                                        )
                                        (progn
                                            (setq contC (+ contC 1))
                                            (if (> contC 2)
                                                (progn
                                                    (print "No existe el computador")
                                                    (return)
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                            (when (> contC 2)(return))
                        )
                        (format t "~%")
                        (format t "Hay ~D computadores ASUS registrados en la empresa.~%" contAsus)
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