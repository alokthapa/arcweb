

;;tests for valid-suit-moves

;;no cards of the given suit exists
(empty 
 	 (valid-suit-moves	(make-card 'diamonds 10)
					(list 	(make-card 'hearts 5)
							(make-card 'spades 'A)
							(make-card 'spades 2)
							(make-card 'spades 10))))

;;a card of the valid suit with higher order exists
(equal-card? (make-card 'diamonds 'A)
 		 	(car (valid-suit-moves	(make-card 'diamonds 10)
					(list 	(make-card 'diamonds 5)
							(make-card 'diamonds 'A)
							(make-card 'diamonds 2)
							(make-card 'spades 10)))))

;;no card of valid suit exists, so returns all cards of suit

(equal-card? (make-card 'diamonds '2)
 		 	(car (valid-suit-moves	(make-card 'diamonds 10)
					(list 	(make-card 'hearts 5)
							(make-card 'hearts 'A)
							(make-card 'diamonds 2)
							(make-card 'spades 10)))))

;; tests for valid-moves 

;;pcards is empty
(iso-cards? (list	(make-card 'diamonds 'A) 
					(make-card 'hearts 10)) 
			(valid-moves 
					(list	
						(make-card 'diamonds 'A)
						(make-card 'hearts 10))
					nil))


;;no cards of given first suit
(iso-cards? (list	(make-card 'diamonds 'A) 
					(make-card 'hearts 10)) 
			(valid-moves 
					(list	
						(make-card 'diamonds 'A)
						(make-card 'hearts 10))
					(list (make-card 'clubs 10))))

;; cards of the given suit of higher order exists
(iso-cards? (list (make-card 'diamonds 'A) (make-card 'diamonds 'K))
	 		(valid-moves (list	(make-card 'diamonds 'A)  
								(make-card 'hearts 10)
								(make-card 'diamonds 'K))
								(list (make-card 'diamonds 10))))

;; cards of the given suit of lower order exists
(iso-cards? (list (make-card 'diamonds '2) (make-card 'diamonds '3))
	 		(valid-moves (list	(make-card 'diamonds '2)  
								(make-card 'hearts 10)
								(make-card 'diamonds '3))
								(list (make-card 'diamonds 10))))

;;no cards of given first suit, but have winsuit cards
(iso-cards? (list	(make-card 'spades 'A) 
					(make-card 'spades 10)) 
			(valid-moves 
					(list	
						(make-card 'diamonds 'A)
						(make-card 'spades 'A)
						(make-card 'spades '10)
						(make-card 'hearts 10))
					(list (make-card 'clubs 10))))

;;no cards of given suit or winsuits
(iso-cards? (list	
					(make-card 'diamonds 'A)
					(make-card 'hearts 'A)
					(make-card 'hearts '10)
					(make-card 'hearts 10))
			(valid-moves 
					(list	
						(make-card 'diamonds 'A)
						(make-card 'hearts 'A)
						(make-card 'hearts '10)
						(make-card 'hearts 10))
					(list (make-card 'clubs 10))))
					

;;test for get-called-points									
(iso '( 4 3 3 4) (get-called-points *plys))
