# UTOP Test

## Set up

open Camel_db 

open Type 

open Tokenizer 

open Controller 

open Rep

open Parser



let parent_db = Rep.create_empty_database "parent"

let single_col = ["cat"] 

let single_type : data_type list = [Int]



let cols = ["dog"; "cat"] 

let dts : data_type list = [Type.Int; Type.String]

# create stuff

let db = create parent_db "oneColTab" single_col single_type 

let db = create db "twoColTab" cols dts

# select stuff

let filter_all _ = true

let db = select db "twoColTab" cols filter_all

CREATE Persons (PersonID INT, LastName TEXT, FirstName TEXT, Address TEXT, City TEXT) ; CREATE Animals (Species TEXT, Age INT, Home TEXT) ; CREATE God (Sad INT, Fengyu TEXT) ;

SELECT PersonID, LastName, FirstName, Address, City FROM Persons ;

 INSERT INTO Customers (Name) VALUES ('Cardinal') ; DELETE FROM Sauce WHERE CustomerID = 1 ;

SELECT Species FROM Animals ;



let db = parse parent_db "CREATE Animals (Species TEXT, Age INT, Home TEXT) ;";;

let db = parse db "SELECT Species FROM Animals ;";;

select db "Animals" ["Species"] (fun _ -> true);;





- [ ] debug create: create 1 table, create 2 tables
- [ ] debug select: select one column, select multiple columns, select rows
- [ ] debug insert: insert 1 row