# DroneTech Marketplace
---
Deployed Link:


Github: 

https://github.com/EstherCsoke/rails-marketplace

---


### Purpose

Drones are a rapidly growing in popularly and many businesses and governmental organisations have begun implementation of their use.With the advancement of technology and many various brands and types of drones on the market, the price of drones is now very affordable.Due to this affordability and accessibility, DRONEtech will provide a great place for individuals to sell and buy drones.
## Why is it a problem that needs solving.

### Sitemap  

### Screen Shots 

### Target Audience


### Functionality / features

### Tech Stack
- Ruby on Rails
- Javascript
- HTML
- Bootstrap 4
- CSS
- Puma
- Postgresql

- Deployment: Heroku



### User Stories

 As a Buyer 
- I want to view a list of drones that are available to purchase so that I can see all the possible options.
- See a visual preview of the drone when scrolling through the list of products so I can make a quicker decision using the visual stimulus .
- See the price of the drone when scrolling through the list of available products so a decision can be made on whether it is affordable.
- To have an option to see more written details of the drone I am interested in to help in the decision process of the purchase. 
- To have an option to checkout and buy the drone listing straight away to same time and help with decision making by not storing everything into a shopping cart.
- To have an option to ask a question to the seller about the drone so that I may learn more about the product.
- To see the listings in the order in which they are posted to see the newest available items.
- To see when the drone listing was created to inform an opinion on the product by its availability time.
- To only have active listings shown to reduce having to contact the seller. 
- To be able to log in and upload information securely so that my private information isn't shown and there's a feeling of security.
- To have clear navigation on the website and not be hit with stimulation overload to confuse site navigation.


As a Seller I want to:
- To create my listing with ease to make the process less stressful.
- To be redirected to my listing so that I may view it after creation to check for errors.
- To upload a photo for my listing so that potential buyers may see my listing.
- To have active listings shown to buyers so that they may have a higher chance of viewing my listing.
- To post a lot of listings so that I could sell more than one drone at a time.
- To edit my listing so that I may make adjustments in case of spelling errors or uploading a better photo, or price change.
- To delete my listing quickly myself without any third party if there is a change of mind or issues


##### As both a Buyer and Seller I want to

- [ ] 16. I have listed and described any third party services that your app will use


###  Wire-Frames


### ERD

----
## High-level components of my app

This drone website is designed around using the MVC design pattern. This framework split into 3 separate layers of the user interface (Views), the control logic (Controllers) and the data model (Model). 

---
The Model for the data layer includes:

- Users - The data of the users information
- Listings - For data regarding item's from the listings
- Categories - The data for the category (drone type)
- Conversations - The conversation between a receiver and sender
- Messages - The data of the conversation messages
---
The Controller includes the following for the receiving requests from the browser and performs the specified actions

* The Listings controller is in charge of crud operations of the listings such as creating a listing for a user, updating the listing, editing the listing, deleting the listing, showing the listing by its ID and displaying all using an index


* The Category controller is in charge of crud operations of the listings such as 


*  The conversations controller creates requests between the sender and receiver and is used to send a notification that there are unread messages


* The messages controller receives requests to create messages between the said user and receiver. 

* A payment controller is created to handle a success page of a listing purchase for the user. 

* The users controller for the user profile

---

The Views is a visual representation of the page that users will see in their browser with usually components of the data from the model shown

Includes the pages for a user to access for the methods and controller. These include the home page, profile page, listings page etc. 

--- 

### Third party services 

Amazon S3 [link](https://aws.amazon.com/).

Amazon S3 was implemented to allow a place to store and retrieve image data of users, as it is an inexpensive storage infrastructure. All objects are stored in a private bucket and allows the deployment of this app to abide by data protection regulations. 

Heroku [link](https://heroku.com/).

Heroku is a cloud platform that manages the hardware and server side of the application. It is used for the deployment of the marketplace.


Devise [link](https://github.com/heartcombo/devise).

Devise was used to create a complete MVC framework for the authentication of users for the marketplace. It allows the application to have more than one user. 

Bootstrap 4 [link](https://getbootstrap.com/docs/4.0/getting-started/introduction/).

Bootstrap 4, a free front-end framework was used in the application for faster and easier website designs. It aids in the development of mobile friendly layouts for the site. It uses both HTML and CSS templates. 

### I have described my projects models in terms of the relationships (active record associations) they have with each other.

User:
* Can have many listings and all listing info will be deleted if the listing is deleted
* Can have an image attached for an avatar
* Can have many conversations and if deleted all the messages will be too

Listings:
* A listing belongs to a user on the site and will only be validated if the title, description, price, picture and category are chosen
* The listing can have only one picture attached
* The listing belongs to a category

Conversation
* A user belongs to a sender with a foreign key of the sender
* A receiver also belongs to the conversation with the foreign key of receiver
* The conversation has many messages in it and the messages will be deleted if the conversation is destroyed.
* 



