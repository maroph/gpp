<#mode preservelf|off><#mode comment|"%%%" "\n">%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% GPP 2.0 documentation source file (c) Denis Auroux 1999 %%%%
%%%%                                                         %%%%
%%%% to get the man page, run:                               %%%%
%%%%    gpp -H -Dman gpphelp.pp -o gpp.1                     %%%%
%%%% to get the html page, run:                              %%%%
%%%%    gpp -H -Dhtml gpphelp.pp -o gpp.html                 %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%
<#mode user|"$" "$" "{" "}{" "}$" "{" "}" "@@@" "~">%%%
<#mode meta|"\n$" "$\w\n" "{" "}{" "}$\w\n" "{" "}">%%%
%%%%
%%%%%%%%%%% HTML page macro definitions %%%%%%%%%%%
$ifdef{html}$
$define{P}{<P>}$
$define{p}{<P>}$
$define{I}{<I>@@@1</I>}$
$define{S}{<P><HR><H2>@@@1</H2>}$
$define{B}{<B>@@@1</B>}$
$define{l}{&lt;}$
$define{g}{&gt;}$
$define{d}{-}$
$define{b}{\}$
$define{pre}{<PRE>@@@1</PRE>}$
$define{list}{<UL>@@@1</UL>}$
$define{li}{<P><LI>}$
$define{BI}{<B>@@@1</B>@@@2<BR>}$
$define{bi}{<B>@@@1:</B>}$
$define{s}{"@@@1"}$
$else$
%%%%%%%%%%% man page macro definitions %%%%%%%%%%%%
$ifdef{man}$
$define{P}{
.P}$
$define{p}{}$
$define{I}{\fI@@@1\fP}$
$define{S}{
.SH @@@1}$
$define{B}{.B @@@1}$
$define{l}{<}$
$define{g}{>}$
$define{d}{\-}$
$define{b}{\\}$
$define{pre}{
@@@1}$
$define{list}{@@@1}$
$define{li}{.TP}$
$define{BI}{.BI "@@@1" "@@@2"}$
$define{bi}{.BI "@@@1" ""}$
$define{s}{""@@@1""}$
$else$
Unknown target, you must specify -Dhtml or -Dman
$mode{comment}{"!!!" "!!!"}$
!!!
$endif$
$endif$
%%%%%%%%%%%%%%%%% some headers %%%%%%%%%%%%%%%%%%%
$define{version}{2.0}$
$define{SYNTAX}{
$pre{
  gpp [$d$o $I{outfile}$] [$d$I$I{/include/path}$] [$d$D$I{name=val}$ ...]
      [$d$z|+z] [$d$x] [$d$m] [$d$n] [$d$C|$d$T|$d$H|$d$P|$d$U ... [$d$M ...]] 
      [+c$I{$l$n$g$}$ $I{str1}$ $I{str2}$] [$d$c $I{str1}$]
      [+s$I{$l$n$g$}$ $I{str1}$ $I{str2}$ $I{c}$] [$I{infile}$]}$
}$
$ifdef{html}$
<HTML><HEAD><TITLE>GPP - Generic Preprocessor</TITLE>
</HEAD><BODY BGCOLOR="#FFFFFF">
<CENTER><H1>GPP - Generic Preprocessor</H1>
Version $version$ - (c) Denis Auroux 1996-99</CENTER>
<P><B>
<A HREF="http://www.math.polytechnique.fr/cmat/auroux/prog/gpp.tar.gz">Download gpp now !</A></B>
$else$
.TH GPP 1 \" -*- nroff -*-

.SH NAME
GPP \- Generic Preprocessor \- version $version$ (c) Denis Auroux 1996-99

.SH SYNOPSIS
$SYNTAX$%%%
$endif$
%%%%%%%%%%%%%% description section %%%%%%%%%%%%%%%%%%%%
$S{DESCRIPTION}$
$P$
$I{gpp}$ is a general-purpose preprocessor with customizable syntax,
suitable for a wide range of preprocessing tasks. Its independence on 
any programming language makes it much more versatile than $I{cpp}$,
while its syntax is lighter and more flexible than that of $I{m4}$.
$P$
$I{gpp}$ is targeted at all common preprocessing tasks where $I{cpp}$ is not
suitable and where no very sophisticated features are needed. In order to be
able to process equally efficiently text files or source code in a variety
of languages, the syntax used by $I{gpp}$ is fully customizable. The
handling of comments and strings is especially advanced.
$P$
Initially, gpp only understands a minimal set of built-in macros, called
$I{meta-macros}$. These meta-macros allow the definition of $I{user macros}$
as well as some basic operations forming the core of the preprocessing
system, including conditional tests, arithmetic evaluation, and syntax
specification. All user macro definitions are global, i.e. they remain
valid until explicitly removed; meta-macros cannot be redefined. With
each user macro definition gpp keeps track of the corresponding syntax 
specification so that a macro can be safely invoked regardless of any
subsequent change in operating mode.
$P$
In addition to macros, gpp understands comments and strings, whose syntax
and behavior can be widely customized to fit any particular purpose.
Internally comments and strings are the same construction, so everything
that applies to comments applies to strings as well.
$ifdef{html}$
$S{SYNTAX}$
$SYNTAX$
$endif$
%%%%%%%%%%%%%%%% command-line options %%%%%%%%%%%%%%%%%%%%
$S{OPTIONS}$
$P$
$I{gpp}$ recognizes the following command-line switches and options:
$list{$li$
$BI{$d$h}$
Print a short help message.
$li$
$BI{$d$o }{outfile}$
Specify a file to which all output should be sent (by default, everything
is sent to standard output).
$li$
$BI{$d$I}{/include/path}$
Specify a path where the $I{#include}$ meta-macro will look for include
files if they are not present in the current directory. The default is   
/usr/include if no $d$I option is specified. Multiple $d$I options may be
specified to look in several directories.
$li$
$BI{$d$D}{name=val}$
Define the user macro $I{name}$ as equal to $I{val}$. This is strictly
equivalent to using the $I{#define}$ meta-macro, but makes it possible
to define macros from the command-line. If $I{val}$ makes references to
arguments or other macros, it should conform to the syntax of the mode
specified on the command-line. Note that macro argument naming is not
allowed on the command-line.
$li$
$BI{+z}$
Set text mode to Unix mode (LF terminator). Any CR character in the
input is systematically discarded. This is the default under Unix systems.
$li$
$BI{$d$z}$
Set text mode to DOS mode (CR-LF terminator). In this mode all CR characters
are removed from the input, and all output LF characters are converted to
CR-LF. This is the default if gpp is compiled with the WIN_NT option. 
$li$
$BI{$d$x}$
Enable the use of the $I{#exec}$ meta-macro. Since $I{#exec}$ includes
the output of an arbitrary shell command line, it may cause a potential
security threat, and is thus disabled unless this option is specified.
$li$
$BI{$d$m}$
Enable automatic mode switching to the cpp compatibility mode if the name
of an included file ends in '.h' or '.c'. This makes it possible to
include C header files with only minor modifications.
$li$
$BI{$d$n}$
Prevent newline or whitespace characters from being removed from the input
when they occur as the end of a macro call or of a comment. By default, 
when a newline or whitespace character forms the end of a macro or a comment 
it is parsed as part of the macro call or comment and therefore removed from 
output. Use the $d$n option to keep the last character in the input stream
if it was whitespace or a newline.
$li$
$BI{$d$U }{arg1 ... arg9}$
User-defined mode. The nine following command-line arguments are taken to
be respectively the macro start sequence, the macro end sequence for a call
without arguments, the argument start sequence, the argument separator,
the argument end sequence, the list of characters to stack for argument
balancing, the list of characters to unstack, the string to be used for
referring to an argument by number, and finally the quote character (if
there is none an empty string should be provided).
These settings apply both to user macros and to meta-macros, unless the -M
option is used to define other settings for meta-macros. See the section
on syntax specification for more details.
$li$
$BI{$d$M }{arg1 ... arg7}$
User-defined mode specifications for meta-macros. This option can only be
used together with $d$M. The seven following command-line arguments are    
taken to be respectively the macro start sequence, the macro end sequence
for a call without arguments, the argument start sequence, the argument  
separator, the argument end sequence, the list of characters to stack for
argument balancing, and the list of characters to unstack. See below for
more details.
$li$
$BI{(default mode)}$
The default mode is a vaguely cpp-like mode, but it does not handle
comments, and presents various incompatibilities with $I{cpp}$.
Typical meta-macros and user macros look like this: $pre{
  #define x y
  macro(arg,...)
}$
This mode is equivalent to $pre{
  -U "" "" "(" "," ")" "(" ")" "#" "$b$$b$"
  -M "#" "$b$n" " " " " "$b$n" "(" ")"
}$
$li$
$BI{$d$C}$
$I{cpp}$ compatibility mode. This is the mode where gpp's behavior is the
closest to that of cpp. Unlike in the default mode, meta-macro expansion
occurs only at the beginning of lines, and C comments and strings are
understood. This mode is equivalent to $pre{
  -n -U "" "" "(" "," ")" "(" ")" "#" ""
  -M "$b$n#$b$w" "$b$n" " " " " "$b$n" "" ""
  +c "/*" "*/" +c "//" "$b$n" +c "$b$$b$$b$n" ""
  +s "$b$"" "$b$"" "$b$$b$" +s "'" "'" "$b$$b$"
}$
$li$
$BI{$d$T}$
TeX-like mode. In this mode, typical meta-macros and user macros look like
this: $pre{
  $b$define{x}{y}
  $b$macro{arg}{...}
}$
No comments are understood. This mode is equivalent to $pre{
  -U "$b$$b$" "" "{" "}{" "}" "{" "}" "#" "@"
}$
$li$
$BI{$d$H}$
HTML-like mode. In this mode, typical meta-macros and user macros look like
this: $pre{
  $l$#define x|y$g$
  $l$#macro arg|...$g$
}$
No comments are understood. This mode is equivalent to $pre{
  -U "$l$#" "$g$" "$b$B" "|" "$g$" "$l$" "$g$" "#" "$b$$b$"
}$
$li$
$BI{$d$P}$
Prolog-compatible cpp-like mode. This mode differs from the cpp
compatibility mode by its handling of comments, and is equivalent to $pre{
  -n -U "" "" "(" "," ")" "(" ")" "#" ""
  -M "$b$n#$b$w" "$b$n" " " " " "$b$n" "" ""
  +ccss "$b$!o/*" "*/" +ccss "%" "$b$n" +ccii "$b$$b$$b$n" ""
  +s "$b$"" "$b$"" "" +s "$b$!#'" "'" ""
}$
$li$
$BI{+c}{$l$n$g$ str1 str2}$
Specify comments. Any unquoted occurrence of $I{str1}$ will be
interpreted as the beginning of a comment. All input up to the first 
following occurrence of $I{str2}$ will be discarded. This 
option may be used multiple times to specify different types of comment 
delimiters. The optional parameter $I{$l$n$g$}$ can be specified to
alter the behavior of the comment and e.g. turn it into a string or make it
ignored under certain circumstances, see below.
$li$
$BI{$d$c }{str1}$
Un-specify comments or strings. The comment/string specification whose 
start sequence is $I{str1}$ is removed. This is useful to alter the 
built-in comment specifications of a standard mode, e.g. the cpp 
compatibility mode.
$li$
$BI{+s}{$l$n$g$ str1 str2 c}$
Specify strings. Any unquoted occurrence of $I{str1}$ will be
interpreted as the beginning of a string. All input up to the first 
following occurrence of $I{str2}$ will be output as is without any
evaluation. The delimiters themselves are output. If $I{c}$ is non-empty,
its first character is used as a $I{string-quote character}$, i.e. a
character whose presence immediately before an occurrence of $I{str2}$
prevents it from terminating the string.  
The optional parameter $I{$l$n$g$}$ can be specified to
alter the behavior of the string and e.g. turn it into a comment, enable
macro evaluation inside the string, or make the string specification 
ignored under certain circumstances, see below.
$li$
$BI{$d$s }{str1}$
Un-specify comments or strings. Identical to $d$c.
$li$
$BI{infile}$
Specify an input file from which gpp reads its input. If no input
file is specified, input is read from standard input.
}$
%%%%%%%%%%%%%%%%% syntax specification %%%%%%%%%%%%%%%%%%%
$S{SYNTAX SPECIFICATION}$
$P$
The syntax of a macro call is the following : it must start with a
sequence of characters matching the $I{macro start sequence}$ as specified
in the current mode, followed immediately by the name of the macro, which
must be a valid $I{identifier}$, i.e. a sequence of letters, digits, or
underscores ("_"). The macro name must be followed by a $I{short macro end
sequence}$ if the macro has no arguments, or by a sequence of arguments
initiated by an $I{argument start sequence}$. The various arguments are
then separated by an $I{argument separator}$, and the macro ends with
a $I{long macro end sequence}$.
$P$
In all cases, the parameters of the current context, i.e. the arguments
passed to the body being evaluated, can be referred to by using an
$I{argument reference sequence}$ followed by a digit between 1 and 9.
Macro parameters may alternately be named (see below). Furthermore, to
avoid interference between the gpp syntax and the contents of the input file
a $I{quote character}$ is provided. The quote character can be used to
prevent the interpretation of a macro call, comment, or string as anything
but plain text. The quote character "protects" the following character, and
always gets removed during evaluation. Two consecutive quote characters
evaluate as a single quote character.
$P$
Finally, to facilitate proper argument delimitation, certain characters can
be "stacked" when they occur in a macro argument, so that the argument
separator or macro end sequence are not parsed if the argument body is not
balanced. This allows nesting macro calls without using quotes. If an
improperly balanced argument is needed, quote characters should be added in
front of some stacked characters to make it balanced.
$P$
The macro construction sequences described above can be different for
meta-macros and for user macros: this is e.g. the case in cpp mode.
Note that, since meta-macros can only have up to two arguments, the
delimitation rules for the second argument are somewhat sloppier, and
unquoted argument separator sequences are allowed in the second argument
of a meta-macro.
$P$
Unless one of the standard operating modes is selected, the above syntax
sequences can be specified either on the command-line, using the $d$M and
$d$U options respectively for meta-macros and user macros, or inside an
input file via the $I{#mode meta}$ and $I{#mode user}$ meta-macro calls.
In both cases the mode description consists of 9 parameters for user macro
specifications, namely the macro start sequence, the short macro end
sequence, the argument start sequence, the argument separator, the long
macro end sequence, the string listing characters to stack, the string
listing characters to unstack, the argument reference sequence, and finally
the quote character. As explained below these sequences should be supplied
using the syntax of C strings; they must start with a non-alphanumeric 
character, and in the first five strings special matching sequences can
be used (see below). If the argument corresponding to the quote character
is the empty string that functionality is disabled. For meta-macro
specifications there are only 7 parameters, as the argument reference
sequence and quote character are shared with the user macro syntax.
$P$
The structure of a comment/string is the following : it must start with a
sequence of characters matching the given $I{comment/string start sequence}$, 
and always ends at the first occurrence of the $I{comment/string end
sequence}$, unless it is preceded by an odd number of occurrences of the
$I{string-quote character}$ (if such a character has been specified).
In certain cases comment/strings can be specified to enable macro evaluation
inside the comment/string: in that case, if a quote character has been
defined for macros it can be used as well to prevent the comment/string from
ending, with the difference that the macro quote character is always removed
from output whereas the string-quote character is always output. Also note
that under certain circumstances a comment/string specification can be
$I{disabled}$, in which case the comment/string start sequence is simply
ignored. Finally, it is possible to specify a $I{string warning character}$
whose presence inside a comment/string will cause gpp to output a warning
(this is useful e.g. to locate unterminated strings in cpp mode).
Note that input files are not allowed to contain unterminated comments/strings.
$P$
A comment/string specification can be declared from within the input
file using the $I{#mode comment}$ meta-macro call (or equivalently
$I{#mode string}$), in which case the number of C strings to be given as
arguments to describe the comment/string can be anywhere between 2 and 4:
the first two arguments (mandatory) are the start sequence and the end
sequence, and can make use of the special matching sequences (see below). 
They may not start with alphanumeric characters. The first
character of the third argument, if there is one, is used as string-quote 
character (use an empty string to disable the functionality), and the 
first character of the fourth argument, if there is one, is used as
string-warning character. A specification may also be given from the
command-line, in which case there must be two arguments if using the
+c option and three if using the +s option.
$P$
The behavior of a comment/string is specified by a three-character
modifier string, which may be passed as an optional argument either 
to the +c/+s command-line options or to the $I{#mode comment}$/$I{#mode 
string}$ meta-macros. If no modifier string is specified, the default
value is "ccc" for comments and "sss" for strings. The first character
corresponds to the behavior inside meta-macro calls (including user-macro
definitions since these come inside a $I{#define}$ meta-macro call),
the second character corresponds to the behavior inside user-macro
parameters, and the third character corresponds to the behavior outside
of any macro call. Each of these characters can take the following 
values: 
$list{
$li$
$bi{i}$
disable the comment/string specification.
$li$ 
$bi{c}$
comment (neither evaluated nor output).
$li$ 
$bi{s}$
string (the string and its delimiter sequences are output as is).
$li$
$bi{q}$
quoted string (the string is output as is, without the delimiter sequences).
$li$
$bi{C}$
evaluated comment (macros are evaluated, but output is discarded).
$li$
$bi{S}$
evaluated string (macros are evaluated, delimiters are output).
$li$
$bi{Q}$
evaluated quoted string (macros are evaluated, delimiters are not output).}$
$P$
Important note: any occurrence of a comment/string start sequence inside
another comment/string is always ignored, even if macro evaluation is
enabled. In other words, comments/strings cannot be nested. In particular, 
the 'Q' modifier can be a convenient way of defining a syntax for 
temporarily disabling all comment and string specifications.
$P$
Syntax specification strings should always be provided as C strings, 
whether they are given as arguments to a $I{#mode}$ meta-macro call or
on the command-line of a Unix shell. If command-line arguments are given
via another method than a standard Unix shell, then the shell behavior
must be emulated, i.e. the surrounding "" quotes should be removed,
all occurrences of '$b$$b$' should be replaced by a single backslash,
and similarly '$b$"' should be replaced by '"'.
Sequences like '$b$n' are recognized by gpp and should be left as is.
$P$
Special sequences matching certain subsets of the character set can be
used. They are of the form '$b$$I{x}$', where $I{x}$ is one of:
$list{
$li$
$bi{b}$
matches any sequence of one or more spaces or TAB characters ('$b$b' is 
identical to ' ').
$li$
$bi{w}$
matches any sequence of zero or more spaces or TAB characters.
$li$
$bi{B}$
matches any sequence of one or more spaces, tabs or newline characters.
$li$
$bi{W}$
matches any sequence of zero or more spaces, tabs or newline characters.
$li$
$bi{a}$
an alphabetic character ('a' to 'z' and 'A' to 'Z').
$li$
$bi{A}$
an alphabetic character, or a space, tab or newline.
$li$
$bi{#}$
a digit ('0' to '9').
$li$
$bi{i}$
an identifier character. The set of matched characters is customizable
using the $I{#mode charset id}$ command. The default setting matches
alphanumeric characters and underscores ('a' to 'z', 'A' to 'Z', '0' to '9'
and '_').
$li$
$bi{t}$
a TAB character.
$li$
$bi{n}$
a newline character.
$li$
$bi{o}$
an operator character. The set of matched characters is customizable
using the $I{#mode charset op}$ command. The default setting matches
all characters in "+-*/$b$^$l$$g$=`~~:.?@#&!%|", except in Prolog mode
where '!', '%' and '|' are not matched.
$li$
$bi{O}$
an operator character or a parenthesis character. The set of additional
matched characters in comparison with '$b$o' is customizable using the
$I{#mode charset par}$ command. The default setting is to have the
characters in "()[]{}" as parentheses.}$
$P$
Moreover, all of these matching subsets except '$b$w' and '$b$W' can be 
negated by inserting a '!', i.e. by writing '$b$!$I{x}$' instead of '$b$$I{x}$'.
$P$
Note an important distinctive feature of $I{start sequences}$: when the
first character of a macro or comment/string start sequence is ' ' or one 
of the above special sequences, it is not taken to be part of the sequence 
itself but is used instead as a context check: for example a start sequence 
beginning with '$b$n' matches only at the beginning of a line, but the 
matching newline character is not taken to be part of the sequence. 
Similarly a start sequence beginning with ' ' matches only if some
whitespace is present, but the matching whitespace is not considered to
be part of the start sequence and is therefore sent to output. If a context
check is performed at the very beginning of a file (or more generally of
any body to be evaluated), the result is the same as matching with a newline 
character (this makes it possible for a cpp-mode file to start with a
meta-macro call).
%%%%%%%%%%%%%%%%%% evaluation rules %%%%%%%%%%%%%%%%%%%%
$S{EVALUATION RULES}$
$P$
Input is read sequentially and interpreted according to the rules of the
current mode. All input text is first matched against the specified
comment/string start sequences of the current mode (except those which
are disabled by the 'i' modifier), unless the body being evaluated is
the contents of a comment/string whose modifier enables macro evaluation. 
The most recently defined comment/string specifications are checked for 
first. Important note: comments may not appear between the name of a macro
and its arguments (doing so results in undefined behavior).
$P$
Anything that is not a comment/string is then matched against a possible
meta-macro call, and if that fails too, against a possible user-macro
call. All remaining text undergoes substitution of argument reference
sequences by the relevant argument text (empty unless the body being
evaluated is the definition of a user macro) and removal of the quote 
character if there is one.
$P$
Note that meta-macro arguments are passed to the meta-macro prior to
any evaluation (although the meta-macro may choose to evaluate them,
see meta-macro descriptions below). In the case of the $I{#mode}$
meta-macro, gpp temporarily adds a comment/string specification to
enable recognition of C strings ("...") and prevent any evaluation
inside them, so no interference of the characters being put in the C
string arguments to $I{#mode}$ with the current syntax is to be feared.
$P$
On the other hand, the arguments to a user macro are systematically
evaluated, and then passed as context parameters to the macro definition 
body, which gets evaluated with that environment. The only exception is
when the macro definition is empty, in which case its arguments are not
evaluated. Note that gpp temporarily switches back to the mode in which
the macro was defined in order to evaluate it: so it is perfectly safe
to change the operating mode between the time when a macro is defined
and the time when it is called. Conversely, if a user macro wishes to
work with the current mode instead of the one that was used to define it
it needs to start with a $I{#mode restore}$ call and end with a 
$I{#mode save}$ call.
$P$
A user macro may be defined with named arguments (see $I{#define}$
description below). In that case, when the macro definition is being
evaluated, each named parameter causes a temporary virtual user-macro
definition to be created; such a macro may only be called without arguments
and simply returns the text of the corresponding argument.
$P$
Note that, since macros are evaluated when they are called rather than
when they are defined, any attempt to call a recursive macro causes
undefined behavior except in the very specific case when the macro
uses $I{#undef}$ to erase itself after finitely many loop iterations.
$P$
Finally, a special case occurs when a user macro whose definition does not
involve any arguments (neither named arguments nor the argument reference
sequence) is called in a mode where the short user-macro end sequence is
empty (e.g. cpp or TeX mode). In that case it is assumed to be an 
$I{alias macro}$: its arguments are first evaluated in the current mode
as usual, but instead of being passed to the macro definition as parameters
(which would cause them to be discarded) they are actually appended to the
macro definition, using the syntax rules of the mode in which the macro was
defined, and the resulting text is evaluated again. It is therefore
important to note that, in the case of a macro alias, the arguments
actually get evaluated twice in two potentially different modes.
%%%
%%%%%%%%%%%%%%%%%%%%% meta-macro descriptions %%%%%%%%%%%%%%%%%%%%%%
$S{META-MACROS}$
$P$
These macros are always pre-defined. Their actual calling sequence depends
on the current mode; here we use cpp-like notation.
$list{
$li$
$BI{#define }{x y}$
This defines the user macro $I{x}$ as $I{y}$. $I{y}$ can be any valid
gpp input, and may for example refer to other macros. $I{x}$ must
be an identifier (i.e. a sequence of alphanumeric characters and '_'),
unless named arguments are specified. If $I{x}$ is already defined, 
the previous definition is overwritten. If no second argument is given, 
$I{x}$ will be defined as a macro that outputs nothing. Neither $I{x}$ 
nor $I{y}$ are evaluated; the macro definition is only evaluated when 
it is called, not when it is declared.
$p$
It is also possible to name the arguments in a macro definition: in
that case, the argument $I{x}$ should be a user-macro call whose arguments
are all identifiers. These identifiers become available as user-macros
inside the macro definition; these virtual macros must be called without
arguments, and evaluate to the corresponding macro parameter.
$li$
$BI{#defeval }{x y}$
This acts in a similar way to $I{#define}$, but the second argument $I{y}$
is evaluated immediately. Since user macro definitions are also evaluated
each time they are called, this means that the macro $I{y}$ will undergo
$I{two}$ successive evaluations. The usefulness of $I{#defeval}$ is   
considerable, as it is the only way to evaluate something more than once,
which can be needed e.g. to force evaluation of the arguments of a 
meta-macro that normally doesn't perform any evaluation. However since all 
argument references evaluated at define-time are understood as the arguments 
of the body in which the macro is being defined and not as the arguments of 
the macro itself, usually one has to use the quote character to prevent 
immediate evaluation of argument references.
$li$
$BI{#undef }{x}$
This removes any existing definition of the user macro $I{x}$.
$li$
$BI{#ifdef }{x}$
This begins a conditional block. Everything that follows is evaluated only
if the identifier $I{x}$ is defined, until either a $I{#else}$ or a
$I{#endif}$ statement is reached. Note however that the commented text is
still scanned thoroughly, so its syntax must be valid. It is in particular
legal to have the $I{#else}$ or $I{#endif}$ statement ending the conditional 
block appear as only the result of a user-macro expansion and not explicitly
in the input.
$li$
$BI{#ifndef }{x}$
This begins a conditional block. Everything that follows is evaluated only
if the identifier $I{x}$ is not defined.
$li$
$BI{#ifeq }{x y}$
This begins a conditional block. Everything that follows is evaluated
only if the results of the evaluations of $I{x}$ and $I{y}$ are identical
as character strings. Any leading or trailing whitespace is ignored for 
the comparison. Note that in cpp-mode any unquoted whitespace character
is understood as the end of the first argument, so it is necessary to be
careful.
$li$
$BI{#ifneq }{x y}$
This begins a conditional block. Everything that follows is evaluated only
if the results of the evaluations of $I{x}$ and $I{y}$ are not identical
(even up to leading or trailing whitespace).
$li$
$BI{#else}$
This toggles the logical value of the current conditional block. What
follows is evaluated if and only if the preceding input was commented out.
$li$
$BI{#endif}$
This ends a conditional block started by a $I{#if...}$ meta-macro.
$li$
$BI{#include }{file}$
This causes gpp to open the specified file and evaluate its contents,
inserting the resulting text in the current output. All defined user macros
are still available in the included file, and reciprocally all macros
defined in the included file will be available in everything that
follows. The include file is looked for first in the current directory,
and then, if not found, in one of the directories specified by the $I{$d$I}$
command-line option (or $I{/usr/include}$ if no directory was specified).
Note that, for compatibility reasons, it is possible to put the file name 
between "" or $l$$g$.
$p$
Upon including a file, gpp immediately saves a copy of the current operating
mode onto the mode stack, and restores the operating mode at the end of the
included file. The included file may override this behavior by starting with
a $I{#mode restore}$ call and ending with a $I{#mode push}$ call.
Additionally, when the $I{$d$m}$ command line option is specified, gpp will
automatically switch to the cpp compatibility mode upon including a file
whose name ends with either '.c' or '.h'.
$li$
$BI{#exec }{command}$
This causes gpp to execute the specified command line and include
its standard output in the current output. Note that this meta-macro is
disabled unless the $I{$d$x}$ command line flag was specified, for security
reasons. If use of $I{#exec}$ is not allowed, a warning message is printed
and the output is left blank. Note that the specified command line is
evaluated before being executed, thus allowing the use of macros in the
command-line. However, the output of the command is included verbatim and 
not evaluated. If you need the output to be evaluated, you must use 
$I{#defeval}$ (see above) to cause a double evaluation.
$li$
$BI{#eval }{expr}$
The $I{#eval}$ meta-macro attempts to evaluate $I{expr}$ first by expanding
macros (normal gpp evaluation) and then by performing arithmetic evaluation.
The syntax and operator precedence for arithmetic expressions are the same
as in C ; the only missing operators are $l$$l$, $g$$g$, ?: and assignment
operators. If unable to assign a numerical value to the result, the returned
text is simply the result of macro expansion without any arithmetic
evaluation. The only exceptions to this rule are the == and != operators
which, if one of the sides does not evaluate to a number, perform string
comparison instead (ignoring trailing and leading spaces).
$p$
Inside arithmetic expressions, the $I{defined(...)}$ special user macro
is also available: it takes only one argument, which is not evaluated, and
returns 1 if it is the name of a user macro and 0 otherwise.
$li$
$BI{#if }{expr}$
This meta-macro invokes the arithmetic evaluator in the same manner as
$I{#eval}$, and compares the result of evaluation with the string "0" in
order to begin a conditional block. In particular note that the logical
value of $I{expr}$ is always true when it cannot be evaluated to a number.
$li$
$BI{#mode }{keyword ...}$
This meta-macro controls gpp's operating mode. See below for a list of
$I{#mode}$ commands.
}$
$P$
The key to gpp's flexibility is the $I{#mode}$ meta-macro. Its first
argument is always one of a list of available keywords (see below); 
its second argument is always a sequence of words separated by whitespace.
Apart from possibly the first of them, each of these words is always a
delimiter or syntax specifier, and should be provided as a C string
delimited by double quotes (" "). The various special matching sequences 
listed in the section on syntax specification are available. Any $I{#mode}$
command is parsed in a mode where "..." is understood to be a C-style
string, so it is safe to put any character inside these strings.
Also note that the first argument of $I{#mode}$ (the keyword) is never
evaluated, while the second argument is evaluated (except of course for
the contents of C strings), so that the syntax specification may be obtained
as the result of a macro evaluation.
$P$
The available $I{#mode}$ commands are:
$list{
$li$
$BI{#mode save / #mode push}$
Push the current mode specification onto the mode stack.
$li$
$BI{#mode restore / #mode pop}$
Pop mode specification from the mode stack.
$li$
$BI{#mode standard }{name}$
Select one of the standard modes. The only argument must be one of:
default (default mode); cpp, C (cpp mode); tex, TeX (tex mode); html,
HTML (html mode); prolog, Prolog (prolog mode). The mode name must be
given directly, not as a C string.
$li$
$BI{#mode user }{$s{s1}$ ... $s{s9}$}$
Specify user macro syntax.
The 9 arguments, all of them C strings, are the mode specification for
user macros (see the $d$U command-line option and the section on syntax
specification). The meta-macro specification is not affected.
$li$
$BI{#mode meta }{~{user | $s{s1}$ ... $s{s7}$~}}$
Specify meta-macro syntax.
Either the only argument is $I{user}$ (not as a string), and the user-macro
mode specifications are copied into the meta-macro mode specifications,
or there must be 7 string arguments, whose significance is the same as
for the $d$M command-line option (see section on syntax specification).
$li$
$BI{#mode quote }{[$s{c}$]}$
With no argument or "" as argument, removes the quote character
specification and disables the quoting functionality. With one string
argument, the first character of the string is taken to be the new
quote character. The quote character cannot be alphanumeric nor '_',
and cannot be one of the special matching sequences either.
$li$
$BI{#mode comment }{[xxx] $s{start}$ $s{end}$ [$s{c}$ [$s{c}$]]}$
Add a comment specification. Optionally a first argument consisting of
three characters not enclosed in " " can be used to specify a comment/string
modifier (see the section on syntax specification). The default modifier
is $I{ccc}$. The first two string
arguments are used as comment start and end sequences respectively.
The third string argument is optional and can be used to specify a
string-quote character (if it is "" the functionality is disabled).
The fourth string argument is optional and can be used to specify a
string delimitation warning character (if it is "" the functionality is
disabled).
$li$
$BI{#mode string }{[xxx] $s{start}$ $s{end}$ [$s{c}$ [$s{c}$]]}$
Add a string specification. Identical to $I{#mode comment}$ except that
the default modifier is $I{sss}$.
$li$
$BI{#mode nocomment / #mode nostring }{[$s{start}$]}$
With no argument, remove all comment/string specifications. With one
string argument, delete the comment/string specification whose start
sequence is the argument.
$li$
$BI{#mode preservelf }{~{ on | off | 1 | 0 ~}}$
Equivalent to the $I{-n}$ command-line switch. If the argument is $I{on}$
or $I{1}$, any newline or whitespace character terminating a macro call or 
a comment/string is left in the input stream for further processing. If the
argument is $I{off}$ or $I{0}$ this feature is disabled.
$li$
$BI{#mode charset }{~{ id | op | par ~} $s{string}$}$
Specify the character sets to be used for matching the $b$o, $b$O and
$b$i special sequences. The first argument must be one of $I{id}$
(the set matched by $b$i), $I{op}$ (the set matched by $b$o) or $I{par}$
(the set matched by $b$O in addition to the one matched by $b$o).
$I{"string"}$ is a C string which lists all characters to put in the set.
It may contain only the special matching sequences $b$a, $b$A, $b$b, $b$B, 
and $b$# (the other sequences and the negated sequences are not allowed). 
When a '-' is found inbetween two non-special characters this adds all 
characters inbetween (e.g. "A-Z" corresponds to all uppercase characters). 
To have '-' in the matched set, either put it in first or last position
or place it next to a $b$x sequence.
}$
$S{EXAMPLES}$
Here is a basic self-explanatory example in standard or cpp mode:
$pre{
  #define FOO This is
  #define BAR a message.
  #define concat #1 #2
  concat(FOO,BAR)
  #ifeq (concat(foo,bar)) (foo bar)
  This is output.
  #else
  This is not output.
  #endif
}$
Using argument naming, the $I{concat}$ macro could alternately be defined
as
$pre{
  #define concat(x,y) x y
}$
In TeX mode and using argument naming, the same example becomes:
$pre{
  $b$define{FOO}{This is}
  $b$define{BAR}{a message.}
  $b$define{$b$concat{x}{y}}{$b$x $b$y}
  $b$concat{$b$FOO}{$b$BAR}
  $b$ifeq{$b$concat{foo}{bar}}{foo bar}
  This is output.
  $b$else
  This is not output.
  $b$endif
}$
In HTML mode and without argument naming, one gets similarly:
$pre{
  $l$#define FOO|This is$g$
  $l$#define BAR|a message.$g$
  $l$#define concat|#1 #2$g$
  $l$#concat $l$#FOO$g$|$l$#BAR$g$$g$
  $l$#ifeq $l$#concat foo|bar$g$|foo bar$g$
  This is output.
  $l$#else$g$
  This is not output.
  $l$#endif$g$
}$
The following example (in standard mode) illustrates the use of 
the quote character:
$pre{
  #define FOO This is $b$
     a multiline definition.
  #define BLAH(x) My argument is x
  BLAH(urf)
  $b$BLAH(urf)
}$
Note that the multiline definition is also valid in cpp and Prolog
modes despite the absence of quote character, because '$b$' followed
by a newline is then interpreted as a comment and discarded.
$P$
In cpp mode, C strings and comments are understood as such, as illustrated
by the following example:
$pre{
  #define BLAH foo
  BLAH "BLAH" /* BLAH */
  'It$b$'s a /*string*/ !'
}$
The main difference between Prolog mode and cpp mode is the handling of
strings and comments: in Prolog, a '...' string may not begin
immediately after a digit, and a /*...*/ comment may not begin immediately
after an operator character. Furthermore, comments are not removed from
the output unless they occur in a #command.
$P$
The differences between cpp mode and default mode are deeper: in default
mode #commands may start anywhere, while in cpp mode they must be at the
beginning of a line; the default mode has no knowledge of comments and
strings, but has a quote character ('$b$'), while cpp mode has extensive
comment/string specifications but no quote character. Moreover, the
arguments to meta-macros need to be correctly parenthesized in default
mode, while no such checking is performed in cpp mode.
$P$
This makes it easier to nest meta-macro calls in default mode than in
cpp mode. For example, consider the following HTML mode input, which 
tests for the availability of the $I{#exec}$ command:
$pre{
  $l$#ifeq $l$#exec echo blah$g$|blah
  $g$ #exec allowed $l$#else$g$ #exec not allowed $l$#endif$g$
}$
There is no cpp mode equivalent, while in default mode it can be easily 
translated as
$pre{
  #ifeq (#exec echo blah
  ) (blah
  )
  $b$#exec allowed
  #else
  $b$#exec not allowed
  #endif
}$
In order to nest meta-macro calls in cpp mode it is necessary to modify
the mode description, either by changing the meta-macro call syntax, or
more elegantly by defining a silent string and using the fact that the
context at the beginning of an evaluated string is a newline character:
$pre{
  #mode string QQQ "$" "$"
  #ifeq $#exec echo blah
  $ $blah
  $
  $b$#exec allowed
  #else
  $b$#exec not allowed
  #endif
}$
Note however that comments/strings cannot be nested ("..." inside
$...$ would go undetected), so one needs to be careful about what to 
include inside such a silent evaluated string.
$P$
Remember that macros without arguments are actually understood to be
aliases when they are called with arguments, as illustrated by the
following example (default or cpp mode):
$pre{
  #define DUP(x) x x
  #define FOO and I said: DUP
  FOO(blah)
}$
The usefulness of the $I{#defeval}$ meta-macro is shown by the following
example in HTML mode:
$pre{
  $l$#define APPLY|$l$#defeval TEMP|$l$$b$##1 $b$#1$g$$g$$l$#TEMP #2$g$$g$
  $l$#define $l$#foo x$g$|$l$#x$g$ and $l$#x$g$$g$
  $l$#APPLY foo|BLAH$g$
}$
The reason why $I{#defeval}$ is needed is that, since everything is
evaluated in a single pass, the input that will result in the desired macro
call needs to be generated by a first evaluation of the arguments passed to
APPLY before being evaluated a second time.
$P$
To translate this example in default mode, one needs to resort to
parenthesizing in order to nest the #defeval call inside the definition
of APPLY, but need to do so without outputting the parentheses. The
easiest solution is
$pre{
  #define BALANCE(x) x
  #define APPLY(f,v) BALANCE(#defeval TEMP f
  TEMP(v))
  #define foo(x) x and x
  APPLY($b$foo,BLAH)
}$
As explained above the simplest version in cpp mode relies on defining
a silent evaluated string to play the role of the BALANCE macro.
$P$
The following example (default or cpp mode) demonstrates arithmetic 
evaluation:
$pre{
  #define x 4
  The answer is:
  #eval x*x + 2*(16-x) + 1998%x

  #if defined(x)&&!(3*x+5$g$17)
  This should be output.
  #endif
}$
To finish, here are some examples involving mode switching. 
The following example is self-explanatory (starting in default mode):
$pre{
  #mode push
  #define f(x) x x
  #mode standard TeX
  $b$f{blah}
  $b$mode{string}{"$" "$"}
  $b$mode{comment}{"/*" "*/"}
  ~$$b$f{urf}~$ /* blah */
  $b$define{FOO}{bar/* and some more */}
  $b$mode{pop}
  f(~$FOO~$)
}$
A good example where a user-defined mode becomes useful is the gpp 
source of this document (available with gpp's source code distribution).
$P$
Another interesting application is selectively forcing evaluation of macros 
in C strings when in cpp mode. For example, consider the following input:
$pre{
  #define blah(x) "and he said: x"
  blah(foo)
}$
Obviously one would want the parameter $I{x}$ to be expanded inside the
string. There are several ways around this problem:
$pre{
  #mode push
  #mode nostring "$b$""
  #define blah(x) "and he said: x"
  #mode pop

  #mode quote "`"
  #define blah(x) `"and he said: x`"

  #mode string QQQ "$$" "$$"
  #define blah(x) $$"and he said: x"$$
}$
The first method is very natural, but has the inconvenient of being lengthy
and neutralizing string semantics, so that having an unevaluated instance
of 'x' in the string, or an occurrence of '/*', would be impossible without
resorting to further contorsions. $P$
The second method is slightly more efficient, because the local presence of a
quote character makes it easier to control what is evaluated and what isn't,
but has the drawback that it is sometimes impossible to find a reasonable
quote character without having to either significantly alter the source file
or enclose it inside a $I{#mode push/pop}$ construct. For example any
occurrence of '/*' in the string would have to be quoted.$P$
The last method demonstrates the efficiency of evaluated strings in the
context of selective evaluation: since comments/strings cannot be nested,
any occurrence of '"' or '/*' inside the '$$' gets output as plain text,
as expected inside a string, and only macro evaluation is enabled. Also note
that there is much more freedom in the choice of a string delimiter than
in the choice of a quote character.
%%%
%%%%%%%%%%%%%%%%%%%%%% advanced examples %%%%%%%%%%%%%%%%%%%%%%%%%%%%
$S{ADVANCED EXAMPLES}$
$P$
Here are some examples of advanced constructions using gpp. They tend to
be pretty awkward and should be considered as evidence of gpp's limitations.
$P$
The first example is a recursive macro. The main problem is that, since gpp
evaluates everything, a recursive macro must be very careful about the way
in which recursion is terminated, in order to avoid undefined behavior (most
of the time gpp will simply crash). In particular, relying on a
$I{#if/#else/#endif}$ construct to end recursion is not possible and results
in an infinite loop, because gpp scans user macro calls even in the
unevaluated branch of the conditional block. A safe way to proceed is for
example as follows (we give the example in TeX mode):
$pre{
  $b$define{countdown}{
    $b$if{#1}
    #1...
    $b$define{loop}{$b$countdown}
    $b$else
    Done.
    $b$define{loop}{}
    $b$endif
    $b$loop{$b$eval{#1-1}}
  }
  $b$countdown{10}
}$
The following is an (unfortunately very weak) attempt at implementing 
functional abstraction in gpp (in standard mode). Understanding this
example and why it can't be made much simpler is an exercise left to the 
curious reader.
$pre{
  #mode string "`" "`" "$b$$b$"
  #define ASIS(x) x
  #define SILENT(x) ASIS()
  #define EVAL(x,f,v) SILENT(
    #mode string QQQ "`" "`" "$b$$b$"
    #defeval TEMP0 x
    #defeval TEMP1 (
      $b$#define $b$TEMP2(TEMP0) f
    )
    TEMP1
    )TEMP2(v)
  #define LAMBDA(x,f,v) SILENT(
    #ifneq (v) ()
    #define TEMP3(a,b,c) EVAL(a,b,c)
    #else
    #define TEMP3(a,b,c) $b$LAMBDA(a,b)
    #endif
    )TEMP3(x,f,v)
  #define EVALAMBDA(x,y) SILENT(
    #defeval TEMP4 x
    #defeval TEMP5 y
    ) 
  #define APPLY(f,v) SILENT(
    #defeval TEMP6 ASIS($b$EVA)f
    TEMP6
    )EVAL(TEMP4,TEMP5,v)
}$
This yields the following results:
$pre{
  LAMBDA(z,z+z)
    =$g$ LAMBDA(z,z+z)

  LAMBDA(z,z+z,2)
    =$g$ 2+2

  #define f LAMBDA(y,y*y)
  f
    =$g$ LAMBDA(y,y*y)

  APPLY(f,blah)
    =$g$ blah*blah

  APPLY(LAMBDA(t,t t),(t t))
    =$g$ (t t) (t t)

  LAMBDA(x,APPLY(f,(x+x)),urf)
    =$g$ (urf+urf)*(urf+urf)

  APPLY(APPLY(LAMBDA(x,LAMBDA(y,x*y)),foo),bar)
    =$g$ foo*bar

  #define test LAMBDA(y,`#ifeq y urf
  y is urf#else
  y is not urf#endif
  `)
  APPLY(test,urf)
    =$g$ urf is urf

  APPLY(test,foo)
    =$g$ foo is not urf
}$
%%%%%%%%%%%%%%%%%%%%%% misc stuff at the end %%%%%%%%%%%%%%%%%%%%%%%%
$ifdef{man}$
$S{SEE ALSO}$
m4(1V), cpp(1)
$endif$
$S{AUTHOR}$
Denis Auroux, e-mail: auroux@math.polytechnique.fr. $P$
Please send me e-mail for any comments, questions or suggestions. $P$
Many thanks to Michael Kifer for valuable feedback and for prompting me
to go beyond version 1.0.
$ifdef{html}$
</BODY></HTML>
$endif$
