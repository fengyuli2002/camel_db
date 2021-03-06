# Install Instructions

Please follow [this guide](https://cs3110.github.io/textbook/chapters/preface/install.html) to install OCaml and setup OPAM.

After that, install required dependencies by `opam install <package>`.

### Dependencies:

1.   `ANSITerminal`
2.   `csv`
3.   `csvtool`

### Run the REPL

Our program provides an REPL interface for the user to interact with. Run `make start` at project root directory to launch it.

### SQL Grammar

Currently, we haven't developed a help page yet. If you're not familiar with SQL grammar, please check the grammar.md file in the same directory as this file. Our program is built primarily upon the grammar defined in that file. If you're not familiar with context-free grammar, you can study [this tutorial](https://www.cs.cornell.edu/courses/cs2112/2021fa/lectures/lecture.html?id=parsing).


#### Customized Grammar:
The condition expression following WHERE phase can only use AND, OR to connect expression. All condition expression can be represented via AND and OR. NOT and parentheses is not supported. For example, a valid condition can be "Country" = "Mexico" AND "Population" > 1000 OR "LandSize" > 10000, an invalid condition can be NOT "Country" = "Mexico".

Especially note that all symbols should be separated with spaces, including the ";" at the end. Here is an example for inspiration: 

" CREATE Persons (PersonID INT, LastName TEXT, FirstName TEXT, Address TEXT, City TEXT) ; "

### Count Lines of Code
Run the count.sh to count the lines of code using `cloc`, this is a required dependency just for this file.

