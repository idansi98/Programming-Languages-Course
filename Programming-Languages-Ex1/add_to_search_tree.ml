type 'a binary_tree = 
  |Empty
  |Node of 'a * 'a binary_tree * 'a binary_tree;;

let rec add_to_search_tree tree el = 
  match tree with 
   Empty -> Node (el, Empty, Empty)
  |Node (va, left, right)  -> 
      if el<va then Node(va, add_to_search_tree left el, right) 
      else Node(va, left, add_to_search_tree right el)