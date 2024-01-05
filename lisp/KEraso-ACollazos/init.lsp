;Integrantes Kevin Eraso - Andres Collazos
; Función que permite crear una empresa y computadores asociados
(defun crearEstructura()
; Definición de la estructura Empresa
(defstruct Empresa
  nit
  nombre
  direccion
  computadores
)
; Definición de la estructura Computador
(defstruct Computador
  serial
  marca
  tipoDiscoDuro
)
; Inicialización de una matriz de estructuras llamada 'empresas'
(setq empresas (make-array 2))
; Lista de marcas de computadoras válidas
(setq marcasValidas '(asus dell lenovo))

; Inicialización de la matriz 'empresas' en 0
(dotimes(i 2)
	(setf (aref empresas i) 0)
)
)


