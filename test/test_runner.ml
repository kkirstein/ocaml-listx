(* vim: set ft=ocaml sw=2 ts=2: *)

let () = Alcotest.run "listx" [
    "Listx", Test_listx.test_set
  ]

