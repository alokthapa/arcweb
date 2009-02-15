
;;test for equal-player?

(equal-player? (make-player 5 '()) (make-player 5 '()))

(~equal-player? (make-player 10 '()) (make-player 5 '()))

;;test for find-player

(equal-player?  (make-player 1 '()) 
				(find-player (list 
							(make-player 4 '())
							(make-player 1 '()) 
							(make-player 2 '())) 1))

(no 	(find-player (list 
							(make-player 4 '())
							(make-player 1 '()) 
							(make-player 2 '())) 100))