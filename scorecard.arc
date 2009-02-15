
;;scorecard
;; it is a list of hashes
(def make-scorecard (rscores) 
	(if (no rscores)
		(list)
		rscores))

(def scorecard-add (rscore scorecard)
 (push rscore scorecard))



(def scorecard-for-id (scorecard id)
	(reduce + 	(map1 
								(fn (hash-table) (hash-table id))
							scorecard)))

(def scorecard-highest (scorecard)
	(let t (table)
		(each player '(1 2 3 4)
			(= (t player) (scorecard-for-id scorecard player)))
		(car (sort (fn (x y) (> (t x) (t y))) (keys t)))))
