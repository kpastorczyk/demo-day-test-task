# README

# The Story
As Salesman I need to have a system that will allow to create an offer prepared for a particular client. Offer can have multiple products. Every product has its own type, quantity, price and attributes that are specific to the type of product. Salesman should be able to specify quantity, type and attributes of the product. Price should be automatically calculated. Every product has its own calculation mechanism.
There is two types of products:

Mailer Box
* Minimum quantity: 200 
* Maximum quantity: 1000 
* Attributes:
* Width: number 0-200 
* Height: number 0-200 
* Length: number 0-200
* Price: calculated as: (width + height + length) * 0.1 * quantity

Poly Mailer

* Minimum quantity: 50 Maximum quantity: 2000 
* Attributes:
* Width: number 0-200
* Height: number 0-200
* Material: enum [black, transparent]
* Price: calculated as: (width + height) * 0.1 (+ 0.15 if material is transparent)) * quantity

System should validate parameters given by salesman when creating new offer.
System should allow to accept or reject by the particular client
System should be secure, only admins can see the all offers. Particular offer can be seen and accepted/rejected only by the single client that have access to offer.
Role access security system can as simple as possible, but must work (no OAuth 2.0 required ;)
System should be easily extendable in future for adding new products.
System should be also prepared to easily filter and sort offers by product types and attributes in the future (important for data structures).

# Technical requirements

Please create a REST API, that will allow to:
- Create an offer by salesman - List all offers by admin,
- View particular by client,
- Accept offer by client,
- Reject offer by client

Make sure all of these client actions are possible only to the client that received the offer.
Please create an automatic test suite that will cover all endpoints.
Please create a UML Diagram (whiteboard photo is OK too) represents database structure and system flow
Please use relational database to store data with migrations and schema attached to the project.