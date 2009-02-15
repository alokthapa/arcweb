
;;testing data
(= *p1 (inst 'player 'id 1 'cards '()))
(= *p2 (inst 'player 'id 2 'cards '()))
(= *p3 (inst 'player 'id 3 'cards '()))
(= *p4 (inst 'player 'id 4 'cards '()))

(def new-plys ()
     (list *p1 *p2 *p3 *p4))

(= *plys (new-plys))
	(distr-cards (shuffle (new-deck)) (new-plys))


(let plys (list (inst 'player 'id 1 'cards '())
								(inst 'player 'id 2 'cards '())
								(inst 'player 'id 3 'cards '())
								(inst 'player 'id 4 'cards '()))
								
								(def newgame ()
									(distr-cards (shuffle (new-deck)) plys)
									(gameplay plys)))
									
									
(let counter 0
	(def displaycounter () counter))