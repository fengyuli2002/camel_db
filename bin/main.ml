open Camel_db

(** [main] prompts for the game to play, then starts it. *)
let main () =
  let _ =
    ANSITerminal.print_string [ ANSITerminal.green ]
      "\n\nStart using the database.\n";
    print_endline "Please enter commands below.\n";
    print_string "> ";
    let rec recursive_parse db =
      try
        let line = read_line () in
        print_endline "The tokenizer tokenizes this string as: \n";
        print_endline (Helper.pp_tokens (Tokenizer.tokenize line));
        let current_db = Parser.parse db line in
        print_string "\n> ";
        recursive_parse current_db
      with
      | Parser.Malformed m ->
          print_endline m;
          print_string "\n> ";
          recursive_parse db
      | Parser.Empty ->
          print_endline "The command cannot be empty. \n";
          print_string "\n> ";
          recursive_parse db
    in
    recursive_parse (Rep.create_empty_database "parent")
  in
  ()

(* Execute the game engine. *)
let () = main ()