	
	
(ccards-get-card 	
	(ccards-add 
		(ccards-add (make-ccards) 
			1 (make-card 'diamond 10)) 
		2 (make-card 'spades 4)))
		
		


(ccards-get-card  (make-ccards))			

(calculate-hand-winner  
	(ccards-add	
	(ccards-add
		(ccards-add 
			(ccards-add (make-ccards) 
				1 (make-card 'diamond 10)) 
			2 (make-card 'hearts 4))
		3 (make-card 'spades 4))
	4 (make-card 'diamond 'A)))
					

	((car  
		(ccards-get-card (ccards-add	
		(ccards-add
			(ccards-add 
				(ccards-add (make-ccards) 
					1 (make-card 'diamond 10)) 
				2 (make-card 'spades 4))
			3 (make-card 'clubs 4))
		4 (make-card 'hearts 'A)))) 'card)


		(suit-of ((car (ccards-add (make-ccards) 
			1 (make-card 'diamond 10))) 'card))