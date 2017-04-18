
# Вектори
v1 <- c(1, 2)

2*v1

v2 <- c(5, 4, 3, 2)

v2 - v1



# conditionals, умовні конструкції
if( FALSE ){
  print("Умова виконана!")
}

if( TRUE ){
  print("Умова виконана!")
}


d = 0
if( d > 1 ){
  print("Умова виконана!")
}

# Цикли
for(i in 1:10 ){
  # do anything here!
  print(sin(i))
}


for(i in c(1,5,100) ){
  print(i*i)
}


# Функції
bring_me_bread <- function( type_of_bread ){
  if(type_of_bread == "зелений" ){
    return("зеленого хліба не буває")
  } else {
    return( paste("приніс хліб: ", type_of_bread, sep = " " ))
  }
}

bring_me_bread("синій")
