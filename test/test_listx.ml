(* vim: set ft=ocaml sw=2 ts=2: *)

open Listx

(* Testable types *)


(* The tests *)
let test_range () =
  Alcotest.(check (list int) "range 0 3" [0; 1; 2] (range 0 3));
  Alcotest.(check (list int) "range 2 8" [2; 3; 4; 5; 6; 7] (range 2 8));
  Alcotest.(check (list int) "zero length range" [] (range 2 2));
  Alcotest.(check (list int) "empty range" [] (range 4 2))
(* ---------------------------------------------------------------------- *)
let test_split () =
  let ll = [1; 2; 3; 4; 5; 6; 7; 8] in
  Alcotest.(check (pair (list int) (list int)) "split 0 elements" ([], ll) (split 0 ll));
  Alcotest.(check (pair (list int) (list int)) "split 1 element" ([1], [2; 3; 4; 5; 6; 7; 8]) (split 1 ll));
  Alcotest.(check (pair (list int) (list int)) "split some elements" ([1; 2; 3; 4; 5], [6; 7; 8]) (split 5 ll));
  Alcotest.(check (pair (list int) (list int)) "split too many elements gives whole list" (ll, []) (split 8 ll))
(* ---------------------------------------------------------------------- *)
let test_part () =
  let ll = [1; 2; 3; 4; 5; 6; 7; 8] in
  (* Alcotest.(check (list (list int)) "part 0 gives ampty list" [] (part 0 ll)); *)
  Alcotest.(check (list (list int)) "part 1 gives single elements (as list)"
              [[1]; [2]; [3]; [4]; [5]; [6]; [7]; [8]] (part 1 ll));
  Alcotest.(check (list (list int)) "part 4 gives lists of length 4"
              [[1; 2; 3; 4]; [5; 6; 7; 8]] (part 4 ll));
  Alcotest.(check (list (list int)) "part 8 gives lists of length 8 (whole list)"
              [[1; 2; 3; 4; 5; 6; 7; 8]] (part 8 ll));
  Alcotest.(check (list (list int)) "part 9 (too many) gives empty list"
              [[1; 2; 3; 4; 5; 6; 7; 8]] (part 9 ll))
(* ---------------------------------------------------------------------- *)
let test_sub_list () =
  let ll = [1; 2; 3; 4; 5; 6; 7; 8] in
  Alcotest.(check (list int) "sub_list 2 6 l" [3; 4; 5; 6; 7] (sub_list 2 6 ll));
  Alcotest.(check (list int) "sub_list 0 7 l" ll (sub_list 0 7 ll));
  Alcotest.(check (list int) "sub_list 5 3 l" [] (sub_list 5 3 ll));
  Alcotest.(check (list int) "sub_list 3 8 l" [4; 5; 6; 7; 8] (sub_list 3 8 ll))
(* ---------------------------------------------------------------------- *)
let test_take_out_first () =
  let ll = [1; 2; 4; 3; 2; 5; 4; 7; 2] in
  Alcotest.(check (list int) "take_out_first single occurence"
              [1; 2; 4; 2; 5; 4; 7; 2] (take_out_first 3 ll));
  Alcotest.(check (list int) "take_out_first no occurence"
              [1; 2; 4; 3; 2; 5; 4; 7; 2] (take_out_first 0 ll));
  Alcotest.(check (list int) "take_out_first multiple occurence 1"
              [1; 4; 3; 2; 5; 4; 7; 2] (take_out_first 2 ll));
  Alcotest.(check (list int) "take_out_first multiple occurence 2"
              [1; 2; 3; 2; 5; 4; 7; 2] (take_out_first 4 ll))
(* ---------------------------------------------------------------------- *)
let test_sample_list () =
  let ll = [1; 2; 3; 4; 5; 6; 7; 8] in
  Alcotest.(check int "sample_list all elements"
              (List.length ll) (List.length (sample_list ll)));
  Alcotest.(check int "sample_list selected number of elements"
              5 (List.length (sample_list ~n:5 ll)))
(* ---------------------------------------------------------------------- *)
let test_filter_map () =
  let ll = [None; Some 1; None; Some 3; None; Some 5] in
  Alcotest.(check (list int) "filter_map"
              [1; 3; 5] (filter_map ll))


(* Test set *)
let test_set = [
  "test range", `Quick, test_range;
  "test split", `Quick, test_split;
  "test part", `Quick, test_part;
  "test sub_list", `Quick, test_sub_list;
  "test take_out_first", `Quick, test_take_out_first;
  "test sample_list", `Quick, test_sample_list;
  "test filter_map", `Quick, test_filter_map
]

