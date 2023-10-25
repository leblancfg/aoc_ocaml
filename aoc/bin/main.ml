module Day1 = Day_1
(* ... *)
let () =
  let days = [Day_1.main; (* ... *)] in
  List.iter (fun f -> f ()) days
