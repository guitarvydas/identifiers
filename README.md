# Identifiers (names) that allow spaces.

run: make

This is a macro processor that looks only at classic ids and ids delimited by ❲ and ❳ brackets and leaves everything else alone.

The following test:
```
void ❲hello world❳ (int ❲abc❲def ghi jkl❳mno❳) {
  int x = ❲abc❲def ghi jkl❳mno❳;
  printf ("%d\n", ❲abc❲def ghi jkl❳mno❳);
}
```
is transpiled into
```
void _hello_world (int _abc__def_ghi_jkl__mno) {
  int x = _abc__def_ghi_jkl__mno;
  printf ("%d\n", _abc__def_ghi_jkl__mno);
}
```

The source file, test.txt, contains some ids containing spaces.  IDs can nest, so IDs can contain other bracketed IDs.

The parser - built using Ohm-JS - parses the code, and the FAB - fabricator - tool converts the IDs into IDs without spaces, replacing spaces with "_".

You should be able to write code in any supported language that contains compound IDs and macro-process the code into a form that is acceptable to the compiler for that language.

A Makefile would contain a pipeline - (1) pre-process the source, then (2) compile the preprocessed result - instead of a single invocation of the compiler.

I would imagine that this tool would be cloned (instead of being parameterized) once for every target language, like JavaScript and Python and C and ...  

