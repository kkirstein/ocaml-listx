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


val sub_list : int -> int -> 'a list -> 'a list
(** [sub_list start stop l] extracts a sublist of given
    [start] and [stop] indices (inclusive). If indices are
    out of bounds an empty list is returned. *)


val take_out_first : 'a -> 'a list -> 'a list
(** [take_out_first elem l] removes the first element
    equal to [elem] from the given list [l]. *)


val sample_list : ?n:int -> 'a list -> 'a list
(** [sample_list ?n l] randomly samples [n] elements
    from given list [l]. [n] defaults to all elements
    if not given. *)


val filter_map : 'a option list -> 'a list
(** [filter_map l] filters a list [l] with elements
    of type ['a option] for non [None] values. *)

