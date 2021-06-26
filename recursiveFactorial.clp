;; FACTS
;; =====
(deffacts n (value 5))
(deffacts result-factorial (result 1))

;; RULES 
;; =====
(defrule compute-factorial-recursive
	?h1
	(loop-for-count ?x
		(retract ?h1 ?h2)
		(assert (result (* ?x ?r)))
		(assert (value (- ?x 1)))
	)
)

(defrule show-factorial
	(result ?r)
	=>
	(printout t "The result of the factorial is: " ?r)
) 
