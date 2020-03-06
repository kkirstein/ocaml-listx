(* vim: set ft=ocaml sw=2 ts=2: *)

(**
 * listx.ml
 *
 * A module with often needed utility functions for
 * list genertaion and processing
*)

(**
 * generates a list of int values with given range
 * (start inclusive, stop exlcusive)
*)
let rec range start stop =
  if start < stop then start :: range (start + 1) stop
  else []


(**
 * splits the list into a parts at the given position
*)
let split pos l =
  let len = List.length l in
  let rec loop a b cur =
    if cur < pos && cur < len then loop ((List.hd b) :: a) (List.tl b) (cur + 1)
    else (List.rev a, b)
  in
  loop [] l 0

(*
let take n l =
  let rec loop res l' =
    match l' with
    | []      -> (res, [])
    | h :: t  -> if List.length res < n then (loop (List.append res [h]) t)
      else (res, l') in
  loop [] l
*)


(** partition list *)
let part n l =
  let rec loop tail =
    match tail with
    | []  -> []
    | ll  -> let (f, t) = split n ll in f :: (loop t) in
  loop l


(**
 * extracts a sublist of the given indices (inclusive).
 * Returns an empty list, if out of bounds.
*)
let sub_list start stop l =
  let rec loop i ll =
    match ll with
    | [] -> ll
    | h :: t -> if i >= start && i <= stop then h :: (loop (i + 1) t)
      else loop (i + 1) t
  in
  loop 0 l


(**
 * takes out the first element equal to a
*)
let take_out_first a l =
  let flag = ref false in
  List.fold_left
    (fun acc x -> if x = a && not !flag then (flag := true; acc) else x :: acc)
    [] l |>
  List.rev


(**
 * random sampling of list entries
*)
let sample_list ?n l =
  let len = match n with
    | None    -> List.length l
    | Some n  -> n
  in
  let rec loop l i =
    if i < len then
      match l with
      | [] -> []
      | l -> let idx = Random.int (List.length l) in
        let sample = List.nth l idx in
        let remain = take_out_first sample l in
        sample :: loop remain (i + 1)
    else []
  in
  loop l 0


(* filter_map *)
let filter_map l =
  List.fold_left (fun acc el -> match el with Some x -> x :: acc | None -> acc) [] l
  |> List.rev

