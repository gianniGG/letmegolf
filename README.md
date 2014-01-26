Letmegolf
---

Prototype golfing community web app

Started in pure rails, this concept is now going to integrate backbone.js as part of the design process,
and restart the MVP. 

Nevertheless, some interesting features:

|User |Messages |Groups |
|:----- |------ |------- |----- |
|User sign up and sign in, implemented manually, with the use of bcrypt for secure sign in. User passwords and encrypted and saved in a password_digest column| Users are able to message each other, and have an inbox and sent messages page, to view their message history | Users can join one group (an 'affiliation') and add users to the group, in addition, they can select admins to administrate the group| 
