(ns hello.core)

(defn isPrime
  "Checks if X is prime"
  [x]
      (loop [x x d 2]
          (cond
            (< x 2) false
            (> (* d d) x) true
            (< d 2) false
            (zero? (rem x d)) false
            :else (recur x (inc d))
          )

      )
  )

(defn getPrime
    [n]
        (loop [x 2 n n]
            (if (zero? n)
              (dec x)
              (if (isPrime x)
                (recur (inc x) (dec n))
                (recur (inc x) n)
              )
            )

        )
    )


(defn -main
  "docstring"
  [a]
      (println (time (getPrime (Integer/parseInt a))))
      ;(println (isPrime (Integer/parseInt a)))
  )
