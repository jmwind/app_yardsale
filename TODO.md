List of things that are f#$%@

- script tag takes too long to load as it fetches products from shopify. cache the inventory count?
- had to comment out forgery filter in ApplicationController that is bogus
  - check out <input name="authenticity_token" value="<%= form_authenticity_token %>" type="hidden">
- waitlist_controller::create should be able to update new buyers instead of setting each parameter
- javascript clean-up instead of updating dom, get fragment from the server as ajax
- form validation in the waitlist form could be a lot better
- add a border around the wait list form
- spam handling
- why is yard_sale.js being loaded into the admin? Move or remove from the asset pipeline?
- A/B test a pop-up instead of an inline form
- logic around raise restrictions by e-mail
- warning messages on destroy actions, have to add another listener and intercept linke_to action
- use link_to everywhere and proper parameter sending
- sortable columns