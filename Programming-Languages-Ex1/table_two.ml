type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr;;

let rec eval a b expr a_value b_value =
  match expr with
    Var(c) -> if c = a then a_value else b_value
  |And(c, d) -> (eval a b c a_value b_value) && (eval a b d a_value b_value)
  |Not(c) -> (not (eval a b c a_value b_value))
  |Or(c, d) -> (eval a b c a_value b_value) || (eval a b d a_value b_value);;

let table_two = fun a b expr ->
  [true, true, eval a b expr true true; 
   true, false, eval a b expr true false;
   false, true, eval a b expr false true;
   false, false, eval a b expr false false];;
  



