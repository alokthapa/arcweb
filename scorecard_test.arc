

;;scorecard

(is 20 
	(let scorecard1 (make-scorecard 
		(list (obj 1 10 2 20 3 30)
				(obj 1 10 2 20 3 30)))
			(scorecard-for-id scorecard1 1)))
				