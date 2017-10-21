import os

proc main()=
  var fout : File = open("test.txt",FileMode.fmWrite)
  block:
    defer:
      close(fout)
      echo "closed"
    fout.writeLine "Hello World"
    fout.writeLine "from Nim"

  block:
    var fin : File = open("test.txt",FileMode.fmread)
    defer:
      close(fin)
      echo "closed"
    var line :TaintedString
    while fin.readLine(line):
      echo line

  #echo g.readLine()

when isMainModule:
  main()