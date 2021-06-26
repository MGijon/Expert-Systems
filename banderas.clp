(deftemplate pais (slot nombre)
(multislot bandera) )

(deffacts paises
(pais (nombre Ecuador)
(pais (nombre Spain) (pais (nombre France) (pais (nombre Italy) (lista-noes)
)
(defrule pide-banderas
(initial-fact) =>
(bandera amarillo azul rojo)) (bandera amarillo rojo)) (bandera blanco azul rojo)) (bandera blanco verde rojo))
(printout t "Introduce los colores: " ) (bind $?colores (explode$ (readline))) (assert (entrada $?colores))
)

(defrule compara-banderas
(entrada $? ?color $?)
(pais (nombre ?nombre) (bandera $?col-band)) (test (not (member$ ?color $?col-band))) ?noes <- (lista-noes $?paises)
(test (not (member$ ?nombre $?paises)))
=>
(retract ?noes)(printout t "La bandera de " ?nombre " no tiene el color: " ?color crlf) (assert (lista-noes $?paises ?nombre))
)

(defrule imprime-paises
(declare (salience -100))
(pais (nombre ?nombre))
(lista-noes $?paises)
(test (not (member$ ?nombre $?paises)))
=>
(printout t "Un pais cuya bandera tiene esos colores es: " ?nombre crlf )

)
