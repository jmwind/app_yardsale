List of things that are f#$%@

- script tag takes too long to load as it fetches products from shopify. cache the inventory count?
- had to comment out forgery filter in ApplicationController that is bogus
  - check out <input name="authenticity_token" value="<%= form_authenticity_token %>" type="hidden">
- waitlist_controller::create should be able to update new buyers instead of setting each parameter
- javascript clean-up instead of updating dom, get fragment from the server as ajax
- form validation in the waitlist form could be a lot better
- spam handling
- A/B test a pop-up instead of an inline form
- logic around raise restrictions by e-mail
- warning messages on destroy actions, have to add another listener and intercept linke_to action
- sortable columns
- ajax add/remove from tables on all actions
- when an item is actually fulfilled, send an e-mail so that those on the waiting list can come back and buy something else
- add the liquid snippet checker to admin
- instead of "on sale" make "great deal, almost new" (edit template and add to instructions on how to run a yard sale)

in-progress

~ get running on heroku with monitoring and mail
- send store admin an e-mail when someone gets added to the waiting list
- add stats to first page: total $ in inventory, # sold, # reserved, #available
- use link_to everywhere and proper parameter sending
- why is yard_sale.js being loaded into the admin? Move or remove from the asset pipeline?

done

x optimize fetching from ShopifyAPI and limit the number of fields sent over the wire
x add a border around the wait list form