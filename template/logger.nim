#Templates
#You can think of templates as Nim’s equivalent to the C preprocessor. But templates are written in Nim itself and fit well into the rest of the language.
#templates simply insert their code at the invocation site, working at the level of the abstract syntax tree. They can be used in just the same way as procs.
#Logger
#A common example are loggers, which we looked at in another article already. Consider that you want to have extensive debug logging in your program. A trivial implementation would look like this:

import strutils, times, os 

type Level* {.pure.} = enum 
  debug, info, warn, error, fatal

var logLevel* = Level.debug

proc f(str: string): string =
  str & str
#https://nim-by-example.github.io/varargs/
proc debug(args: varargs[string, f]) = 
  if logLevel <= Level.debug:
    echo "[$# $#]: $#" % [getDateStr(), getClockStr(),join args]

proc expensiveDebuggingInfo: string = 
  sleep(milsecs = 10000)
  result = "Everything looking good!"

var start = epochTime()
echo "Start"
debug expensiveDebuggingInfo()
echo "End"
echo epochTime()-start

#logLevel が debug であれ warn であれ expensiveDebuggingInfo() を評価してしまう．
#logLevel が debug の時にだけ評価して欲しい，warn の時はないもしないで欲しい．というのがモチベーション．

# But let’s stay in Nim-land and use a template instead of a proc to magically fix this:
template debugTemplate*(args: varargs[string, `$`]) =
  if logLevel <= Level.debug:
    const module = instantiationInfo().filename[0 .. ^5]
    echo "[$# $#][$#]: $#" % [getDateStr(), getClockStr(),module, join args]

start =epochTime()
echo "Start"
debugTemplate expensiveDebuggingInfo()
echo "End"
echo epochTime() - start