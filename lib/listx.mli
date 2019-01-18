(* vim: set ft=ocaml sw=2 ts=2: *)

(**
 * listx.mli
 *
 * A module with utility functions for
 * list genertaion and processing
 *)

val range : int -> int -> int list
(** [range start stop] generattes a list of int values
    with given range ([start] included, [stop] excluded) *)


val split : int ->  'a list -> ('a list) * ('a list)
(** [split pos l] splits the given list [l] at [pos] *)


val part : int ->  'a list -> 'a list list
(** [part n l] partitions the given list [l] into [n] parts *)


(**
 * extracts a sublist of the given indices (inclusive).
 * Returns an empty list, if out of bounds.
 *)
val sub_list : int -> int -> 'a list -> 'a list


(**
 * takes out the first element equal to a
 *)
val take_out_first : 'a -> 'a list -> 'a list


(**
 * random sampling of list entries
 *)
val sample_list : ?n:int -> 'a list -> 'a list



