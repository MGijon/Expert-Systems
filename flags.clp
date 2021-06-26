;; 
(deftemplate country 
    (slot name)
    (slot flag)
)
(deffacts countries
    (country (name Ecuador) (flag yellow red blue))
    (country (name Spain) (flag yellow red))
    (country (name France) (flag white blue red))
    (country (name Italy) (flag green white red))
    (lista-noes)
)
(defrule ask-for-flags
    (initial-fact)
    =>
        (printout t "Introduce the colors: ")
        (bind $?colors (explode$(readline)))
        (assert (enter $?colors))
)
(defrule compare-flags 
    (enter $? ?color $?)
    (country (name ?name) (flag $?col-flag))
    (test (not (member$ ?color $?col-flag)))
    ?noes <- (list-noes $?countries)
    (test (not (member$ ?name $?country)))
    =>
        (retract ?noes)
        (printout t "The flag of " ?name " does not is not:" ?color crlf)
        (assert (list-noes $?countries ?name))
)
(defrule print-countries
    (declare (salience - 100))
    (pais (name ?name))
    (list-noes $?countries)
    (test (not (member$ ?name $?countries)))
    =>
        (printout t "One country whose flag has this colors is: " ?name crlf)
)