
;;idiom : 
;; ccards -> current-cards
;;
;;(def make-ccards ()
;;	(table))
;;	
;;(def ccards-add (ccards id card)
;;	(= (ccards id) card))
;;
;;(def ccards-get-card (ccards)
;;	(vals ccards))
;;
	
(deftem current-card id nil card nil)

(def make-ccards () '())

(def ccards-add (ccards id card)
	(= ccards (cons (inst 'current-card 'id id 'card card) ccards)))

(def ccards-get-card (ccards)
	(map1 (fn (x) x!card) ccards))


