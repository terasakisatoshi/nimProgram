var list=["My","Name","Is","Dominik"]
for item in list:
  echo item

#[ 
If you prefer to iterate over each index rather than each item,
you can access an array's bounds using the low and high fields.
 ]#

for i in list.low .. list.high:
  echo list[i]

#[ 
You can also iterate.
]#

for i,item in list:
  echo item,list[i]