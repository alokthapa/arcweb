


;;test for equal-card?
(equal-card? 
		(make-card 'diamonds '4) 
		(make-card 'diamonds '4))
		
(~equal-card? 
	(make-card 'diamonds '5) 
	(make-card 'diamonds '4))

(~equal-card? 
	(make-card 'hearts '4) 
	(make-card 'diamonds '4))

(~equal-card? 
	(make-card 'hearts '10) 
	(make-card 'diamonds '4))

(~equal-card? 
	nil
	(make-card 'diamonds '4))
	
;;test for iso-cards?

(iso-cards? (list	
				(make-card 'diamonds 4)
				(make-card 'hearts 5))
			(list	
				(make-card 'diamonds 4)
				(make-card 'hearts 5)))
				
(~iso-cards? (list	
				(make-card 'hearts 4)
				(make-card 'hearts 5))
			(list	
				(make-card 'diamonds 4)
				(make-card 'hearts 5)))
				
(~iso-cards? (list
				(make-card 'hearts 5))
			(list	
				(make-card 'diamonds 4)
				(make-card 'hearts 5)))
				
(~iso-cards? nil
			(list	
				(make-card 'diamonds 4)
				(make-card 'hearts 5)))
		

		
				(def find-player (players id)
					(find (fn (x) (is (playerid x) id)) 
						players))
