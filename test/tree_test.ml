open OUnit2
open Camel_db.Tree
open Camel_db.Type

(* Test of the Binray Search Tree *)

let alist = [ (3, 4); (1, 2); (5, 6); (9, 10); (7, 8) ]
let sorted = [ (1, 2); (3, 4); (5, 6); (7, 8); (9, 10) ]

let sample_tree =
  let rec generate_tree tree alist =
    match alist with
    | [] -> EmptyLeaf
    | h :: t -> insert h (generate_tree tree t)
  in
  generate_tree EmptyLeaf (List.rev alist)

let tree_tests =
  [
    ("inorder" >:: fun _ -> assert_equal sorted (inorder sample_tree));
    ("get1" >:: fun _ -> assert_equal 2 (get 1 sample_tree));
    ("get2" >:: fun _ -> assert_equal 8 (get 7 sample_tree));
    ( "get3" >:: fun _ ->
      assert_raises NotFound (fun () -> get 15 sample_tree) );
    ( "duplicate" >:: fun _ ->
      assert_raises Duplicate (fun () -> insert (5, 9) sample_tree) );
    ( "delete" >:: fun _ ->
      assert_raises NotFound (fun () -> get 1 (delete 1 sample_tree)) );
    ("size1" >:: fun _ -> assert_equal 5 (size sample_tree));
    ("size2" >:: fun _ -> assert_equal 0 (size empty));
    ( "fold" >:: fun _ ->
      assert_equal 60
        (fold (fun l x r -> l + r + (x * 2)) 0 sample_tree) );
  ]

let suite =
  "test suite for the binary search tree"
  >::: List.flatten [ tree_tests ]

let _ = run_test_tt_main suite
