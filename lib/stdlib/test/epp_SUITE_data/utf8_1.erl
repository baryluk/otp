%%
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 2011. All Rights Reserved.
%% 
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%% 
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%% 
%% %CopyrightEnd%
%%
-module(utf8_1).

-export([romanize_char/1]).
-export([strings_1/0]).

romanize_char(X) ->
	case X of
		SLetter when $a =< SLetter, SLetter =< $z ->
			SLetter;
		BLetter when $A =< BLetter, BLetter =< $Z ->
			BLetter - $A + $a;  % Change to lower letter
		Number when $0 =< Number, Number =< $9 ->
			Number;

		% Polish Unicode
		$ą -> $a;
		$ę -> $e;
		$ć -> $c;
		$ś -> $s;
		$ń -> $n;
		$ź -> $z;
		$ż -> $z;
		$ó -> $o;
		$ł -> $l;
		$Ą -> $a;
		$Ę -> $e;
		$Ć -> $c;
		$Ś -> $s;
		$Ń -> $n;
		$Ź -> $z;
		$Ż -> $z;
		$Ó -> $o;
		$Ł -> $l;

		% Other languages
		$ä -> $a;
		$Ä -> $a;
		$ö -> $o;
		$Ö -> $o;
		$ü -> $u;
		$Ü -> $u;
		$ë -> $e;
		$Ë -> $e;
		$ï -> $i;  % dosyć rzadki znak  (quite rare character)
		$æ -> [$a, $e];
		$Æ -> [$a, $e];

		$á -> $a;
		$č -> $c;
		%$ä -> $a;
		$ň -> $n;
		$š -> $s;
		$å -> $a;
		$ů -> $u;
		%$á -> $a;
		$é -> $e;
		$í -> $i;
		%$ó -> $o;
		$ú -> $u;
		$è -> $e;
		$ő -> $o;
		$ű -> $u;
		$ø -> $o;
		$ř -> $r;
		$ã -> $a;
		$ŕ -> $r;
		$ĺ -> $l;

		Other when is_integer(Other), 1 =< Other ->
			$-  % all other to '-' character
	end.

strings_1() ->
	[
	"ąęćśżźńół",
	"Ala ma kota",
	"Zażółć gęślą jaźń"
	].
