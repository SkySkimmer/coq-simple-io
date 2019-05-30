(** * Byte sequence operations *)

(** Note: description of the interfaces are derived from OCaml's documentation:
    https://github.com/ocaml/ocaml/blob/trunk/stdlib/bytes.mli *)

(* begin hide *)
From Coq Require Import
     ExtrOcamlIntConv.
From SimpleIO Require Import
     IO_Monad
     IO_Pervasives.
(* end hide *)

Module OBytes.

(** Return the length (number of bytes) of the argument. *)
Parameter length : bytes -> int.

(** [get s n] returns the byte at index [n] in [s]. *)
Parameter get : bytes -> int -> IO char.

(** [set s n c] modifies [s], replacing the byte at index [n] with [c]. *)
Parameter set : bytes -> int -> char -> IO unit.

(** [create n] returns a new byte sequence of length [n]. The sequence is
    uninitialized and contains arbitrary bytes.

    Raise [Invalid_argument] if [n < 0] or [n > ] system's maximum length of
    byte sequences. *)
Parameter create : int -> IO bytes.

(** Return a new byte sequence that contains the same bytes as the given
    string. *)
Parameter of_string : ocaml_string -> IO bytes.

(** Return a new string that contains the same bytes as the given byte
    sequence. *)
Parameter to_string : bytes -> IO ocaml_string.

(* begin hide *)
Extract Constant length => "Bytes.length".
Extract Constant get => "fun s n k -> k (Bytes.get s n)".
Extract Constant set => "fun s n c k -> k (Bytes.set s n)".
Extract Constant create => "fun n k -> k (Bytes.create n)".
Extract Constant of_string => "fun s k -> k (Bytes.of_string s)".
Extract Constant to_string => "fun b k -> k (Bytes.to_string b)".
(* end hide *)

End OBytes.
