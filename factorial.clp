;; FACTS
;; =====
(deffacts n (value 5))
(deffacts result-factorial (result 1))

;; RULES 
;; =====
(defrule compute-factorial
	?h1 ?x 1
	=>
	(retract ?h1 ?h2)
	(assert (result (* ?x ?r)))
	(assert (value (- ?x 1)))
	(refresh compute-factorial)
)

(defrule show-factorial
	(result ?r)
	=>
	(printout t "The result of the factorial is: " ?r)
)





