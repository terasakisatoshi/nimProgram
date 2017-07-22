#proc is called method or functions by some languages

proc ansYes(question: string): bool =
  echo question, "(y/n)"
  while true:
    case readLine(stdin)
      of "y","Y","yes","Yes": return true
      of "n","N","no","No":return false
      else : echo "Please be clear: yes or no"

if ansYes("Should I delete all your important files?"):
  echo "I am sorry Dave, I'm afraid I can't do that."
else:
  echo "I think you know what the problem is just as well as I do"