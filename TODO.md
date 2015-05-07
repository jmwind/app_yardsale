List of things that are f#$%@

- had to comment out forgery filter in ApplicationController that is bogus
  - check out <input name="authenticity_token" value="<%= form_authenticity_token %>" type="hidden">
- waitlist_controller::create should be able to update new buyers instead of setting each parameter
- javascript clean-up instead of updating dom, get fragment from the server as ajax
- form validation in the waitlist form could be a lot better
- spam handling
- A/B test a pop-up instead of an inline form
- logic around raise restrictions by e-mail
- sortable columns
- ajax add/remove from tables on all actions
- when an item is actually fulfilled, send an e-mail so that those on the waiting list can come back and buy something else
- add the liquid snippet checker to admin
- use a job to collect stats and cache in the app. Include timestamp and ability to refresh with webhooks changes
- why is yard_sale.js being loaded into the admin? Move or remove from the asset pipeline?
- webhooks authentication and finding the right shop based on the session

in-progress

- warning messages on destroy actions to use shopify native dialogs, have to add another listener and intercept linke_to action
- use link_to everywhere and proper parameter sending

done

x send store admin an e-mail when someone gets added to the waiting list (add product names to cache or emails are bogus. Add link to waitinglist from mail)
x instead of "on sale" make "great deal, almost new" (edit template and add to instructions on how to run a yard sale)
x add stats to first page: total $ in inventory, # sold, # reserved, #available
x get running on heroku
x work out asset paths and heroku (for now, have to re-install app each time yard_sale.js changes so that script tag reference is updated)
  - https://bibwild.wordpress.com/2014/10/02/non-digested-asset-names-in-rails-4-your-options/
x optimize fetching from ShopifyAPI and limit the number of fields sent over the wire
x add a border around the wait list form
x script tag takes too long to load as it fetches products from shopify. cache the inventory count?