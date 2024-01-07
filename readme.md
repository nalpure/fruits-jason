# Fruits-Jason

**University Project - Multi-Agent System for Fruit Buying and Selling**

## Introduction

Fruits-Jason is a university project implemented in Jason, an AgentSpeak Java Interpreter. Jason is a BDI-based agent-oriented programming language that allows the development of multi-agent systems. In this project, we simulate a simple marketplace scenario involving four agents: one buyer ("buyer") and three sellers ("alice," "bob," and "charlotte").

## Project Overview

The main goal of Fruits-Jason is to demonstrate a multi-agent system where the buyer agent interacts with seller agents to make optimal purchases based on price.

### Agents

- **Buyer:** Initiates the buying process, gathers information about available products from sellers, and makes purchases based on the best price.

- **Sellers (Alice, Bob, Charlotte):** Provide information about the products they have, including item type, quantity available, and price. Adjust their inventory and money based on successful transactions.

### Buying Process

1. The buyer agent creates a belief about the items it needs to buy.
2. The buyer informs itself about the products offered by each seller, including type, quantity, and price.
3. The buyer purchases each item from the seller with the lowest price for this item.
4. If a seller doesn't have enough units, the buyer buys the remaining quantity from another seller.
5. Money and inventory are updated for both the buyer and the selling agent after each purchase.
6. If the buyer doesn't have enough money, it may sell a liver (if it still has one to spare) to afford the purchase.

## Output

```
[buyer] Let's do grocery!
[buyer] This is what I need: [needed(apple,10),needed(orange,20),needed(banana,50)]
[buyer] ~~~~~~~~~~~~~~ NEXT GOAL: Buy 10 apples ~~~~~~~~~~~~~~
[buyer] Select the best offer amongst the following: [productInfo(apple,3,400,charlotte),productInfo(apple,2,4,bob),productInfo(apple,1,10,alice)]
[buyer] I believe this to be the best offer: productInfo(apple,1,10,alice)
[buyer] ----- PURCHASE: Bought 10 units of type 'apple' for a total price of 10 from Agent alice
[alice] I sold 10 apples and received 10 money for it. I now have a total of 10 money
[buyer] ----- NEW BALANCE: 80
[alice] I am out of stock of apples
[buyer] ~~~~~~~~~~~~~~ NEXT GOAL: Buy 20 oranges ~~~~~~~~~~~~~~
[buyer] Select the best offer amongst the following: [productInfo(orange,6,200,charlotte),productInfo(orange,4,2,alice)]
[buyer] I believe this to be the best offer: productInfo(orange,4,2,alice)
[buyer] ----- PURCHASE: Bought 2 units of type 'orange' for a total price of 8 from Agent alice
[alice] I sold 20 oranges and received 80 money for it. I now have a total of 90 money
[buyer] ----- NEW BALANCE: 72
[alice] I am out of stock of oranges
[buyer] Select the best offer amongst the following: [productInfo(orange,6,200,charlotte)]
[buyer] I believe this to be the best offer: productInfo(orange,6,200,charlotte)
[buyer] Damn, I'll need to sell a kidney...
[buyer] +100 money (new total: 172)
[buyer] I feel lighter...
[buyer] ----- PURCHASE: Bought 18 units of type 'orange' for a total price of 108 from Agent charlotte
[buyer] ----- NEW BALANCE: 64
[buyer] ~~~~~~~~~~~~~~ NEXT GOAL: Buy 50 bananas ~~~~~~~~~~~~~~
[charlotte] I sold 18 oranges and received 108 money for it. I now have a total of 108 money
[buyer] Select the best offer amongst the following: [productInfo(banana,1,20,charlotte),productInfo(banana,3,2000,bob),productInfo(banana,2,10,alice)]
[buyer] I believe this to be the best offer: productInfo(banana,1,20,charlotte)
[buyer] ----- PURCHASE: Bought 20 units of type 'banana' for a total price of 20 from Agent charlotte
[buyer] ----- NEW BALANCE: 44
[charlotte] I sold 50 bananas and received 50 money for it. I now have a total of 158 money
[charlotte] I am out of stock of bananas
[buyer] Select the best offer amongst the following: [productInfo(banana,3,2000,bob),productInfo(banana,2,10,alice)]
[buyer] I believe this to be the best offer: productInfo(banana,2,10,alice)
[buyer] ----- PURCHASE: Bought 10 units of type 'banana' for a total price of 20 from Agent alice
[buyer] ----- NEW BALANCE: 24
[alice] I sold 30 bananas and received 60 money for it. I now have a total of 150 money
[alice] I am out of stock of bananas
[buyer] Select the best offer amongst the following: [productInfo(banana,3,2000,bob)]
[buyer] I believe this to be the best offer: productInfo(banana,3,2000,bob)
[buyer] Damn, I'll need to sell a kidney...
[buyer] +20 money (new total: 44)
[buyer] The doctor said he won't remove my last kidney but gave me some money anyway :)
[buyer] ----- PURCHASE: Bought 20 units of type 'banana' for a total price of 60 from Agent bob
[buyer] ----- NEW BALANCE: -16
[bob] I sold 20 bananas and received 60 money for it. I now have a total of 60 money
```

## How to Run

To run the project, use the following command:

```bash
jason fruit_buyer.mas2j
```
Make sure you have Jason installed. For installation instructions, visit [Jason GitHub Repository](https://github.com/jason-lang/jason).
