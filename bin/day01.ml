open Advent

let parse_line line =
  let first = try String.sub line 0 5 with Invalid_argument _ -> 
    print_string "invalid line first\n";
    print_string line;
    line in
  let second = try String.sub line 8 5 with Invalid_argument _ -> 
    print_string "invalid line second\n";
    print_string line;
    line in

  (int_of_string first, int_of_string second)

let () =
  let contents = Input.download "2024" "1" in
  
  let lines = contents
  |> String.split_on_char '\n'
  |> List.filter (fun x -> x <> String.empty)
  |> List.map parse_line in

  let list1 = List.map fst lines in
  let list2 = List.map snd lines in

  let sorted1 = List.sort compare list1 in
  let sorted2 = List.sort compare list2 in

  let answer = List.combine sorted1 sorted2
  |> List.map (fun a -> Int.abs (fst a - snd a))
  |> List.fold_left (+) 0 in

  print_int answer
;;
