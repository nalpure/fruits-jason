// Agent bob in project fruit_buyer

/* Initial beliefs and rules */
money(0).

productInfo(apple, 2, 4).
productInfo(banana, 3, 2000).
productInfo(tomato, 1, 17).

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
