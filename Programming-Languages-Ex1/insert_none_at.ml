let rec insert_at e index list =
  match index with
    0 -> e :: list
  |_ -> (List.hd list)::(insert_at e (index-1) (List.tl list))

let rec insert_none_at index list =
  insert_at "None" index list
                  