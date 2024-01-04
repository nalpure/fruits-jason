// Agent charlotte in project fruit_buyer

/* Initial beliefs and rules */
money(0).

productInfo(apple, 3, 400).
productInfo(orange, 6, 200).
productInfo(banana, 1, 20).
productInfo(acai, 2.90, 23).

/* Initial goals */


/* Plans */

+!sell(Item,Price,Quantity) : True  <-
    // workaround
    .findall(productInfo(Item, Price, Y), productInfo(Item, Price, Y), Products);   
    Products = [productInfo(Item, Price, Available)|_];
    .findall(money(X), money(X), Moneys);
    Moneys = [money(Balance)|_];

    NewBalance = Balance + Quantity * Price;

    -productInfo(Item, Price, Available);
    -money(Balance);
    +money(NewBalance);
    .print("I sold ", Quantity, " ", Item, "s and received ", Quantity * Price, " money for it. I now have a total of ", NewBalance, " money");

    if (Quantity < Available){
        +productInfo(Item, Price, Available - Quantity);
    } else {
        .print("I am out of stock of ", Item, "s");
    }
    .
