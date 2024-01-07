// Agent buyer in project fruit_buyer

/* Initial beliefs and rules */
seller(alice).
seller(bob).
seller(charlotte).

needed(apple, 10).      // should buy from: alice
needed(orange, 20).     // should buy from: alice -> charlotte
needed(banana, 50).    // should buy from: charlotte -> alice -> bob

money(120).
kidney(2).

/* Initial goals */

!lookAround.
!doGrocery.

/* Plans */

// visit all agents
+!lookAround : true <-
    .findall(X,seller(X),AllSellers);
    for (.member(Agent, AllSellers)){
        !askSeller(Agent);
    }.

// get information from agent, safe it as belief
+!askSeller(Agent): true <-
    .send(Agent, askAll, productInfo(Item,Price,Amount), AllStored);
    for ( .member(productInfo(Item,Price,Amount)[source(S)], AllStored) ) {
        +productInfo(Item, Price, Amount, S);
    }.

// create a grocery list
+!doGrocery: true <-
    .wait(1000); // give agent time to receive information first
    .print("Let's do grocery!");
    .findall(needed(X,Y), needed(X,Y), GroceryList);    // create grocery list
    .print("This is what I need: ", GroceryList);
    !doGrocery(GroceryList).

// for each item on the grocery list, buy it and remove it from the list
+!doGrocery([H|T]): true <-
    .wait(1000);
    GroceryList = [H|T];
    for ( .member(needed(Item,Amount), GroceryList) ) {
        .print("~~~~~~~~~~~~~~ NEXT GOAL: Buy ", Amount, " ", Item, "s ~~~~~~~~~~~~~~");
        !buy(Item,Amount);
        -needed(Item,Amount);
    }.

// 0 or negative number of items cannot be bought
+!buy(Item, Amount): Amount <= 0 <- true.

// find the cheapest possible offer for this item, buy as much of it as possible as needed and possible, recursive call with reduced amount
+!buy(Item, Amount): Amount > 0 <-
    .wait(1000);
    .findall(productInfo(Item,X,Y,Z), productInfo(Item,X,Y,Z), Products); // find all beliefs with this item
    .print("Select the best offer amongst the following: ", Products);
    !cheapest_product(Products, MinBelief);
    MinBelief = productInfo(Item, Price, Available, Seller);
    -MinBelief;
    if (Amount >= Available){
        N = Available
    }else{
        N = Amount;
        Left = Available - N;
        +productInfo(Item, Price, Left, Seller);
    }
    Cost = N * Price;

    .findall(money(X), money(X), Moneys);   // workaround
    Moneys = [money(Balance)|_];

    if (Cost > Balance){
        .print("Damn, I'll need to sell a kidney...");
        .findall(kidney(X), kidney(X), Kidneys);   
        Kidneys = [kidney(KidneysLeft)];
        !sell_kidney(KidneysLeft);
    }

    .findall(money(Y), money(Y), Moneys2); 
    Moneys2 = [money(Balance2)|_];
    
    -money(Balance2);
    Balance3 = Balance2 - Cost;
    +money(Balance3);

    // make seller sell the product
    .send(Seller, achieve, sell(Item,Price,Amount) );

    .print("----- PURCHASE: Bought ", N, " units of type '", Item, "' for a total price of ", Cost, " from Agent ", Seller);
    .print("----- NEW BALANCE: ", Balance3);

    !buy(Item, Amount-N)   // recursion
    .


+!sell_kidney(KidneysLeft): KidneysLeft > 1 <-
    -kidney(X);
    New = X-1;
    +kidney(New);
    -money(CurrentBalance);
    NewBalance = CurrentBalance + 100;
    +money(NewBalance);
    .print("+100 money (new total: ", NewBalance, ")");
    .print("I feel lighter...").

+!sell_kidney(KidneysLeft): KidneysLeft == 1 <-
    -money(CurrentBalance);
    NewBalance = CurrentBalance + 20;
    +money(NewBalance);
    .print("+20 money (new total: ", NewBalance, ")");
    .print("The doctor said he won't remove my last kidney but gave me some money anyway :)").

// arguments: list of product infos
+!cheapest_product([H|T], MinBelief) : True <-
    .wait(1000);
    !cheapest_product(T, H, MinBelief);
    .print("I believe this to be the best offer: ", MinBelief).

// arguments: list of product infos, current min price, current min belief, determined min price, determined min belief
+!cheapest_product([], MinBelief, MinBelief).

+!cheapest_product([H|T], CurrentMinBelief, MinBelief) : True <-
    H = productInfo(_,HeadPrice,_,_);
    CurrentMinBelief = productInfo(_,CurrentMinPrice,_,_);
    
    if (HeadPrice < CurrentMinPrice){
        NextCurrentMinBelief = H
    }else{
        NextCurrentMinBelief = CurrentMinBelief
    }
    !cheapest_product(T, NextCurrentMinBelief, MinBelief).

// for debugging purposes
//+B[source(S)] : true <- .print("This belief was added to my belief base: ", B, " from the source ", S).
//-B[source(S)] : true <- .print("This belief was removed from my belief base: ", B, " from the source ", S).