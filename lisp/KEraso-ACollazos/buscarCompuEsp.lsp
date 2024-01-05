;Integrantes Kevin Eraso - Andres Collazos
;Funcion para buscar un computador con un serial especifico y un nit de empresa especifico
(defun buscarCompu()
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
                        (if (eq (aref (Empresa-computadores empresaAux) 0) 0)
                            (progn (print "No hay computadores registrados en la empresa") (return))
                        )
                        (setq contC 0)
                        (print "Ingrese el serial del computador")
                        (setq serialCompuAux (validarNum))
                        (loop
                            (setq compuAux (aref (Empresa-computadores empresaAux) contC))
                            (if (eq (aref (Empresa-computadores empresaAux) contC) 0)
                                (progn
                                    (print "No existe el computador")
                                    (return)
                                )
                                (progn
                                    (if (equal serialCompuAux (Computador-serial compuAux))
                                        (progn
                                            (print "Computador encontrado")
                                            (format t "~%")
                                            (format t "Serial: ~D~%" (Computador-serial compuAux))
                                            (format t "Marca: ~S~%" (Computador-marca compuAux))
                                            (format t "Tipo de disco duro: ~S~%" (Computador-tipoDiscoDuro compuAux))
                                            (return)
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