(*
  Reducers (interpreters) for lambda-calculus.
*)

open Utils
open Parser


exception OutOfVariablesError


let possible_variables = List.map (fun x -> char_to_string (char_of_int x)) ((range 97 123) @ (range 65 91))


let fresh_var used_vars : string = 
	if StringSet.is_empty (StringSet.diff (string_set_from_list(possible_variables)) used_vars) 
	then raise (OutOfVariablesError)
	else StringSet.choose (StringSet.diff (string_set_from_list(possible_variables)) used_vars)


(*Q.1*)
(*Free variables of a term t.*)
let rec fv t  = 
	match t with
	  Variable v -> StringSet.singleton v
	| Abstraction (v, t) -> StringSet.remove v (fv t)
	| Application (t1, t2) -> StringSet.union (fv t1) (fv t2)

(*Q.2*)
(*Substitution of a term t1 for a variable v in a term t2.*)
let rec substitute v t1 t2 = 
	match t2 with
	  Variable y -> if v = y then t1 else t2
	| Abstraction (v2, t2) -> if v = v2 then Abstraction (v2, t2)
		else if v != v2 &&  not (StringSet.mem v2 (fv t1)) then Abstraction (v2, substitute v t1 t2)
		else let new_var = fresh_var (StringSet.union(StringSet.union (fv t1) (StringSet.singleton v)) (fv t2)) in
			Abstraction (fresh_var (StringSet.union (fv t1) (fv t2)), substitute v t1 (substitute v2 (Variable new_var) t2))
	| Application (t2_1, t2_2) -> Application (substitute v t1 t2_1, substitute v t1 t2_2)
	| _ -> raise OutOfVariablesError

(*Q.3*)
(*reduce a term t using call by value*)
let rec reduce_cbv t  = 
	match t with
	  Application (t1,t2) -> 	(match reduce_cbv t1 with
															 None -> 
																(match reduce_cbv t2 with
																 None -> 
																	(match t1 with
																	   Abstraction (v, t) -> Some(substitute v t2 t)
																	  | _ -> None)
																| Some t2' -> Some(Application(t1, t2')))
															| Some t1' -> Some(Application(t1', t2)))	
	| _ -> None


(*Q.4*)	
(*reduce a term t using call by name*)
 let rec reduce_cbn t  =
 match t with
	 Application (t1,t2) -> (match t1 with
														 Abstraction (v, t) -> Some(substitute v t2 t)
														 | _ -> 
															 (match reduce_cbn t1 with
																None -> 
																 (match reduce_cbn t2 with
																	None -> None
																 | Some t2' -> Some(Application(t1, t2')))
															 | Some t1' -> Some(Application(t1', t2))))
	 | _ -> None

	 