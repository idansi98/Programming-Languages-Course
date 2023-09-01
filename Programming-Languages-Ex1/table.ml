type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr;;

let rec eval expr l = 
  match l with
    Var (a) -> List.assoc a expr
  |And(b, c) -> (eval expr b) && (eval expr c)
  |Or(b, c) -> (eval expr b) || (eval expr c)
  |Not (a) -> not (eval expr a)
  
let rec f empty vars expr =
  match vars with
  [] -> [(List.rev empty, eval empty expr)]
  |h::t -> f ((h, true)::empty)t expr @f ((h, false)::empty)t expr

let table vars expr = f [] vars expr;;