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

## How to Run

To run the project, use the following command:

```bash
jason fruit_buyer.mas2j
```
Make sure you have Jason installed. For installation instructions, visit [Jason GitHub Repository](https://github.com/jason-lang/jason).
