#!/usr/bin/env newlisp
# Copyright (c) 2015, Barry Arthur <barry.arthur@gmail.com>

(setq magnitudes '("B" "K" "M" "G"))

(define (human b , (radix 0))
  (while (> (/ b 1024) 0)
    (set 'b (div b 1024))
    (inc radix))
  (format "%.2f %s" b (nth radix magnitudes)))

(define (printer f)
  (println (format "%9s  %s" (human (int (f 0))) (f 1))))

(define (reader l)
  (parse l {\t} 0))

(define (du-sort i j)
  (< (int (i 0)) (int (j 0))))

(setf glob (join (or (slice (main-args) 2) (list "*")) " "))
(map printer (sort (map reader (exec (string "du -sb " glob))) du-sort))
(exit)
