 ; Define List type and structure
(: List type)
(: Nil List)
(: Cons (-> Number List List))

 ; Length of a list
(= (length ()) 0)
(= (length (Cons $x $xs)) (+ 1 (length $xs)))

 ; Check if an element is a member of the list
(= (is-member $element ()) false)
(= (is-member $element (Cons $x $xs))
    (if (= $element $x)
        true
        (is-member $element $xs)))

 ; Append two lists
(= (append () $list) $list)
(= (append (Cons $x $xs) $list) (Cons $x (append $xs $list)))

 ; Find the maximum value in a list
(= (max-value (Cons $x (Cons $y $xs)))
    (if (> $x $y)
        (max-value (Cons $x $xs))
        (max-value (Cons $y $xs)))
)
(= (max-value (Cons $x ()) $x) ; base case for a single element

     ; Find the minimum value in a list
    (= (min-value (Cons $x (Cons $y $xs)))
        (if (< $x $y)
            (min-value (Cons $x $xs))
            (min-value (Cons $y $xs)))
    ))
(= (min-value (Cons $x ()) $x) ; base case for a single element

     ; Push an element onto the front of the list
    (= (push $element $list) (Cons $element $list))

     ; Pop the first element from the list
    (= (pop (Cons $x $xs)) (Cons $x xs)) ; returns (x, xs)

     ; Remove the first occurrence of an element from the list
    (= (remove-element $element ()) ())
    (= (remove-element $element (Cons $x $xs))
        (if (= $element $x)
            $xs
            (Cons $x (remove-element $element $xs)))
    ))

 ; Remove duplicates from the list
(= (remove-duplicate ()) ())
(= (remove-duplicate (Cons $x $xs))
    (Cons $x (remove-duplicate (remove-element $x $xs))))

 ; Map a function over the list
(= (map $f ()) ())
(= (map $f (Cons $x $xs)) (Cons ($f $x) (map $f $xs)))

 ; Filter elements based on a predicate
(= (filter $pred ()) ())
(= (filter $pred (Cons $x $xs))
    (if ($pred $x)
        (Cons $x (filter $pred $xs))
        (filter $pred $xs))
)

 ; Left fold function
(= (foldl $f $acc ()) $acc)
(= (foldl $f $acc (Cons $x $xs))
    (foldl $f ($f $acc $x) $xs))

 ; Right fold function
(= (foldr $f $acc ()) $acc)
(= (foldr $f $acc (Cons $x $xs))
    ($f $x (foldr $f $acc $xs)))

 ; Reverse the list
(= (reverse ()) ())
(= (reverse (Cons $x $xs)) (append (reverse $xs) (Cons $x ())))

 ; Sort the list using insertion sort
(= (sort ()) ())
(= (sort (Cons $x $xs))
    (insert $x (sort $xs)))

(= (insert $x ()) (Cons $x ()))
(= (insert $x (Cons $y $ys))
    (if (<= $x $y)
        (Cons $x (Cons $y $ys))
        (Cons $y (insert $x $ys)))
)

 ; Test Cases
! (length (Cons 1 (Cons 2 (Cons 3 Nil))) ) ; Should output: 3
! (is-member 2 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; Should output: true
! (append (Cons 1 (Cons 2 Nil)) (Cons 3 (Cons 4 Nil))) ; Should output: [1, 2, 3, 4]
! (max-value (Cons 1 (Cons 5 (Cons 3 Nil)))) ; Should output: 5
! (min-value (Cons 1 (Cons 5 (Cons 3 Nil)))) ; Should output: 1
! (push 0 (Cons 1 (Cons 2 Nil))) ; Should output: [0, 1, 2]
! (remove-element 2 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; Should output: [1, 3]
! (remove-duplicate (Cons 1 (Cons 2 (Cons 1 (Cons 3 Nil))))) ; Should output: [1, 2, 3]
! (map (lambda $x (+ $x 1)) (Cons 1 (Cons 2 (Cons 3 Nil)))) ; Should output: [2, 3, 4]
! (filter (lambda $x (> $x 1)) (Cons 1 (Cons 2 (Cons 3 Nil)))) ; Should output: [2, 3]
! (foldl (lambda ($acc $x) (+ $acc $x)) 0 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; Should output: 6
! (foldr (lambda ($x $acc) (+ $x $acc)) 0 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; Should output: 6
! (reverse (Cons 1 (Cons 2 (Cons 3 Nil)))) ; Should output: [3, 2, 1]
! (sort (Cons 3 (Cons 1 (Cons 2 Nil)))) ; Should output: [1, 2, 3]
