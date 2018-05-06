# Chapter 3: Dedining Types, Streamlining functions

## Defining a new Data Type

```haskell
data BookInfo = Book Int String [String]
                deriving (Show)
```

* **BookInfo** is a *type constructor*
* **Book** is a *value constructor* (or data constructor)
* **Int** **String** and **[String]** are the *components* of the type

```haskell
Book :: Int -> String -> [String] -> BookInfo
```

A value constructor is just another function: one that happens to create and return a new value of the type we desire.

## Naming Types and Values

We can use the same name for type constructors and value constructors. Indeed, we use a type constructor only in a type declaration or a type signature, whereas we use a value constructor in actual code. Hence, there is no ambiguity if they have the same name.

## Algebraic Data Types

```haskell
data Bool = False | True
```

An *algebraic data type* can have more than one value constructor. Each value constructor is referred to as *alternative* or *case*. We can use any one of the alternatives to create a value of that type.

*All* of the data types that we define with the **data** keyword are algebraic data types.

## Pattern Matching

```haskell
myNot True = False
myNot False = True
```

* If the type has more than one value constructor, we need to be able to tell which
value constructor was used to create the value
* If the value constructor has data components, we need to be able to extract those
values

* Pattern matching* lets us do both things. We can define a functions as a *series of equations*: we begin by trying to *match* the pattern in the first equation and we keep trying until the match *succeeds*. Then the variables are *bound to* the constructor's arguments.

Because pattern matching acts as the inverse of construction, it's sometimes referred to as *deconstruction*.

## Parameterized Types

```haskell
data Maybe a = Just a | Nothing
```

We can add polymorphism to our own types by introducing type variables into a type declaration.

## Introducing Local Variables

```haskell
lend amount balance = let reserve = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance
```

Within the body of a function, we can introduce new local variables using a **let** expression. A name in a **let** block is bound to an *expression*, not to a *value*: we refer to it as a *let-bound* variable. Indeed, since Haskell is a lazy language, the expression associated with a name won't actually be evaluated until it's needed.


## The where Clause

```haskell
lend amount balance =  if amount < reserve * 0.5
                       then Just newBalance
                       else Nothing
   where reserve    = 100
         newBalance = balance - amount
```

The **where** clause is another mechanism to introduce local variables. The definitions in a **where** clause apply to the code that *precedes* it.

## Local Functions, Global Variables

```haskell
pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
    where plural 0 = "no " ++ word ++ "s"
          plural 1 = "one " ++ word
          plural n = show n ++ " " ++ word ++ "s"

itemName = "Weighted Companion Cube"
```

We have defined a local function **plural** that consits of several equations and a global variable **itemName**.

## The case expression

```haskell
fromMaybe defval wrapped =
    case wrapped of
        Nothing    -> defval
        Just value -> value
```

The **case** keyword is followed by an arbitrary expression; the pattern match is performed against the result of this expression. The **of** keyword signifies the end of the expression and the beginning of the block of patterns and expressions.
